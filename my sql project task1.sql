USE VEHICLEMANAGEMENT;
--- Retrieve the first 5 members from the Member table.
SELECT * FROM MEMBERS LIMIT 5;
-- 5 members starting from the 6th row.
SELECT * FROM MEMBERS where member_id >= 6;
--- List members who are older than 30 years.
SELECT * FROM MEMBERS where member_age >= 30;
-- members who live in either New York or Los Angeles
SELECT * FROM MEMBERS where member_location ='new york' or 'los Angeles';
-- Retrieve all vehicles where the make is either 'Toyota' or 'Honda'
SELECT * FROM VEHICLES where Vehicle_make = 'totoya' or 'honda';
-- Find vehicles where the model ends with the number '5'. 
SELECT * FROM VEHICLES WHERE VEHICLE_MODEL LIKE '%5';
 -- Find members whose age is between 25 and 40 years
SELECT * FROM MEMBERS WHERE MEMBER_AGE LIKE '25% AND %40';
-- List vehicles whose registration number starts with the letter 'A'.
SELECT * FROM VEHICLES WHERE VEHICLE_REGISTRATION LIKE 'A%';
-- all engineers and order them alphabetically by their last name
SELECT * FROM ENGINEERS ORDER BY LAST_NAME;
-- all members and order them by age in descending order
SELECT * FROM MEMBERS ORDER BY MEMBER_AGE DESC;
-- COUNT the total number of members in the Member table.
SELECT count(*)  FROM MEMBERS;
-- Retrieve all breakdowns that occurred in the year 2024
SELECT * FROM BREAKDOWNS WHERE BREAKDOWN_DATE LIKE '2024%';
-- Find breakdowns for vehicles with the registration 'ABC1234' or 'XYZ5678
SELECT * FROM BREAKDOWNS WHERE VEHICLE_REGISTRATION LIKE 'ABC1234' OR 'XYZ5678';
-- List all vehicles with the make 'Ford'.
SELECT * FROM VEHICLES WHERE VEHICLE_MAKE LIKE 'FORD';
-- Find members whose first name starts with the letter 'J'.
SELECT * FROM MEMBERS WHERE FIRST_NAME LIKE 'J%';
-- Retrieve breakdowns that occurred before September 1, 2024.
SELECT * FROM BREAKDOWNS WHERE BREAKDOWN_DATE <= '2024-09-01';
-- List members whose last name contains 'son'
SELECT * FROM MEMBERS WHERE LAST_NAME LIKE '%SON';
-- Find breakdowns that occurred in locations containing 'New
SELECT * FROM BREAKDOWNS WHERE BREAKDOWN_LOCATION LIKE '%NEW%';
-- Retrieve the youngest member in the Member table.
SELECT MIN(MEMBER_AGE) AS YOUNGEST FROM MEMBERS;
-- OR
SELECT * FROM MEMBERS WHERE MEMBER_AGE LIKE '%20';
-- Retrieve the oldest member in the Member table 
SELECT MAX(MEMBER_AGE) AS OLDEST FROM MEMBERS;
-- OR
SELECT * FROM MEMBERS WHERE MEMBER_AGE LIKE '%45';
-- Find vehicles owned by members who live in Los Angeles
SELECT * FROM MEMEBRS  WHERE MEMBER_LOCATION ='Los Angeles';
-- Retrieve all breakdowns handled by engineer with ID 1.
SELECT * FROM BREAKDOWNS WHERE ENGINEER_ID = '1';
-- List all members who are younger than 35 years
SELECT * FROM MEMBERS WHERE MEMBER_AGE <'35';
-- Find members who live in either Phoenix or Houston
SELECT * FROM MEMBERS WHERE MEMBER_LOCATION LIKE 'PHOENIX' OR 'HOUSTON';
-- Retrieve vehicles where the model is either 'Civic' or 'Mustang'.
SELECT * FROM VEHICLES WHERE VEHICLE_MODEL LIKE 'Civic' or 'Mustang';
-- List members whose first name contains the letter 'a'.
SELECT * FROM MEMBERS WHERE FIRST_NAME LIKE '%A%';
-- Retrieve breakdowns that occurred between August 1, 2024, and August 31, 2024
SELECT * FROM BREAKDOWNS WHERE BREAKDOWN_DATE >= '2024-08-01' AND BREAKDOWN_DATE <= '2024-08-31';
-- Find members whose age is not between 20 and 40 years.
SELECT * FROM MEMBERS WHERE MEMBER_AGE >= '20' AND MEMBER_AGE <= '40';
-- List breakdowns that occurred after October 1, 2024.
SELECT * FROM BREAKDOWNS WHERE BREAKDOWN_DATE >= '2024-10-01';
-- Retrieve the top 3 oldest members from the Member table
SELECT * FROM MEMBERS WHERE MEMBER_AGE >= 35 LIMIT 3;

