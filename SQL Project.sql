/*Find an employee’s whose id is 52 and branch name is icicp*/

SELECT * 
FROM bank.employees e
join bank.bank_detail d
on e.Department_id=d.Department_id
where e.Employee_id=52 and Branch_name='ICIC_P';

/*Count the number of employees working in the loan department
and show its opening dates and address.*/

select  c.Employee_id,c.First_Name, c.City ,a.Opening_Date
FROM  bank.customer c
inner join bank.account_type a
on c.Account_no=a.Account_no
where Department_name='Loan';

SELECT Department_id, COUNT(Employee_id) Count_of_Employee FROM bank.employees GROUP BY Department_id HAVING Department_id=8;


/*Find details department name, address, branch code, dept _id,
city of the account no 18190.*/

select  c.Account_No, d.Department_id, d.Department_name,c.Branch_code,c.City
FROM  bank.customer c
inner join bank.departments d
on c.Account_no=d.Account_no
where c.Account_no = 18190 ;

/*Find department id, department name, job id whose only work in
Loan, HR, admin.*/

select  d.Department_id, d.Department_name,e.Job_id
FROM  bank.departments d
inner join bank.employees e
on d.Department_id=e.Department_id
where d.Department_name IN ('Loan', 'HR', 'Admin') ;

/*Find the type_account, state account number whose atm no
422748663.*/

select Account_No, ATM_NO
from bank.customer
where ATM_NO = 422748663 ;

/*Create a view with that show address, branch name, department
name, first name. phone no.*/

CREATE VIEW bank.view_customer as
select  c.First_Name, c.Phone_no,b.Branch_name,b.Address
FROM  bank.customer c
inner join bank.bank_detail b
on b.Branch_code=c.Branch_code;

/*Create view city, department name whose opening date is less
than 24 May 04*/

CREATE view bank.view_customer2 as
select  c.City, d.Department_name,a.Opening_Date
FROM  bank.customer c
inner join bank.departments d
on c.Account_No=d.Account_No

inner join bank.account_type a
on d.Account_no=a.Account_No 

where a.Opening_Date<'2004-05-24';


/*Create view only job id for clerk, manager, an accountant with all
detail and name it employee job_deatils*/

CREATE VIEW bank.employee_job_deatils AS
SELECT * 
FROM bank.employees
where Job_id IN ('ST_CLERK','ST_MAN','FI_ACCOUNT');

/*In the job details change the atm pin 423295535 with 42321992*/
UPDATE bank.customer
SET ATM_NO=42321992
where Account_No= 13145;

/*In the job, details change all sales account into admin and
account type into saving*/

UPDATE bank.account_type
SET Department_name='Admin'
where Department_name='Sales';

UPDATE bank.account_type
SET Type_Account='Saving';

