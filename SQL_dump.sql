drop table Mission_Tracker cascade constraints;
drop table members cascade constraints;
drop table class cascade constraints;
drop table missions cascade constraints;
drop table locations cascade constraints;
drop table type cascade constraints;

create table type (
type varchar2(30),
supply_cost number,
ppl_req number,
constraint type_pk primary key (type)
);

insert into type values ('MED', 849, 9);
insert into type values ('HUM', 843, 15);
insert into type values ('RES', 511, 16);


create table locations (
loc_id varchar2(30),
loc_name varchar2(30),
fee_index number,
food_lodge_cost number,
travel_index number,
constraint locations_pk primary key (loc_id)
);

insert into locations values ('loc_300', 'Conflict Zone', 1.3, 288, 1.5);
insert into locations values ('loc_214', 'Natural Disaster', 1.1, 165, 1.2);
insert into locations values ('loc_551', 'Civil Accident', 1, 209, 1);
insert into locations values ('loc_864', 'Epidemic Breach', 1.2, 181, 1);


create table missions (
mission_id varchar2(30),
loc_id varchar2(30),
mission_dist number,
start_date date,
end_date date,
mission_type varchar2(30),
mission_status varchar2(30),
constraint missions_pk primary key (mission_id)
);

insert into missions values ('mis_3084', 'loc_864', 153258, '16-Oct-2020', '07-Nov-2020', 'MED', 'Challenges');
insert into missions values ('mis_9300', 'loc_551', 76610, '20-Sep-2020', '26-Sep-2020', 'HUM', 'Normal');
insert into missions values ('mis_7107', 'loc_551', 175488, '23-Aug-2019', '04-Sep-2019', 'HUM', 'Challenges');
insert into missions values ('mis_4251', 'loc_864', 153243, '08-Apr-2020', '28-Apr-2020', 'RES', 'Challenges');
insert into missions values ('mis_6740', 'loc_214', 11781, '30-Jan-2020', '16-Feb-2020', 'HUM', 'Normal');
insert into missions values ('mis_4263', 'loc_551', 37217, '01-Dec-2019', '15-Dec-2019', 'HUM', 'Caution');
insert into missions values ('mis_8466', 'loc_551', 154111, '19-May-2023', '20-May-2023', 'RES', 'Challenges');
insert into missions values ('mis_6839', 'loc_864', 146253, '15-Jun-2023', '17-Jun-2023', 'RES', 'Normal');
insert into missions values ('mis_3616', 'loc_864', 173890, '25-Jan-2021', '15-Feb-2021', 'MED', 'Challenges');
insert into missions values ('mis_6034', 'loc_300', 133496, '06-Nov-2021', '23-Nov-2021', 'MED', 'Normal');
insert into missions values ('mis_1868', 'loc_214', 144507, '25-Jan-2022', '24-Feb-2022', 'HUM', 'Challenges');
insert into missions values ('mis_7753', 'loc_551', 80734, '08-Dec-2021', '10-Dec-2021', 'RES', 'Normal');
insert into missions values ('mis_3657', 'loc_214', 195903, '07-Nov-2021', '09-Nov-2021', 'HUM', 'Caution');
insert into missions values ('mis_2151', 'loc_864', 69094, '28-Oct-2022', '26-Nov-2022', 'HUM', 'Challenges');
insert into missions values ('mis_1133', 'loc_864', 138644, '04-Jun-2021', '25-Jun-2021', 'MED', 'Caution');


create table class (
class_id varchar2(30),
memb_role varchar2(30),
memb_qual varchar2(30),
qual_index number,
role_index number,
constraint class_pk primary key (class_id)
);

insert into class values ('alpha_3', 'PHY', 'LO', 1, 50);
insert into class values ('alpha_2', 'PHY', 'ME', 1.1, 50);
insert into class values ('alpha_1', 'PHY', 'HI', 1.2, 50);
insert into class values ('gamma_3', 'NUR', 'LO', 1, 20);
insert into class values ('gamma_2', 'NUR', 'ME', 1.1, 20);
insert into class values ('gamma_1', 'NUR', 'HI', 1.2, 20);
insert into class values ('bravo_3', 'TEC', 'LO', 1, 30);
insert into class values ('bravo_2', 'TEC', 'ME', 1.1, 30);
insert into class values ('bravo_1', 'TEC', 'HI', 1.2, 30);
insert into class values ('omega_3', 'SUP', 'LO', 1, 0);
insert into class values ('omega_2', 'SUP', 'ME', 1.1, 0);
insert into class values ('omega_1', 'SUP', 'HI', 1.2, 0);
insert into class values ('beta_3', 'RES', 'LO', 1, 40);
insert into class values ('beta_2', 'RES', 'ME', 1.1, 40);
insert into class values ('beta_1', 'RES', 'HI', 1.2, 40);


