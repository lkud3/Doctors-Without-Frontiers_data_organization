# Doctors-Without-Frontiers_data_organization
The pet project written in PL/SQL demonstrates the potential use of these technologies in the proper organization of the activities of a company. The project was built on Oracle APEX.

## Quick outline
This application represents a set of data from the so-called Doctors Without Frontiers, a private, independent organization that cooperates with people to help in different accidents. It provides different kinds of assistance on humanitarian missions. The application aggregates the data consisting of the members of this organization, as well as the missions each of them is dedicated to and following expenses considering the mission itself. Based on the data and needs of the business, the data was distributed between multiple tables to make storage more convenient and flexible for any adjustments. Moreover, additional fields were computed to provide more valuable information considering expenses on the missions, the awareness level of each mission, as well as other information that can help organizers and managers to characterize the progress of missions and take further steps in resolving the issues more accurately and logically. The final view of this application as well as the tables themselves and queries/functions written can vary based on the final needs of the company; for example, to compute more detailed expenses on each of the missions, to evaluate the amount of people each mission is operated by, or even to help sponsors and the government make a more correct decision on which mission to help first and which one does not need that many people now. 

## The content
The current repository consists of several files:
1) **Report.docx** - the more detailed description of the table contents as well as the explanation of the work and results of each query/function/trigger etc. performed. Lastly, it has some suggestions for further improvements. 
2) **data.xlsm** - the Excel file containing the initial tables. The data is generated mostly with random functions provided by Excel. It also has generated `insert into()` code to use in the SQL dump for populating the data.
3) **ERD.img** - the image of the ERD table to better visualize the tables and their connections.
4) **SQL_dump.txt** - the .txt file containing all `create table` instructions to create tables with required constraints as well as instructions for populating these tables. 
5) **SQL_queries** - the .txt file containing all performed SQL queries and PL/SQL functions, triggers, procedures, etc.
