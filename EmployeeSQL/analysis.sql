-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries on
employees.emp_no= salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date > '1985-12-31' AND hire_date <= '1986-12-31'

-- 3. List the manager of each department with the following information: 
--     department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_name, dept_manager.dept_no, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments on 
departments.dept_no = dept_manager.dept_no
JOIN employees on
employees.emp_no = dept_manager.emp_no;

-- List the department of each employee with the following information: 
--      employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp on
dept_emp.emp_no = employees.emp_no
JOIN departments on
departments.dept_no = dept_emp.dept_no