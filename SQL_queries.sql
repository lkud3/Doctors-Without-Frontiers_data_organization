--Error table
drop table tracker_log

create table tracker_log(
    err_loc varchar2(100),
    err_msg varchar2(4000),
    err_date date not null
);


--View for additional calculations
create or replace view tracker_info as
select 
	a.rec_id,
    substr(mem.memb_name,1, instr(mem.memb_name,',')-1) memb_name_full,
    substr(mem.memb_name,instr(mem.memb_name,',')+1, instr(mem.memb_name,'.')-instr(mem.memb_name,',')) memb_title,
	c.memb_role memb_role_f,
    c.memb_qual memb_qual_f,
    t.type mission_type_f,
    mis.end_date - mis.start_date mission_duration,
    (mis.mission_dist/1000)*4.78*loc.travel_index travel_cost
from mission_tracker a
join members mem
on mem.memb_id = a.memb_id
join class c
on mem.class_id = c.class_id
join missions mis
on a.mission_id = mis.mission_id
join type t
on t.type = mis.mission_type
join locations loc
on loc.loc_id = mis.loc_id;

select *
from tracker_info
order by 1

--Function for final view
create or replace function f_total_cost_calc(v_rec_id in mission_tracker.rec_id%TYPE) 
return number 
is
  v_msg tracker_log.err_msg%type;
  v_total_cost number :=0;
begin
  select (loc.food_lodge_cost*a.mission_duration)+(mem.memb_fee*c.qual_index)*loc.fee_index*a.mission_duration+
                                        (t.supply_cost+c.role_index)+a.travel_cost
  into v_total_cost
  from tracker_info a
  join members mem
  on mem.memb_name = a.memb_name_full || ','|| a.memb_title
  join class c
  on mem.class_id = c.class_id
  join missions mis
  on mis.mission_id = 
  (
    select mission_id
    from mission_tracker mt
    where mt.rec_id = a.rec_id
  )
  join type t
  on t.type = mis.mission_type
  join locations loc
  on loc.loc_id = mis.loc_id
  where v_rec_id=a.rec_id;

  return v_total_cost;
exception
  when no_data_found then
    insert into tracker_log values ('f_total_cost_calc', 'No data found.', sysdate);
    dbms_output.put_line('Error: '|| v_rec_id || ' is not found.');
end f_total_cost_calc;


--Finalized view
create or replace view tracker_info_f as
select 
	a.*,
    f_total_cost_calc(a.rec_id) total_cost
from tracker_info a;

select *
from tracker_info_f
order by 1



--Query 1
select memb_title||' '||memb_name_full||', id number '||substr(mem.memb_id, instr(mem.memb_id,'_')+1, 4)||', is a '||
       decode(memb_role_f, 'NUR', 'nurse', 'RES', 'rescuer', 'PHY', 'physician', 'TEC', 'technician', 'SUP', 'support')||' on a '||
       decode(mission_type_f, 'HUM', 'humanitarian', 'RES', 'rescue', 'MED', 'medical')||' mission number '||
       substr(mis.mission_id, instr(mis.mission_id,'_')+1, 4)||' regarding the '||loc.loc_name||' with "'||mis.mission_status||'" status.' as Information
from tracker_info_f a
join members mem
on mem.memb_name = a.memb_name_full || ','|| a.memb_title
join missions mis
  on mis.mission_id = 
  (
    select mission_id
    from mission_tracker mt
    where mt.rec_id = a.rec_id
  )
join locations loc
on loc.loc_id = mis.loc_id;


--Query 2 (Triggers)
create or replace trigger t_mistrack_upd
    before insert or update of memb_id, mission_id on mission_tracker
    for each row
declare
    count_reps number := 0;
    wrong_data exception;
begin 
    select count(*)
    into count_reps
    from mission_tracker
    where (memb_id = :new.memb_id or memb_id = :new.mission_id) and (mission_id = :new.memb_id or mission_id = :new.mission_id) and rec_id != :new.rec_id;

    if count_reps is not null then
        raise wrong_data;
    end if;
    
    if inserting then
        :new.memb_id := lower(:new.memb_id);
        :new.mission_id := lower(:new.mission_id);
    end if;
