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
