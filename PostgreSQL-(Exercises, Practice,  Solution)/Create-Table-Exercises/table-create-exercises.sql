#1. Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id.

CREATE TABLE countries(
    country_id BIGSERIAL NOT NULL,
    country_name VARCHAR(50) NOT NULL,
    region_id DECIMAL(10,0) NOT NULL
);



#------------------------------------------------------------------------------------------------------------------------------------------------------------
#2. Write a SQL statement to create a simple table countries, including columns country_id,country_name and region_id which already exist.

CREATE TABLE countries(
    country_id BIGSERIAL NOT NULL,
    country_name VARCHAR(50) NOT NULL,
    region_id DECIMAL(10,0) NOT NULL
);

#OUTPUT : ERROR:  relation "countries" already exists



#------------------------------------------------------------------------------------------------------------------------------------------------------------
#3. Write a sql statement to create the structure of a table dup_countries similar to countries.

CREATE TABLE dup_countries AS 
(SELECT * 
FROM countries)  
WITH NO DATA;



#------------------------------------------------------------------------------------------------------------------------------------------------------------
#4. Write a SQL statement to create a duplicate copy of countries table, including structure and data by name dup_countries.

CREATE TABLE dup_countries
AS SELECT * 
FROM  countries;



#------------------------------------------------------------------------------------------------------------------------------------------------------------
#5. Write a SQL statement to create a table countries set a constraint NULL.

CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID varchar(2) NOT NULL,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL
);



#------------------------------------------------------------------------------------------------------------------------------------------------------------
#6. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.

CREATE TABLE IF NOT EXISTS jobs ( 
JOB_ID varchar(10) NOT NULL , 
JOB_TITLE varchar(35) NOT NULL, 
MIN_SALARY decimal(6,0), 
MAX_SALARY decimal(6,0) 
CHECK(MAX_SALARY<=25000)
);



#------------------------------------------------------------------------------------------------------------------------------------------------------------
#7. Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table.

CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID varchar(2),
COUNTRY_NAME varchar(40)
CHECK(COUNTRY_NAME IN('Italy','India','China')),
REGION_ID decimal(10,0)
);



#------------------------------------------------------------------------------------------------------------------------------------------------------------
#8. Write a SQL statement to create a table named countries, including country_id, country_name and region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion.

CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID varchar(2) NOT NULL,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL,
UNIQUE(COUNTRY_ID)
);



#------------------------------------------------------------------------------------------------------------------------------------------------------------
#9. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.

CREATE TABLE IF NOT EXISTS jobs ( 
JOB_ID varchar(10) NOT NULL UNIQUE, 
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(6,0) DEFAULT 8000, 
MAX_SALARY decimal(6,0) DEFAULT NULL
);



#------------------------------------------------------------------------------------------------------------------------------------------------------------
#10. Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that the country_id column will be a key field which will not contain any duplicate data at the time of insertion.

CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID varchar(2) NOT NULL UNIQUE PRIMARY KEY,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL
);



#------------------------------------------------------------------------------------------------------------------------------------------------------------
#11. Write a SQL statement to create a table countries including columns country_id, country_name and region_id and make sure that the column country_id will be unique and store an auto-incremented value.

CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID SERIAL PRIMARY KEY, 
COUNTRY_NAME varchar(40) NOT NULL, 
REGION_ID decimal(10,0) NOT NULL 
);



#------------------------------------------------------------------------------------------------------------------------------------------------------------
#12. Write a SQL statement to create a table countries including columns country_id, country_name and region_id and make sure that the combination of columns country_id and region_id will be unique.

CREATE TABLE IF NOT EXISTS countries_n (
COUNTRY_ID varchar(2) NOT NULL UNIQUE DEFAULT '',
COUNTRY_NAME varchar(40) DEFAULT NULL,
REGION_ID decimal(10,0) NOT NULL,
PRIMARY KEY (COUNTRY_ID,REGION_ID));



#------------------------------------------------------------------------------------------------------------------------------------------------------------
#13. Write a SQL statement to create a table job_history, including employee_id, start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any duplicate values at the time of insertion and the foreign key column job_id contain only those values which exist in the jobs table.

# Here is the structure of the table jobs:

#   Column   |         Type          |               Modifiers
#------------+-----------------------+----------------------------------------
# job_id     | character varying(10) | not null default ''::character varying
# job_title  | character varying(35) | not null
# min_salary | numeric(6,0)          | default NULL::numeric
# max_salary | numeric(6,0)          | default NULL::numeric

