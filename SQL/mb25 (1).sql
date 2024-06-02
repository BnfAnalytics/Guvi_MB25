CREATE SCHEMA mb25 ; # Create new schema
use mb25; # Select particular database
select * from categories; # extract all data from a table
SeLect * from customers; 
select customername,city from customers; # Extract particular column from a table
select orderid,employeeid from orders;

# Q1. Extract data from city as London
SeLect * 
from customers 
where city='London'; # to filter data by London city

select customer_Name from customers
where country='UK' and city='Madrid'; # both condition must be true

select* 
from customers
where country='UK' or city='Mad' # either condition can be true
order by contactname desc;



select* from new_schema.mb25;
select* from guvidm25.employees;

# Advanced SQL-16th March 2024
CREATE SCHEMA mb25 ; # Create new schema
use mb25;

-- Create 1st Table
create table emp
(empid int,
 Firstname varchar(50), # Char(0 -255), varchar(0 to 65535)
 Lastname varchar(50),
 Age int,
 Gender varchar(50)
 );
 select* from emp;
 
# insert data/values in the Table

Insert into emp values
(1001,'Jim','Halpert',30,'Male'),
(1002,'Pam','Sharma',30 ,'Female'),
(1003,'Dwight','Schrute',29,'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male');

select* from emp;

# Create Table-2 by the name "empsalary" , keep column name as "empid, jobtitle, salary")
create table empsalary
(empid int,
jobtitle varchar(50),
salary int);

Insert into empsalary values
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000);


Insert into emp values
(1011,'Ryan','Howard',26, 'Male'),
(NULL, 'Holly','Flax',NULL,NULL),
(1013,'Darryl','Philbin',Null,'Male');

select* from emp;

create table itemp
(empid int,
 Firstname varchar(50), # Char(0 -255), varchar(0 to 65535)
 Lastname varchar(50),
 Age int,
 Gender varchar(50)
 );
Insert into itemp values
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female');

select* from itemp;

/* Joins in SQL
1. Inner Join
2. Full join
3. Left Join
4. Right Join
*/

select* from emp;
select* from empsalary;

select emp.empid, firstname, lastname, age , gender, jobtitle, salary 
from emp  # Table A/Left
inner join empsalary
on emp.empid=empsalary.empid
where gender='Male' and age>30;

select * 
from emp  # Table A/Left
Right join empsalary on emp.empid=empsalary.empid
Left join empsalary on emp.empid=empsalary.empid;

select * 
from emp  # Table A/Left
Left join empsalary
on emp.empid=empsalary.empid;

# Union/Union all

select* from emp;
select* from empsalary;

select empid,Firstname,Age from emp
union all
select* from empsalary;

select* from emp
union    # UNION ALL allow duplicate values
select* from itemp;

# Pivot in SQL-CASE statement
select Firstname, Lastname, age,
case
    when age>32 then 'Experienced'
    when age between 30 and 32 then'Professionals'
    else 'Freshers'
end as Experience
from emp
where age is not null
order by age desc;
# Question: HR need to calculate salary after increment but as per the jobtitle HR need to give increments. Like to "Salesman-10% increments"

select empsalary.empid,firstname, lastname, jobtitle, salary,
case
  when jobtitle='Salesman' then salary+(salary*0.10)
  when jobtitle='Accountant' then salary+(salary*0.05)
  when jobtitle='HR' then salary+(salary*0.00001)
  else salary+(salary*0.03)
END as incSalary
from empsalary
join emp
on empsalary.empid=emp.empid;

# Having clause
select jobtitle,avg(salary) as avgsalary
from empsalary
group by jobtitle
having avgsalary>48500;

select avg(salary) as avgsalary
from empsalary;

# updating and deleting Data
select* from emp;

update emp
set empid=1012
where firstname='Holly' and lastname='Flax';

update emp
set age=31,gender='Female'
where firstname='Holly' and lastname='Flax';

# String Functions for data cleaning
create table emperror
(empid varchar(50),
 firstname varchar(50),
 lastname varchar(50)
 );
 
 insert into emperror values
 ('1001  ','Jimbo','Potter'),
 ('  1002','Pamela','Beasely'),
 ('1003','TOby','Flex-Fired');

# Trim, Ltrim, Rtrim
select empid,trim(empid)
from emperror;

select empid,ltrim(empid)
from emperror;

select empid,rtrim(empid)
from emperror;

# replace
select lastname,replace(lastname,'-Fired','') as newname
from emperror;

-- upper/lower
select firstname,lower(firstname),upper(firstname)
from emperror;
select upper(firstname)
from emperror;

/* Subqueries
1. SELECT
2. FROM
3. WHERE
*/
# select
select empid,salary,(select avg(salary) from empsalary) as allavgsalary
from empsalary;

#FROM
select empid,allavgsalary
from (select empid,salary,(select avg(salary) from empsalary) as allavgsalary
      from empsalary) as newtable;
      
# WHERE
select*
from empsalary
where empid in (
                select empid
                from emp
                where age>30);