exception
  when wrong_data then
    insert into tracker_log values ('t_mistrack_upd', 'Wrong data input.', sysdate);
    dbms_output.put_line('Error: Wrong data input.');
  when no_data_found then
    insert into tracker_log values ('t_mistrack_upd', 'No data found.', sysdate);
    dbms_output.put_line('Error: No data found.');
  when too_many_rows then
    insert into tracker_log values ('t_mistrack_upd', 'Too many rows.', sysdate);
    dbms_output.put_line('Error: Too many rows.');
  when others then
    insert into tracker_log values ('t_mistrack_upd', 'Some problem occured.', sysdate);
    dbms_output.put_line('Error: Some problem occured.');
end t_mistrack_upd;

update mission_tracker set memb_id = 'mem_122' where rec_id = 3
insert into mission_tracker values(null)

select * 
from tracker_log

--Query 3
select mis.mission_id, sum(decode(a.memb_title, 'Mr.', 1, 0)) Mr, sum(decode(a.memb_title, 'Ms.', 1, 0)) Ms
from tracker_info_f a
join missions mis
  on mis.mission_id = 
  (
    select mission_id
    from mission_tracker mt
    where mt.rec_id = a.rec_id
  )
group by mis.mission_id
having sum(decode(a.memb_title, 'Ms.', 1, 0)) > sum(decode(a.memb_title, 'Mr.', 1, 0))
order by 3 desc


-- Query 4
select a.mission_id, t.type, count(a.mission_id) qty, t.ppl_req
from mission_tracker a
join missions mis
on a.mission_id = mis.mission_id
join type t
on t.type = mis.mission_type
group by a.mission_id, t.type, t.ppl_req
having count(a.mission_id) < t.ppl_req
order by 1

--Using PL/SQL
declare
v_mission_id mission_tracker.mission_id%TYPE;
v_ppl number;
v_ppl_req type.ppl_req%TYPE;
cursor c_mission_ppl is
        select a.mission_id, count(a.mission_id) ppl, t.ppl_req
        from mission_tracker a
        join missions mis
        on a.mission_id = mis.mission_id
        join type t
        on t.type = mis.mission_type
        group by a.mission_id, t.type, t.ppl_req
        order by 1;
begin 
    open c_mission_ppl;
    loop 
       fetch c_mission_ppl
       into v_mission_id, v_ppl, v_ppl_req;
       exit when c_mission_ppl%notfound;
       if (v_ppl < v_ppl_req) then
            dbms_output.put_line('Mission '|| v_mission_id || ' has '
                                 || v_ppl || ' operators in charge, which is not enough.');
       elsif (v_ppl > v_ppl_req) then
            dbms_output.put_line('Mission '|| v_mission_id || ' has '
                                 || v_ppl || ' operators in charge, which is more than enough.');
       else
            dbms_output.put_line('Mission '|| v_mission_id || ' has '
                                 || v_ppl || ' operators in charge, which is exactly enough.');
        end if;
    end loop;
    close c_mission_ppl;
end;


-- Query 5
select mis.mission_status, count(distinct a.mission_id) number_of_missions, count(distinct a.memb_id) number_of_members, sum(inf.total_cost) total_cost
from mission_tracker a
join tracker_info_f inf
on inf.rec_id = a.rec_id
join missions mis
on a.mission_id = mis.mission_id
where inf.memb_title = 'Ms.'
group by mis.mission_status
order by decode(mis.mission_status, 'Normal', 1, 'Challenges', 2, 'Caution', 3);

-- Using procedure
create or replace procedure proc_status_inf (
     v_mission_status in missions.mission_status%type,
     v_memb_title in tracker_info_f.memb_title%type,
     number_of_missions out number,
     number_of_members out number,
     total_cost out number)