CREATE TABLE job_history ( 
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY, 
START_DATE date NOT NULL, 
END_DATE date NOT NULL, 
JOB_ID varchar(10) NOT NULL, 
DEPARTMENT_ID decimal(4,0) DEFAULT NULL, 
FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);



#------------------------------------------------------------------------------------------------------------------------------------------------------------
#14. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns contain only those unique combination values, which combinations exist in the departments table.

# Assume the structure of departments table below.

#     Column      |         Type          |           Modifiers
#-----------------+-----------------------+--------------------------------
# department_id   | numeric(4,0)          | not null
# department_name | character varying(30) | not null
# manager_id      | numeric(6,0)          | not null default NULL::numeric
# location_id     | numeric(4,0)          | default NULL::numeric

CREATE TABLE IF NOT EXISTS employees ( 
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(20) DEFAULT NULL, 
LAST_NAME varchar(25) NOT NULL, 
EMAIL varchar(25) NOT NULL, 
PHONE_NUMBER varchar(20) DEFAULT NULL, 
HIRE_DATE date NOT NULL, 
JOB_ID varchar(10) NOT NULL, 
SALARY decimal(8,2) DEFAULT NULL, 
COMMISSION_PCT decimal(2,2) DEFAULT NULL, 
MANAGER_ID decimal(6,0) DEFAULT NULL, 
DEPARTMENT_ID decimal(4,0) DEFAULT NULL, 
FOREIGN KEY(DEPARTMENT_ID,MANAGER_ID) 
REFERENCES  departments(DEPARTMENT_ID,MANAGER_ID)
);



#------------------------------------------------------------------------------------------------------------------------------------------------------------
#15. Write a sql statement to create a table employees, including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the column department_id of departments table, can contain only those values which exist in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which exist in the jobs table.

# Assume that the structure of two tables departments and jobs.

#     Column      |         Type          |       Modifiers
#-----------------+-----------------------+-----------------------
# department_id   | numeric(4,0)          | not null
# department_name | character varying(30) | not null
# manager_id      | numeric(6,0)          | default NULL::numeric
# location_id     | numeric(4,0)          | default NULL::numeric


#   Column   |         Type          |               Modifiers
#------------+-----------------------+----------------------------------------
# job_id     | character varying(10) | not null default ''::character varying
# job_title  | character varying(35) | not null
# min_salary | numeric(6,0)          | default NULL::numeric
# max_salary | numeric(6,0)          | default NULL::numeric

CREATE TABLE IF NOT EXISTS employees ( 
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(20) DEFAULT NULL, 
LAST_NAME varchar(25) NOT NULL, 
EMAIL varchar(25) NOT NULL, 
PHONE_NUMBER varchar(20) DEFAULT NULL, 
HIRE_DATE date NOT NULL, 
JOB_ID varchar(10) NOT NULL, 
SALARY decimal(8,2) DEFAULT NULL, 
COMMISSION_PCT decimal(2,2) DEFAULT NULL, 
MANAGER_ID decimal(6,0) DEFAULT NULL, 
DEPARTMENT_ID decimal(4,0) DEFAULT NULL, 
FOREIGN KEY(DEPARTMENT_ID) 
REFERENCES  departments(DEPARTMENT_ID),
FOREIGN KEY(JOB_ID) 
REFERENCES  jobs(JOB_ID)
);



#------------------------------------------------------------------------------------------------------------------------------------------------------------
#16. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which exist in the jobs table. The specialty of the statement is that the ON UPDATE CASCADE action allows you to perform the cross-table update and ON DELETE RESTRICT action rejects the deletion. The default action is ON DELETE RESTRICT.

# Assume that the following is the structure of the table jobs.

#   Column   |         Type          |               Modifiers
#------------+-----------------------+----------------------------------------
# job_id     | character varying(10) | not null default ''::character varying
# job_title  | character varying(35) | not null
# min_salary | numeric(6,0)          | default NULL::numeric
# max_salary | numeric(6,0)          | default NULL::numeric

CREATE TABLE IF NOT EXISTS employees ( 
EMPLOYEE_ID INTEGER NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(20) DEFAULT NULL, 
LAST_NAME varchar(25) NOT NULL, 
JOB_ID INTEGER NOT NULL, 
SALARY decimal(8,2) DEFAULT NULL, 
FOREIGN KEY(JOB_ID) 
REFERENCES  jobs(JOB_ID) 
ON UPDATE CASCADE ON DELETE RESTRICT
);
