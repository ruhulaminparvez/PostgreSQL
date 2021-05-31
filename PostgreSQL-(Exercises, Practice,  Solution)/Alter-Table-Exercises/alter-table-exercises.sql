#1. Write a SQL statement to rename the table countries to country_new.

#Here is the list of tables.

#   tablename   | tableowner
#---------------+------------
# orders        | postgres
# employees     | postgres
# job_history   | postgres
# jobs          | postgres
# locations     | postgres
# regions       | postgres
# countries     | postgres
#(7 rows)


ALTER TABLE countries RENAME TO country_new;



#-------------------------------------------------------------------------------------------------------------------------------------------------------
#2. Write a SQL statement to add a column region_id to the table locations.

#Here is the structure of the table locations.

#postgres=# \d locations
#     Column     |         Type          | Modifiers
#----------------+-----------------------+-----------
# location_id    | numeric(4,0)          |
# street_address | character varying(40) |
# postal_code    | character varying(12) |
# city           | character varying(30) |
# state_province | character varying(25) |
# country_id     | character varying(2)  |


ALTER TABLE locations ADD region_id  INT;



#-------------------------------------------------------------------------------------------------------------------------------------------------------
#3. Write a SQL statement to change the data type of the column region_id to text in the table locations.

#Here is the structure of the table locations.

#postgres=# \d locations
#     Column     |         Type          | Modifiers
#----------------+-----------------------+-----------
# location_id    | numeric(4,0)          |
# street_address | character varying(40) |
# postal_code    | character varying(12) |
# city           | character varying(30) |
# state_province | character varying(25) |
# country_id     | character varying(2)  |
# region_id      | integer               |


ALTER TABLE locations ALTER region_id TYPE text;



#-------------------------------------------------------------------------------------------------------------------------------------------------------
#4. Write a SQL statement to drop the column city from the table locations.

#Here is the structure of the table locations.

#postgres=# \d locations
#     Column     |         Type          | Modifiers
#----------------+-----------------------+-----------
# location_id    | numeric(4,0)          |
# street_address | character varying(40) |
# postal_code    | character varying(12) |
# city           | character varying(30) |
# state_province | character varying(25) |
# country_id     | character varying(2)  |
# region_id      | text                  |


ALTER TABLE locations DROP city;



#-------------------------------------------------------------------------------------------------------------------------------------------------------
#5. Write a SQL statement to change the name of the column state_province to state, keeping the data type and size same.

#Here is the structure of the table locations.

#postgres=# \d locations
#     Column     |         Type          | Modifiers
#----------------+-----------------------+-----------
# location_id    | numeric(4,0)          |
# street_address | character varying(40) |
# postal_code    | character varying(12) |
# city           | character varying(30) |
# state_province | character varying(25) |
# country_id     | character varying(2)  |
# region_id      | text                  |


ALTER TABLE locations DROP state_province, ADD state varchar(25);