-- THE MEDIUM TASK 
-- Count the number of breakdowns for each vehicle
SELECT VEHICLE_MAKE , COUNT(MEMBER_ID) AS 'TOTAL BREAKDOWNS' FROM VEHICLES LEFT JOIN BREAKDOWNS ON VEHICLES.VEHICLE_REGISTRATION = BREAKDOWNS.VEHICLE_REGISTRATION 
GROUP BY VEHICLE_MAKE;
-- Find members who own more than one vehicle
SELECT first_name, last_name FROM MEMBERS INNER JOIN VEHICLES ON MEMBERS.MEMBER_ID = VEHICLES.MEMBER_ID;
-- Retrieve the total number of breakdowns handled by each engineer.
SELECT VEHICLE_REGISTRATION , COUNT(BREAKDOWN_ID) AS 'TOTAL BREAKDOWNS HANDLED' FROM BREAKDOWNS RIGHT JOIN 
ENGINEERS ON BREAKDOWNS.ENGINEER_ID = ENGINEERS.ENGINEER_ID
GROUP BY VEHICLE_REGISTRATION;
-- Group breakdowns by location and sort them by the total number of breakdowns in each location.
SELECT BREAKDOWN_LOCATION, COUNT(BREAKDOWN_ID)AS 'TOTAL LOCATIONS BREAKDOWNS'
FROM BREAKDOWNS 
GROUP BY BREAKDOWN_LOCATION;
-- List vehicles owned by members who are younger than 30 years.
SELECT VEHICLE_MAKE FROM VEHICLES INNER JOIN MEMBERS ON VEHICLES.MEMBER_ID = MEMBERS.MEMBER_ID
WHERE MEMBER_AGE <= '30';
-- Retrieve all breakdowns and sort them by time in descending order; 
SELECT *  FROM BREAKDOWNS ORDER BY BREAKDOWN_TIME DESC;
-- Find all breakdowns for vehicles owned by members who live in New York.
SELECT BREAKDOWN_LOCATION , COUNT(BREAKDOWN_ID) AS 'MEMBERS LIVING NEW YORK ' FROM BREAKDOWNS 
RIGHT JOIN VEHICLES ON BREAKDOWNS.VEHICLE_REGISTRATION = VEHICLES.VEHICLE_REGISTRATION where BREAKDOWN_LOCATION ='NEW YORK'
GROUP BY BREAKDOWN_LOCATION;
-- Retrieve members who do not own any vehicles.
SELECT MEMBER_ID FROM MEMBERS
UNION
SELECT MEMBER_ID FROM VEHICLES
order by MEMBER_ID;
-- Find breakdowns that occurred in the same city where the vehicle owner resides.
SELECT BREAKDOWN_LOCATION , COUNT(BREAKDOWN_ID) AS 'MEMBERS RESIDES ' FROM BREAKDOWNS 
RIGHT JOIN VEHICLES ON BREAKDOWNS.VEHICLE_REGISTRATION = VEHICLES.VEHICLE_REGISTRATION
GROUP BY BREAKDOWN_LOCATION;
-- Retrieve the total number of breakdowns handled by each engineer during 2024.
SELECT VEHICLE_REGISTRATION , COUNT(BREAKDOWN_ID) AS 'TOTAL BREAKDOWNS HANDLED' FROM BREAKDOWNS RIGHT JOIN 
ENGINEERS ON BREAKDOWNS.ENGINEER_ID = ENGINEERS.ENGINEER_ID WHERE BREAKDOWN_DATE = YEAR('2024-01-01')
GROUP BY VEHICLE_REGISTRATION;

