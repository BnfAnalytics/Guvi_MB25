
use guvidm25; # Select particular database
select * from categories; # extract all data from a table
SeLect * from customers; 
select customername,city from customers; # Extract particular column from a table
select orderid,employeeid from orders;

# Q1. Extract data from city as London
SeLect * 
from customers 
where city='London'; # to filter data by London city

select* from customers
where country='UK' and city='Madrid'; # both condition must be true

select* 
from customers
where country='UK' or city='Mad' # either condition can be true
order by contactname desc;

CREATE SCHEMA new_schema ; # Create new schema

select* from new_schema.mb25;
select* from guvidm25.employees;