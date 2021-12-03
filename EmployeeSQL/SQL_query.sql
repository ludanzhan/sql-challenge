--Create table for department information-----------------
CREATE TABLE department(
	dept_no VARCHAR(50) PRIMARY KEY,
	dept_name VARCHAR(20) NOT NULL
);

SELECT * FROM department;
------------------------------------------------------------

--Create table for employee information---------------------
CREATE TABLE employees(
	emp_no VARCHAR(50) PRIMARY KEY,
	emp_title_id VARCHAR(50) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

SELECT * FROM employees;
-------------------------------------------------------------

--Create Table for department manager-------------------------
CREATE TABLE dept_manag(
	dept_no VARCHAR(50) NOT NULL,
	emp_no VARCHAR(50) NOT NULL,
	CONSTRAINT FK_manag_dept FOREIGN KEY (dept_no)
        REFERENCES department(dept_no),
	CONSTRAINT FK_manag_empl FOREIGN KEY (emp_no)
        REFERENCES employees(emp_no)
);

SELECT * FROM dept_manag;
------------------------------------------------------------------

--Create table for employment of each department------------------
CREATE TABLE employ_dept(
	emp_no VARCHAR(50) NOT NULL,
	dept_no VARCHAR(50) NOT NULL,
	CONSTRAINT FK_employ_dept FOREIGN KEY (dept_no)
        REFERENCES department(dept_no),
	CONSTRAINT FK_employ_empl FOREIGN KEY (emp_no)
        REFERENCES employees(emp_no)
	
);
SELECT * FROM employ_dept;
--------------------------------------------------------------------

--Create table for salary info---------------------------------------
CREATE TABLE salary(
	emp_no VARCHAR(50) NOT NULL,
	salay INT NOT NULL,
	CONSTRAINT FK_salary_empl FOREIGN KEY (emp_no)
        REFERENCES employees(emp_no)
);

SELECT * FROM salary;
---------------------------------------------------------------------

--Create table for title---------------------------------------------
CREATE TABLE title(
	title_id VARCHAR(50) PRIMARY KEY,
	title VARCHAR(50) NOT NULL
);

SELECT * FROM title;
----------------------------------------------------------------------


----------------------------------------------------------------------
--1. List the following details of each employee:
-- employee number, last name, first name, sex, and salary
SELECT employees.emp_no, last_name,first_name, sex, salary
FROM employees
  JOIN salary ON
    employees.emp_no = salary.emp_no;
-----------------------------------------------------------------------


----------------------------------------------------------------------
--2.List first name, last name, and hire date for employees 
-- who were hired in 1986.
SELECT last_name,first_name, hire_date
FROM employees
WHERE date_part('year', hire_date) >1986 ;
-----------------------------------------------------------------------


----------------------------------------------------------------------
--3. List the manager of each department with the following information: 
-- department number, department name,
-- the manager's employee number, last name, first name.
SELECT department.dept_no,dept_name, dept_manag.emp_no,last_name,first_name
  FROM department 
    JOIN dept_manag ON
	  department.dept_no = dept_manag.dept_no
	 JOIN employees ON
	   dept_manag.emp_no = employees.emp_no 
-----------------------------------------------------------------------


----------------------------------------------------------------------
--4.List the department of each employee with the following information: 
-- employee number, last name, first name, and department name
SELECT employ_dept.emp_no, last_name,first_name, dept_name
  FROM employ_dept
  	JOIN employees ON
	   employ_dept.emp_no = employees.emp_no 
    JOIN department ON
	  employ_dept.dept_no = department.dept_no ;
----------------------------------------------------------------------


-----------------------------------------------------------------------
--5. List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B."
SELECT first_name,last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
----------------------------------------------------------------------


----------------------------------------------------------------------
--6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT employ_dept.emp_no, last_name,first_name, dept_name
  FROM employ_dept
  	JOIN employees ON
	   employ_dept.emp_no = employees.emp_no 
    JOIN department ON
	  employ_dept.dept_no = department.dept_no
	 WHERE dept_name = 'Sales'; 
-----------------------------------------------------------------------


----------------------------------------------------------------------
--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT employ_dept.emp_no, last_name,first_name, dept_name
  FROM employ_dept
  	JOIN employees ON
	   employ_dept.emp_no = employees.emp_no 
    JOIN department ON
	  employ_dept.dept_no = department.dept_no
	 WHERE dept_name = 'Sales' OR dept_name = 'Development' ; 
-----------------------------------------------------------------------


----------------------------------------------------------------------
--8.In descending order, list the frequency count of employee last names
SELECT last_name
FROM employees GROUP BY last_name ORDER BY COUNT(last_name) DESC;
-----------------------------------------------------------------------