create table members (
memb_id varchar2(30),
memb_name varchar2(30),
memb_fee number,
memb_age number,
class_id varchar2(30),
manager_id varchar2(30),
constraint members_pk primary key (memb_id)
);

insert into members values ('mem_100', 'Andy Dutch,Mr.', 355, 28, 'gamma_3', 'null');
insert into members values ('mem_101', 'Alan Gay,Mr.', 286, 29, 'omega_3', 'null');
insert into members values ('mem_102', 'Marge Murphy,Ms.', 228, 55, 'alpha_3', 'null');
insert into members values ('mem_103', 'Sierra Nichols,Ms.', 379, 40, 'beta_1', 'null');
insert into members values ('mem_104', 'Stewart Lockwood,Mr.', 488, 31, 'beta_1', 'null');
insert into members values ('mem_105', 'Melanie Von Neumann,Ms.', 298, 28, 'alpha_2', 'null');
insert into members values ('mem_106', 'Simon Head,Mr.', 493, 24, 'bravo_3', 'null');
insert into members values ('mem_107', 'Francis Rand,Mr.', 231, 48, 'bravo_2', 'null');
insert into members values ('mem_108', 'Renee Monet,Ms.', 356, 51, 'omega_1', 'null');
insert into members values ('mem_109', 'Ernie Napier,Mr.', 240, 57, 'gamma_3', 'null');
insert into members values ('mem_110', 'Audria Chisholm,Ms.', 346, 57, 'beta_2', 'null');
insert into members values ('mem_111', 'Jessie Osborne,Ms.', 239, 40, 'alpha_1', 'mem_100');
insert into members values ('mem_112', 'Andrea Baker,Ms.', 238, 35, 'gamma_3', 'mem_100');
insert into members values ('mem_113', 'Tony Amos,Mr.', 228, 27, 'alpha_1', 'mem_111');
insert into members values ('mem_114', 'Youlanda Lyon,Ms.', 467, 23, 'omega_2', 'mem_111');
insert into members values ('mem_115', 'Rossie Padgett,Ms.', 265, 23, 'beta_1', 'mem_111');
insert into members values ('mem_116', 'Alejandrina Gallegos,Ms.', 283, 54, 'beta_1', 'mem_112');
insert into members values ('mem_117', 'Son Rembrandt,Mr.', 239, 34, 'beta_2', 'mem_112');
insert into members values ('mem_118', 'Sanda Reese,Ms.', 221, 63, 'bravo_1', 'mem_112');
insert into members values ('mem_119', 'Waneta Zamora,Ms.', 376, 69, 'bravo_2', 'mem_101');
insert into members values ('mem_120', 'Nu Ly,Ms.', 213, 47, 'bravo_1', 'mem_101');
insert into members values ('mem_121', 'Armida Warren,Ms.', 470, 35, 'bravo_1', 'mem_119');
insert into members values ('mem_122', 'Branden Stringer,Mr.', 334, 67, 'beta_3', 'mem_119');
insert into members values ('mem_123', 'Hector Glover,Mr.', 205, 62, 'gamma_2', 'mem_119');
insert into members values ('mem_124', 'Hailey Woodward,Ms.', 404, 41, 'beta_1', 'mem_120');
insert into members values ('mem_125', 'Florene Suarez,Ms.', 222, 19, 'beta_2', 'mem_120');
insert into members values ('mem_126', 'Daniel Mcintosh,Mr.', 258, 61, 'beta_2', 'mem_120');
insert into members values ('mem_127', 'Marina Holt,Ms.', 290, 27, 'gamma_2', 'mem_102');
insert into members values ('mem_128', 'Nicole Gill,Ms.', 337, 21, 'alpha_3', 'mem_102');
insert into members values ('mem_129', 'Isreal Siegel,Mr.', 242, 29, 'alpha_2', 'mem_127');
insert into members values ('mem_130', 'Antigone Chacon,Ms.', 475, 62, 'omega_2', 'mem_127');
insert into members values ('mem_131', 'Jaime Helms,Mr.', 486, 52, 'gamma_1', 'mem_127');
insert into members values ('mem_132', 'Leland Hebert,Mr.', 377, 46, 'beta_1', 'mem_128');
insert into members values ('mem_133', 'Benedict Colbert,Mr.', 351, 64, 'bravo_1', 'mem_128');
insert into members values ('mem_134', 'Neville Leyva,Mr.', 314, 26, 'omega_1', 'mem_128');
insert into members values ('mem_135', 'Bok Mortimer,Ms.', 467, 65, 'alpha_3', 'mem_103');
insert into members values ('mem_136', 'Refugio Woodard,Mr.', 267, 50, 'omega_1', 'mem_103');
insert into members values ('mem_137', 'Bonita Watkins,Ms.', 476, 39, 'bravo_2', 'mem_135');
insert into members values ('mem_138', 'Art Hobbs,Mr.', 378, 64, 'beta_1', 'mem_135');
insert into members values ('mem_139', 'Gustaf Helm,Mr.', 322, 59, 'bravo_3', 'mem_135');
insert into members values ('mem_140', 'Boyd Sheppard,Mr.', 352, 43, 'gamma_2', 'mem_136');
insert into members values ('mem_141', 'Faith Bingham,Ms.', 432, 59, 'gamma_1', 'mem_136');
insert into members values ('mem_142', 'Juliette Boucher,Ms.', 277, 68, 'bravo_3', 'mem_104');
insert into members values ('mem_143', 'Bart Mcneil,Mr.', 315, 47, 'gamma_1', 'mem_104');
insert into members values ('mem_144', 'Josue Epps,Mr.', 432, 50, 'alpha_1', 'mem_142');
insert into members values ('mem_145', 'Melissa Mckay,Ms.', 499, 43, 'bravo_1', 'mem_142');
insert into members values ('mem_146', 'Aline Dorsey,Ms.', 200, 41, 'bravo_2', 'mem_143');
insert into members values ('mem_147', 'Leland Coffman,Mr.', 372, 32, 'omega_3', 'mem_143');
insert into members values ('mem_148', 'Alesha Spangler,Ms.', 384, 19, 'omega_2', 'mem_143');
insert into members values ('mem_149', 'Maryln Rossi,Ms.', 484, 38, 'gamma_1', 'mem_105');
insert into members values ('mem_150', 'Nanette Carr,Ms.', 308, 61, 'alpha_2', 'mem_105');
insert into members values ('mem_151', 'Meggan Benavides,Ms.', 294, 46, 'beta_2', 'mem_149');
insert into members values ('mem_152', 'Cinthia Arthur,Ms.', 411, 65, 'bravo_2', 'mem_149');
insert into members values ('mem_153', 'Eunice Belzer,Ms.', 476, 57, 'omega_1', 'mem_149');
insert into members values ('mem_154', 'Karol Xiong,Ms.', 332, 34, 'bravo_3', 'mem_150');
insert into members values ('mem_155', 'Kenyetta Klein,Ms.', 223, 37, 'bravo_2', 'mem_150');
insert into members values ('mem_156', 'Christal McGowan,Ms.', 282, 55, 'gamma_1', 'mem_150');
insert into members values ('mem_157', 'Elmer Howe,Mr.', 442, 51, 'gamma_3', 'mem_150');
insert into members values ('mem_158', 'Ross Santana,Mr.', 212, 46, 'beta_3', 'mem_106');
insert into members values ('mem_159', 'Pedro Chen,Mr.', 201, 55, 'beta_1', 'mem_106');
insert into members values ('mem_160', 'Temika Lawrence,Ms.', 492, 55, 'alpha_3', 'mem_158');
insert into members values ('mem_161', 'Willie Marymount,Mr.', 447, 24, 'alpha_2', 'mem_158');
insert into members values ('mem_162', 'Bobby Skaggs,Mr.', 348, 40, 'beta_1', 'mem_159');
insert into members values ('mem_163', 'Douglass Mckenzie,Mr.', 232, 61, 'bravo_2', 'mem_159');
insert into members values ('mem_164', 'Kit Eubanks,Ms.', 347, 39, 'bravo_1', 'mem_159');
insert into members values ('mem_165', 'Ava Kincaid,Ms.', 366, 68, 'alpha_2', 'mem_107');
insert into members values ('mem_166', 'Sanjuana Mclaughlin,Ms.', 436, 46, 'beta_3', 'mem_107');
insert into members values ('mem_167', 'Nick Sanderson,Mr.', 334, 57, 'omega_2', 'mem_165');
insert into members values ('mem_168', 'Chi Pena,Mr.', 391, 62, 'beta_3', 'mem_165');
insert into members values ('mem_169', 'Willetta Boucher,Ms.', 391, 39, 'beta_2', 'mem_166');
insert into members values ('mem_170', 'Emory Diaz,Mr.', 382, 30, 'beta_2', 'mem_166');
insert into members values ('mem_171', 'Bjorn Clayton,Mr.', 434, 29, 'alpha_3', 'mem_166');
insert into members values ('mem_172', 'Lorelei Kendrick,Ms.', 386, 50, 'gamma_2', 'mem_108');
insert into members values ('mem_173', 'Vickie Stanford,Ms.', 313, 29, 'beta_3', 'mem_108');
insert into members values ('mem_174', 'Khalilah Holcomb,Ms.', 398, 44, 'omega_1', 'mem_108');
insert into members values ('mem_175', 'Keith Stieglitz,Mr.', 248, 64, 'beta_1', 'mem_172');
insert into members values ('mem_176', 'Mckinley Cervantes,Mr.', 218, 52, 'alpha_2', 'mem_172');
insert into members values ('mem_177', 'Judy Davila,Ms.', 260, 43, 'alpha_3', 'mem_172');
insert into members values ('mem_178', 'Johnathon Lawrence,Mr.', 379, 48, 'alpha_3', 'mem_172');
insert into members values ('mem_179', 'Refugio Mcfadden,Mr.', 289, 18, 'omega_3', 'mem_173');
insert into members values ('mem_180', 'Wyatt Feliciano,Mr.', 470, 46, 'gamma_2', 'mem_173');
insert into members values ('mem_181', 'Tony Land,Mr.', 288, 40, 'bravo_1', 'mem_173');
insert into members values ('mem_182', 'Nathan Wang,Mr.', 384, 39, 'omega_2', 'mem_174');
insert into members values ('mem_183', 'Rodger Sykes,Mr.', 328, 41, 'alpha_3', 'mem_174');
insert into members values ('mem_184', 'Kaye Lockheed,Ms.', 473, 59, 'bravo_2', 'mem_174');
insert into members values ('mem_185', 'Maynard Franklin,Mr.', 488, 54, 'bravo_1', 'mem_109');
insert into members values ('mem_186', 'Eloise Prado,Ms.', 466, 37, 'gamma_3', 'mem_109');
insert into members values ('mem_187', 'Erol Goss,Mr.', 431, 26, 'beta_3', 'mem_185');
insert into members values ('mem_188', 'Johna Delong,Ms.', 295, 62, 'gamma_1', 'mem_185');
insert into members values ('mem_189', 'Clemence Wall,Mr.', 288, 53, 'omega_3', 'mem_185');
insert into members values ('mem_190', 'Jules Conrad,Mr.', 356, 29, 'omega_2', 'mem_186');
insert into members values ('mem_191', 'Dion Bray,Mr.', 468, 27, 'gamma_2', 'mem_186');
insert into members values ('mem_192', 'Florinda Chong,Ms.', 317, 26, 'bravo_3', 'mem_186');
insert into members values ('mem_193', 'Eliah Aviles,Mr.', 231, 69, 'gamma_3', 'mem_110');
insert into members values ('mem_194', 'Astarte Peterson,Ms.', 496, 42, 'bravo_2', 'mem_110');
insert into members values ('mem_195', 'Natalia Dooley,Ms.', 314, 64, 'bravo_3', 'mem_193');
insert into members values ('mem_196', 'Mercedes Bryan,Ms.', 221, 47, 'gamma_1', 'mem_193');
insert into members values ('mem_197', 'Eleanor Lockheed,Ms.', 274, 47, 'beta_1', 'mem_193');
insert into members values ('mem_198', 'Gene Mc Dougal,Mr.', 348, 40, 'alpha_3', 'mem_194');
insert into members values ('mem_199', 'Margaret Pacheco,Ms.', 419, 34, 'gamma_2', 'mem_194');
insert into members values ('mem_200', 'Jonas Stein,Mr.', 252, 43, 'gamma_2', 'mem_194');


