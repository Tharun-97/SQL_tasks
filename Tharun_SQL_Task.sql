CREATE TABLE THARUN_EMPLOYEES 
( 
ID INT PRIMARY KEY, 
FIRST_NAME VARCHAR(40), 
LAST_NAME VARCHAR(40), 
SALARY DECIMAL(8,2), 
DEPARTMENT_ID INT, 
YEAR_OF_JOINING DATETIME, 
YEAR_OF_RELIEVING DATETIME 
) 

INSERT INTO THARUN_EMPLOYEES(ID,FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID,YEAR_OF_JOINING,Display average salary for employees who did a job in the past. )VALUES
(101,'ROMIN','IRANI',25000.50,10,'09-15-2022','12-20-2023'),
(102,'JAMES','NEIL',8000,22,'03-25-2022','12-28-2024'),
(103,'TOM','HANKS',5000.50,90,'02-19-2022','02-19-2022'),
(104,'MARIA','SHARAPOVA',13000,50,'09-15-2022','12-20-2023'),
(105,'SMITH ','RYAN',22500.60,90,'09-15-2022','12-20-2023');

CREATE TABLE THARUN_DEPARTMENTS 
( 
DEPARTMENT_ID INT PRIMARY KEY, 
MANAGER_ID INT, 
DEPARTMENT_NAME VARCHAR(50) 
) 

INSERT INTO THARUN_DEPARTMENTS(DEPARTMENT_ID,MANAGER_ID,DEPARTMENT_NAME)VALUES
(40,'','SUPPORT');
(10,101,'DEVELOPER'),
(20,102,'TESTING'),
(22,NULL,'SALES'),
(50,NULL,'SUPPORT'),
(90,105,'HR'),
(42,107,'TELECOM');

SELECT * FROM THARUN_EMPLOYEES

SELECT * FROM THARUN_DEPARTMENTS

--1.Write a query to display all the name which starts with S 

SELECT * FROM THARUN_EMPLOYEES WHERE FIRST_NAME LIKE '%S%';

--2.Write a query to display all the name starts with S and ends with character n. 

SELECT * FROM THARUN_EMPLOYEES WHERE FIRST_NAME LIKE '%S%' AND LAST_NAME LIKE '%___N%';

--3.Write a query to display all the employees who are all working for department 90 and their name must starts with ‘S’. 

SELECT * FROM THARUN_EMPLOYEES WHERE DEPARTMENT_ID=90 AND FIRST_NAME LIKE '%S%';

--4.Display all the department id which contain 2 as 2nd character. 
SELECT * FROM THARUN_DEPARTMENTS WHERE DEPARTMENT_ID LIKE '%_2%';


--5.Write a query to display all the employees who are all working in department 10,20,50 and 90. 

SELECT * FROM THARUN_EMPLOYEES WHERE DEPARTMENT_ID=10 OR DEPARTMENT_ID=20 OR DEPARTMENT_ID=50 OR DEPARTMENT_ID=90;

--6.Write a query to display who are all getting salary between 5000 and 7000. 

SELECT * FROM THARUN_EMPLOYEES WHERE SALARY BETWEEN 5000 AND 7000;

--7.Display First_name, salary, department_id and manager_id of the employee who don't have manager 

SELECT THARUN_EMPLOYEES.FIRST_NAME,THARUN_EMPLOYEES.SALARY,THARUN_EMPLOYEES.DEPARTMENT_ID,THARUN_DEPARTMENTS.MANAGER_ID FROM THARUN_EMPLOYEES 
JOIN THARUN_DEPARTMENTS ON THARUN_EMPLOYEES.DEPARTMENT_ID=THARUN_DEPARTMENTS.DEPARTMENT_ID WHERE THARUN_DEPARTMENTS.MANAGER_ID IS EMPTY;

--8.Display all the records in employees table and sort the first name in ascending order. 

SELECT * FROM THARUN_EMPLOYEES ORDER BY FIRST_NAME ASC;

--9.Display first name, department id and salary from employees table and sort the records ( sort department id in ascending order and salary in descending order)  