as 
begin 
   select count(distinct a.mission_id), count(distinct a.memb_id), sum(inf.total_cost)
   into number_of_missions, number_of_members, total_cost
   from mission_tracker a
   join tracker_info_f inf
   on inf.rec_id = a.rec_id
   join missions mis
   on a.mission_id = mis.mission_id
   where inf.memb_title = v_memb_title and mis.mission_status = v_mission_status;

   if v_mission_status not in ('Normal', 'Challenges', 'Caution')
   then
        insert into tracker_log values ('proc_status_inf', 'Wrong mission status name.', sysdate);
        dbms_output.put_line('Error: Wrong mission status name.');
   end if;
   if v_memb_title not in ('Mr.', 'Ms.')
   then 
        insert into tracker_log values ('proc_status_inf', 'The title input is wrong.', sysdate);
        dbms_output.put_line('Error: The title input is wrong.');
   end if;
exception
  when no_data_found then
    insert into tracker_log values ('proc_status_inf', 'No data found.', sysdate);
    dbms_output.put_line('Error: No data found.');
  when others then
    insert into tracker_log values ('proc_status_inf', 'Some problem occured.', sysdate);
    dbms_output.put_line('Error: Some problem occured.');
end;

declare 
   number_of_missions number;
   number_of_members number;
   total_cost number;
begin
   for a in (select distinct mis.mission_status as mis_stat, tf.memb_title as mem_tit
                from tracker_info_f tf
                join missions mis
                on mis.mission_id = 
                (
                    select mission_id
                    from mission_tracker mt
                    where mt.rec_id = tf.rec_id
                ))
            loop 
                proc_status_inf(a.mis_stat, a.mem_tit, number_of_missions, number_of_members, total_cost);
                if (a.mem_tit = 'Ms.') then
                    dbms_output.put_line('There are ' || number_of_missions || ' missions of Normal status with ' || number_of_members || ' female members in total with total cost of ' || total_cost || '.');
                else 
                    dbms_output.put_line('There are ' || number_of_missions || ' missions of Normal status with ' || number_of_members || ' male members in total with total cost of ' || total_cost || '.');
                end if;
            end loop;
   exception
      when others 
      then
        insert into tracker_log values ('proc_status_inf', 'Some error occurred.', sysdate);
        dbms_output.put_line('Error: Some problem occured.');
end;


--Query 6 (2D tabulation)
select mis.mission_type, sum(decode(to_char(mis.start_date, 'yyyy'), 2019, a.total_cost, 0)) year_2019, sum(decode(to_char(mis.start_date, 'yyyy'), 2020, a.total_cost, 0)) year_2020,
                     sum(decode(to_char(mis.start_date, 'yyyy'), 2021, a.total_cost, 0)) year_2021, sum(decode(to_char(mis.start_date, 'yyyy'), 2022, a.total_cost, 0)) year_2022,
                     sum(decode(to_char(mis.start_date, 'yyyy'), 2023, a.total_cost, 0)) year_2023
from tracker_info_f a
join missions mis
on mis.mission_id = 
(
    select mission_id
    from mission_tracker mt
    where mt.rec_id = a.rec_id
)
group by mis.mission_type
order by 1;


-- Hierarchical
select level, lpad(' ', 2*(level-1), '*')||substr(memb_name, instr(memb_name, ' ')+1, instr(memb_name,',')-instr(memb_name, ' ')-1) "Member last name", memb_id, manager_id
from members
start with manager_id = 'null'
connect by manager_id = prior memb_id
order siblings by substr(memb_name, instr(memb_name, ' ')+1, instr(memb_name,',')-instr(memb_name, ' ')-1)


select sys_connect_by_path(substr(memb_name, instr(memb_name, ' ')+1, instr(memb_name,',')-instr(memb_name, ' ')-1), '#') as "Hierarchy chain"
from members
start with manager_id = 'null'
connect by manager_id = prior memb_id


select e2.memb_name, e2.memb_fee, 
(
    select sum(e1.memb_fee)
    from members e1
    start with e1.memb_id = e2.memb_id
    connect by e1.manager_id = prior e1.memb_id
) "Total Fee"
from members e2