create table Mission_Tracker (
rec_id number,
memb_id varchar2(30),
mission_id varchar2(30),
duration number,
constraint Mission_Tracker_pk primary key (rec_id, memb_id, mission_id)
);

insert into Mission_Tracker values (1, 'mem_122', 'mis_1133', 17);
insert into Mission_Tracker values (2, 'mem_189', 'mis_6740', 3);
insert into Mission_Tracker values (3, 'mem_141', 'mis_1133', 6);
insert into Mission_Tracker values (4, 'mem_101', 'mis_3657', 2);
insert into Mission_Tracker values (5, 'mem_177', 'mis_8466', 1);
insert into Mission_Tracker values (6, 'mem_142', 'mis_9300', 2);
insert into Mission_Tracker values (7, 'mem_188', 'mis_3084', 5);
insert into Mission_Tracker values (8, 'mem_183', 'mis_3616', 2);
insert into Mission_Tracker values (9, 'mem_155', 'mis_1868', 9);
insert into Mission_Tracker values (10, 'mem_120', 'mis_3657', 1);
insert into Mission_Tracker values (11, 'mem_199', 'mis_4263', 5);
insert into Mission_Tracker values (12, 'mem_178', 'mis_8466', 1);
insert into Mission_Tracker values (13, 'mem_112', 'mis_7107', 6);
insert into Mission_Tracker values (14, 'mem_177', 'mis_9300', 1);
insert into Mission_Tracker values (15, 'mem_148', 'mis_6839', 1);
insert into Mission_Tracker values (16, 'mem_138', 'mis_4263', 13);
insert into Mission_Tracker values (17, 'mem_174', 'mis_3657', 2);
insert into Mission_Tracker values (18, 'mem_101', 'mis_4263', 1);
insert into Mission_Tracker values (19, 'mem_182', 'mis_6839', 2);
insert into Mission_Tracker values (20, 'mem_150', 'mis_3084', 13);
insert into Mission_Tracker values (21, 'mem_141', 'mis_9300', 2);
insert into Mission_Tracker values (22, 'mem_151', 'mis_3616', 1);
insert into Mission_Tracker values (23, 'mem_129', 'mis_2151', 17);
insert into Mission_Tracker values (24, 'mem_169', 'mis_6839', 1);
insert into Mission_Tracker values (25, 'mem_149', 'mis_7753', 2);
insert into Mission_Tracker values (26, 'mem_164', 'mis_4263', 12);
insert into Mission_Tracker values (27, 'mem_110', 'mis_3084', 3);
insert into Mission_Tracker values (28, 'mem_138', 'mis_7107', 7);
insert into Mission_Tracker values (29, 'mem_158', 'mis_4251', 4);
insert into Mission_Tracker values (30, 'mem_185', 'mis_2151', 7);
insert into Mission_Tracker values (31, 'mem_106', 'mis_3657', 1);
insert into Mission_Tracker values (32, 'mem_176', 'mis_4263', 10);
insert into Mission_Tracker values (33, 'mem_129', 'mis_3657', 1);
insert into Mission_Tracker values (34, 'mem_153', 'mis_6034', 16);
insert into Mission_Tracker values (35, 'mem_186', 'mis_1133', 1);
insert into Mission_Tracker values (36, 'mem_117', 'mis_2151', 6);
insert into Mission_Tracker values (37, 'mem_170', 'mis_4263', 10);
insert into Mission_Tracker values (38, 'mem_143', 'mis_3084', 18);
insert into Mission_Tracker values (39, 'mem_152', 'mis_1868', 2);
insert into Mission_Tracker values (40, 'mem_160', 'mis_1133', 11);
insert into Mission_Tracker values (41, 'mem_158', 'mis_3084', 18);
insert into Mission_Tracker values (42, 'mem_170', 'mis_7753', 1);
insert into Mission_Tracker values (43, 'mem_172', 'mis_3657', 1);
insert into Mission_Tracker values (44, 'mem_160', 'mis_4251', 1);
insert into Mission_Tracker values (45, 'mem_139', 'mis_3657', 2);
insert into Mission_Tracker values (46, 'mem_108', 'mis_4251', 1);
insert into Mission_Tracker values (47, 'mem_149', 'mis_4263', 5);
insert into Mission_Tracker values (48, 'mem_154', 'mis_3616', 3);
insert into Mission_Tracker values (49, 'mem_192', 'mis_6839', 1);
insert into Mission_Tracker values (50, 'mem_199', 'mis_2151', 14);
insert into Mission_Tracker values (51, 'mem_143', 'mis_9300', 1);
insert into Mission_Tracker values (52, 'mem_142', 'mis_6034', 9);
insert into Mission_Tracker values (53, 'mem_192', 'mis_1133', 11);
insert into Mission_Tracker values (54, 'mem_187', 'mis_8466', 1);
insert into Mission_Tracker values (55, 'mem_184', 'mis_1868', 29);
insert into Mission_Tracker values (56, 'mem_176', 'mis_4263', 4);
insert into Mission_Tracker values (57, 'mem_174', 'mis_7753', 1);
insert into Mission_Tracker values (58, 'mem_127', 'mis_7753', 1);
insert into Mission_Tracker values (59, 'mem_191', 'mis_7107', 5);
insert into Mission_Tracker values (60, 'mem_126', 'mis_2151', 19);
insert into Mission_Tracker values (61, 'mem_182', 'mis_6740', 17);
insert into Mission_Tracker values (62, 'mem_108', 'mis_6839', 1);
insert into Mission_Tracker values (63, 'mem_193', 'mis_3657', 2);
insert into Mission_Tracker values (64, 'mem_191', 'mis_1133', 16);
insert into Mission_Tracker values (65, 'mem_191', 'mis_6839', 1);
insert into Mission_Tracker values (66, 'mem_109', 'mis_7107', 11);
insert into Mission_Tracker values (67, 'mem_104', 'mis_6034', 13);
insert into Mission_Tracker values (68, 'mem_185', 'mis_1133', 8);
insert into Mission_Tracker values (69, 'mem_133', 'mis_2151', 5);
insert into Mission_Tracker values (70, 'mem_177', 'mis_1133', 16);
insert into Mission_Tracker values (71, 'mem_182', 'mis_8466', 1);
insert into Mission_Tracker values (72, 'mem_159', 'mis_3616', 20);
insert into Mission_Tracker values (73, 'mem_146', 'mis_3084', 22);
insert into Mission_Tracker values (74, 'mem_169', 'mis_3657', 1);
insert into Mission_Tracker values (75, 'mem_196', 'mis_9300', 6);
insert into Mission_Tracker values (76, 'mem_153', 'mis_7107', 5);
insert into Mission_Tracker values (77, 'mem_104', 'mis_1133', 9);
insert into Mission_Tracker values (78, 'mem_200', 'mis_7753', 2);
insert into Mission_Tracker values (79, 'mem_183', 'mis_3657', 2);
insert into Mission_Tracker values (80, 'mem_185', 'mis_8466', 1);
insert into Mission_Tracker values (81, 'mem_163', 'mis_4251', 1);
insert into Mission_Tracker values (82, 'mem_117', 'mis_9300', 6);
insert into Mission_Tracker values (83, 'mem_156', 'mis_9300', 1);
insert into Mission_Tracker values (84, 'mem_196', 'mis_3084', 15);
insert into Mission_Tracker values (85, 'mem_110', 'mis_4263', 6);
insert into Mission_Tracker values (86, 'mem_117', 'mis_6034', 8);
insert into Mission_Tracker values (87, 'mem_162', 'mis_8466', 1);
insert into Mission_Tracker values (88, 'mem_169', 'mis_4251', 10);
insert into Mission_Tracker values (89, 'mem_174', 'mis_7753', 1);
insert into Mission_Tracker values (90, 'mem_133', 'mis_4263', 7);
insert into Mission_Tracker values (91, 'mem_180', 'mis_3616', 7);
insert into Mission_Tracker values (92, 'mem_112', 'mis_4263', 7);
insert into Mission_Tracker values (93, 'mem_107', 'mis_3616', 17);
insert into Mission_Tracker values (94, 'mem_192', 'mis_6034', 1);
insert into Mission_Tracker values (95, 'mem_148', 'mis_7753', 1);
insert into Mission_Tracker values (96, 'mem_113', 'mis_8466', 1);
insert into Mission_Tracker values (97, 'mem_172', 'mis_4251', 17);
insert into Mission_Tracker values (98, 'mem_194', 'mis_6034', 8);
insert into Mission_Tracker values (99, 'mem_119', 'mis_7107', 2);
insert into Mission_Tracker values (100, 'mem_178', 'mis_6034', 1);
insert into Mission_Tracker values (101, 'mem_176', 'mis_6034', 16);
insert into Mission_Tracker values (102, 'mem_120', 'mis_2151', 25);
insert into Mission_Tracker values (103, 'mem_111', 'mis_4251', 2);
insert into Mission_Tracker values (104, 'mem_196', 'mis_4251', 13);
insert into Mission_Tracker values (105, 'mem_130', 'mis_2151', 24);
insert into Mission_Tracker values (106, 'mem_100', 'mis_3657', 2);
insert into Mission_Tracker values (107, 'mem_183', 'mis_6839', 1);
insert into Mission_Tracker values (108, 'mem_171', 'mis_1133', 9);
insert into Mission_Tracker values (109, 'mem_124', 'mis_3657', 1);
insert into Mission_Tracker values (110, 'mem_159', 'mis_3084', 15);
insert into Mission_Tracker values (111, 'mem_119', 'mis_8466', 1);
insert into Mission_Tracker values (112, 'mem_160', 'mis_1133', 11);
insert into Mission_Tracker values (113, 'mem_144', 'mis_1868', 11);
insert into Mission_Tracker values (114, 'mem_155', 'mis_6740', 2);
insert into Mission_Tracker values (115, 'mem_158', 'mis_4251', 7);
insert into Mission_Tracker values (116, 'mem_142', 'mis_1133', 13);
insert into Mission_Tracker values (117, 'mem_188', 'mis_2151', 2);
insert into Mission_Tracker values (118, 'mem_152', 'mis_4251', 20);
insert into Mission_Tracker values (119, 'mem_102', 'mis_2151', 16);
insert into Mission_Tracker values (120, 'mem_195', 'mis_3657', 1);
insert into Mission_Tracker values (121, 'mem_150', 'mis_3657', 1);
insert into Mission_Tracker values (122, 'mem_179', 'mis_9300', 1);
insert into Mission_Tracker values (123, 'mem_184', 'mis_4263', 12);
insert into Mission_Tracker values (124, 'mem_140', 'mis_4263', 10);
insert into Mission_Tracker values (125, 'mem_153', 'mis_3084', 19);
insert into Mission_Tracker values (126, 'mem_182', 'mis_7107', 2);
insert into Mission_Tracker values (127, 'mem_118', 'mis_4251', 16);
insert into Mission_Tracker values (128, 'mem_153', 'mis_7107', 7);
insert into Mission_Tracker values (129, 'mem_149', 'mis_7753', 2);
insert into Mission_Tracker values (130, 'mem_121', 'mis_4251', 20);
insert into Mission_Tracker values (131, 'mem_187', 'mis_1133', 13);
insert into Mission_Tracker values (132, 'mem_121', 'mis_6839', 2);
insert into Mission_Tracker values (133, 'mem_100', 'mis_6839', 2);
insert into Mission_Tracker values (134, 'mem_169', 'mis_4263', 7);
insert into Mission_Tracker values (135, 'mem_131', 'mis_7753', 2);
insert into Mission_Tracker values (136, 'mem_156', 'mis_7753', 1);
insert into Mission_Tracker values (137, 'mem_175', 'mis_9300', 5);
insert into Mission_Tracker values (138, 'mem_153', 'mis_4263', 9);
insert into Mission_Tracker values (139, 'mem_193', 'mis_7107', 6);
insert into Mission_Tracker values (140, 'mem_104', 'mis_7107', 3);
insert into Mission_Tracker values (141, 'mem_172', 'mis_1868', 26);
insert into Mission_Tracker values (142, 'mem_107', 'mis_9300', 1);
insert into Mission_Tracker values (143, 'mem_164', 'mis_8466', 1);
insert into Mission_Tracker values (144, 'mem_184', 'mis_7107', 1);
insert into Mission_Tracker values (145, 'mem_105', 'mis_3616', 13);
insert into Mission_Tracker values (146, 'mem_107', 'mis_7753', 2);
insert into Mission_Tracker values (147, 'mem_175', 'mis_6839', 2);
insert into Mission_Tracker values (148, 'mem_120', 'mis_6740', 11);
insert into Mission_Tracker values (149, 'mem_157', 'mis_3616', 7);
insert into Mission_Tracker values (150, 'mem_151', 'mis_7107', 11);
insert into Mission_Tracker values (151, 'mem_191', 'mis_6034', 14);
insert into Mission_Tracker values (152, 'mem_197', 'mis_6034', 3);
insert into Mission_Tracker values (153, 'mem_116', 'mis_3616', 9);
insert into Mission_Tracker values (154, 'mem_119', 'mis_6839', 1);
insert into Mission_Tracker values (155, 'mem_168', 'mis_1868', 1);
insert into Mission_Tracker values (156, 'mem_162', 'mis_1133', 17);
insert into Mission_Tracker values (157, 'mem_101', 'mis_7753', 2);
insert into Mission_Tracker values (158, 'mem_174', 'mis_6839', 1);
insert into Mission_Tracker values (159, 'mem_107', 'mis_6839', 2);
insert into Mission_Tracker values (160, 'mem_110', 'mis_6839', 2);
insert into Mission_Tracker values (161, 'mem_144', 'mis_1868', 22);
insert into Mission_Tracker values (162, 'mem_155', 'mis_3616', 18);
insert into Mission_Tracker values (163, 'mem_102', 'mis_6740', 17);
insert into Mission_Tracker values (164, 'mem_140', 'mis_6034', 5);
insert into Mission_Tracker values (165, 'mem_142', 'mis_1133', 16);
insert into Mission_Tracker values (166, 'mem_197', 'mis_3616', 17);
insert into Mission_Tracker values (167, 'mem_192', 'mis_1133', 12);
insert into Mission_Tracker values (168, 'mem_145', 'mis_1133', 12);
insert into Mission_Tracker values (169, 'mem_148', 'mis_4251', 9);
insert into Mission_Tracker values (170, 'mem_150', 'mis_6034', 16);
insert into Mission_Tracker values (171, 'mem_113', 'mis_1133', 12);
insert into Mission_Tracker values (172, 'mem_120', 'mis_2151', 26);
insert into Mission_Tracker values (173, 'mem_196', 'mis_6740', 15);
insert into Mission_Tracker values (174, 'mem_133', 'mis_3616', 14);
insert into Mission_Tracker values (175, 'mem_175', 'mis_7107', 7);
insert into Mission_Tracker values (176, 'mem_182', 'mis_4263', 12);
insert into Mission_Tracker values (177, 'mem_148', 'mis_1868', 15);
insert into Mission_Tracker values (178, 'mem_146', 'mis_2151', 20);
insert into Mission_Tracker values (179, 'mem_150', 'mis_6034', 13);
insert into Mission_Tracker values (180, 'mem_153', 'mis_7753', 1);
insert into Mission_Tracker values (181, 'mem_161', 'mis_9300', 3);
insert into Mission_Tracker values (182, 'mem_137', 'mis_1133', 14);
insert into Mission_Tracker values (183, 'mem_120', 'mis_8466', 1);
insert into Mission_Tracker values (184, 'mem_179', 'mis_6034', 4);
insert into Mission_Tracker values (185, 'mem_142', 'mis_6839', 2);
insert into Mission_Tracker values (186, 'mem_106', 'mis_8466', 1);
insert into Mission_Tracker values (187, 'mem_199', 'mis_1133', 4);
insert into Mission_Tracker values (188, 'mem_100', 'mis_6839', 2);
insert into Mission_Tracker values (189, 'mem_143', 'mis_8466', 1);
insert into Mission_Tracker values (190, 'mem_104', 'mis_7107', 7);
insert into Mission_Tracker values (191, 'mem_192', 'mis_4251', 19);
insert into Mission_Tracker values (192, 'mem_102', 'mis_6034', 8);
insert into Mission_Tracker values (193, 'mem_144', 'mis_2151', 6);
insert into Mission_Tracker values (194, 'mem_153', 'mis_4251', 11);
insert into Mission_Tracker values (195, 'mem_156', 'mis_6740', 14);
insert into Mission_Tracker values (196, 'mem_155', 'mis_8466', 1);
insert into Mission_Tracker values (197, 'mem_126', 'mis_1868', 23);
insert into Mission_Tracker values (198, 'mem_126', 'mis_3657', 2);
insert into Mission_Tracker values (199, 'mem_117', 'mis_7753', 2);
insert into Mission_Tracker values (200, 'mem_182', 'mis_2151', 16);


alter table Mission_Tracker add constraint Mission_Tracker_memb_fk foreign key (memb_id) references members (memb_id);

alter table Mission_Tracker add constraint Mission_Tracker_miss_fk foreign key (mission_id) references missions (mission_id);

alter table members add constraint members_class_fk foreign key (class_id) references class (class_id);

alter table missions add constraint missions_loc_fk foreign key (loc_id) references locations (loc_id);

alter table missions add constraint missions_type_fk foreign key (mission_type) references type (type);