SELECT FIRST_NAME,DEPARTMENT_ID,SALARY FROM THARUN_EMPLOYEES ORDER BY DEPARTMENT_ID ASC , SALARY DESC;

--10.Display first three characters from first name. 

SELECT SUBSTRING(FIRST_NAME,1,3) FROM THARUN_EMPLOYEES;

--11.Display last two character from last name. 

SELECT RIGHT(LAST_NAME,2) FROM THARUN_EMPLOYEES;

--12.Display all the first name and position of a in that name (first occurrence of a).  

SELECT FIRST_NAME,CHARINDEX('A',FIRST_NAME)AS "POSITION OF A" FROM THARUN_EMPLOYEES;

--13. Write a query to select maximum salary from employees table. 

SELECT FIRST_NAME,SALARY AS "Highest Salary" FROM  THARUN_EMPLOYEES WHERE SALARY=(SELECT MAX(SALARY) FROM THARUN_EMPLOYEES);

--14.Write a query to select second maximum salary from employees table. 

SELECT MAX(SALARY)AS "Second Highest Salary" FROM THARUN_EMPLOYEES WHERE SALARY < (SELECT MAX(SALARY) FROM THARUN_EMPLOYEES);

--15.Display average salary in the department 90 

SELECT AVG(SALARY)AS "Average Salary of dept_id =90",count(*) AS "Count of employee"FROM THARUN_EMPLOYEES WHERE DEPARTMENT_ID = 90;

--16.Display number of employees joined in each year into department 30. 

SELECT FIRST_NAME,YEAR_OF_JOINING,DEPARTMENT_ID,COUNT(*)AS "NUMBER OF EMPLOYEES IN DEPT=90" FROM THARUN_EMPLOYEES WHERE DEPARTMENT_ID=90 GROUP BY FIRST_NAME,YEAR_OF_JOINING,DEPARTMENT_ID;

--17.Display average salary for employees who did a job in the past. 

SELECT AVG(SALARY) AS "AVG SALARY OF PAST EMPLOYEES"FROM THARUN_EMPLOYEES WHERE YEAR_OF_RELIEVING<=GETDATE();

--18..Display the month in which more than 5 employees joined in any department 

SELECT MONTH(YEAR_OF_JOINING) AS MONTHS ,COUNT(ID) AS COUNTS  FROM THARUN_EMPLOYEES GROUP BY MONTH(YEAR_OF_JOINING) HAVING COUNT(ID)>5

--19.Display employee last name, starting date for all jobs from 2000 to 2005

SELECT FIRST_NAME,LAST_NAME,YEAR_OF_JOINING FROM THARUN_EMPLOYEES WHERE YEAR(YEAR_OF_JOINING) BETWEEN 2022 AND 2024

--20.Display years in which more than 10 employees joined. 

SELECT YEAR(YEAR_OF_JOINING) AS YEARS,COUNT(ID) AS COUNTS FROM THARUN_EMPLOYEES  GROUP BY YEAR(YEAR_OF_JOINING) HAVING COUNT(ID)>3

--21.Display employee ID for jobs with average salary more than 10000.  

SELECT AVG(SALARY) AS AVERAGES,ID FROM THARUN_EMPLOYEES GROUP BY ID HAVING AVG(SALARY)>=10000

--22.Display the number of days between working for all employees. 

SELECT FIRST_NAME, DATEDIFF(DAY,YEAR_OF_JOINING,YEAR_OF_RELIEVING) AS WORKING_DAYS FROM THARUN_EMPLOYEES
  
--23.Display employees who joined in the current year.  

 SELECT * FROM THARUN_EMPLOYEES WHERE YEAR(YEAR_OF_JOINING)=2022

--24.Display first name in upper case and last name in lower case. 

SELECT UPPER(FIRST_NAME) FIRST_NAME , LOWER(LAST_NAME) LAST_NAME FROM THARUN_EMPLOYEES

--25.Display the length of first name for employees where last name contain character ‘R’ after 3rd position.  

SELECT FIRST_NAME,LEN(FIRST_NAME) AS LENGTHS,CHARINDEX('R', LAST_NAME) as INDEXS FROM THARUN_EMPLOYEES  WHERE CHARINDEX('R',LAST_NAME)>3

