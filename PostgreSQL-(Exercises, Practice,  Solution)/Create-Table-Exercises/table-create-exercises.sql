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