-- Difficult Tasks (10)
-- Retrieve a ist of members along with their vehicles using a join.
SELECT VEHICLE_MAKE, CONCAT(FIRST_NAME,' ',LAST_NAME) AS 'FULL NAME' FROM MEMBERS INNER JOIN VEHICLES ON MEMBERS.MEMBER_ID= VEHICLES.MEMBER_ID;
-- Retrieve breakdown details along with the respective member details using a join
SELECT VEHICLE_MAKE, BREAKDOWN_LOCATION , BREAKDOWN_ID ,BREAKDOWN_TIME FROM BREAKDOWNS 
INNER JOIN  VEHICLES ON BREAKDOWNS.VEHICLE_REGISTRATION = VEHICLES.VEHICLE_REGISTRATION;
-- Find members who own a vehicle but have never experienced a breakdown

-- Retrieve vehicles along with the count of their breakdowns using a join and group bY
SELECT VEHICLE_REGISTRATION , COUNT(BREAKDOWN_ID) AS 'TOTAL BREAKDOWNS ' FROM BREAKDOWNS RIGHT JOIN 
ENGINEERS ON BREAKDOWNS.ENGINEER_ID = ENGINEERS.ENGINEER_ID
GROUP BY VEHICLE_REGISTRATION;
 -- Find members whose vehicles have broken down more than twice.
SELECT VEHICLE_MAKE, BREAKDOWN_LOCATION , BREAKDOWN_ID ,BREAKDOWN_TIME FROM BREAKDOWNS 
INNER JOIN  VEHICLES ON BREAKDOWNS.VEHICLE_REGISTRATION = VEHICLES.VEHICLE_REGISTRATION WHERE ENGINEER_ID >= '2';
-- Retrieve breakdowns where multiple vehicles broke down on the same day.
SELECT VEHICLE_MAKE, BREAKDOWN_LOCATION , BREAKDOWN_ID ,BREAKDOWN_TIME FROM BREAKDOWNS 
INNER JOIN  VEHICLES ON BREAKDOWNS.VEHICLE_REGISTRATION = VEHICLES.VEHICLE_REGISTRATION WHERE BREAKDOWN_DATE ='2024-10-15';
-- Count the total breakdowns handled by each engineer and label those who handled more than 5 breakdowns as 'Expert' and others as 'Beginner' using a CASE expression.
SELECT VEHICLE_REGISTRATION , COUNT(BREAKDOWN_ID) AS 'TOTAL BREAKDOWNS HANDLED' FROM BREAKDOWNS INNER JOIN 
ENGINEERS ON BREAKDOWNS.ENGINEER_ID = ENGINEERS.ENGINEER_ID;
        

-- Task 5: Research SQL Functions
SELECT SUM(ENGINEER_ID) FROM ENGINEERS;
-- The AVG() function returns the average value of a numeric column
SELECT AVG(Price) FROM Products;
SELECT MAX(MEMBER_AGE) AS OLDEST FROM MEMBERS;
SELECT MIN(MEMBER_AGE) AS YOUNGEST FROM MEMBERS;

-- Update 3 records of your own choice from the Engineer table.
UPDATE ENGINEERS
SET FIRST_NAME = 'MARK', LAST_NAME = 'HOOD'
WHERE ENGINEER_ID = 1;
UPDATE ENGINEERS
SET FIRST_NAME = 'PETER', LAST_NAME = 'HIGHS'
WHERE ENGINEER_ID = 2;
UPDATE ENGINEERS
SET FIRST_NAME = 'JAMES', LAST_NAME = 'DARTS'
WHERE ENGINEER_ID = 3;

-- Delete 2 records of your own choice from the breakdown table
DELETE FROM BREAKDOWNS WHERE BREAKDOWN_DATE='2024-10-15';
DELETE FROM BREAKDOWNS WHERE BREAKDOWN_TIME ='11:00:00';