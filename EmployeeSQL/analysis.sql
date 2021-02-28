-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries on
employees.emp_no= salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date > '1985-12-31' AND hire_date <= '1986-12-31';

-- 3. List the manager of each department with the following information: 
--     department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_name, dept_manager.dept_no, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments on 
departments.dept_no = dept_manager.dept_no
JOIN employees on
employees.emp_no = dept_manager.emp_no;

-- 4. List the department of each employee with the following information: 
--      employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp on
dept_emp.emp_no = employees.emp_no
JOIN departments on
departments.dept_no = dept_emp.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp on
dept_emp.emp_no = employees.emp_no
JOIN departments on
departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
--    including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp on
dept_emp.emp_no= employees.emp_no
JOIN departments on
departments.dept_no= dept_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) 
FROM employees
GROUP BY last_name
ORDER BY last_name;

-- Epilogue (Q9)
SELECT employees.last_name, employees.first_name, departments.dept_name, titles.title, salaries.salary
FROM employees
JOIN dept_emp ON
dept_emp.emp_no = employees.emp_no
JOIN departments ON
departments.dept_no = dept_emp.dept_no
JOIN salaries ON
salaries.emp_no = employees.emp_no
JOIN titles ON
titles.title_id = employees.title_id
WHERE employees.emp_no = 499942;