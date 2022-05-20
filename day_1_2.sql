SELECT * FROM employees
WHERE emp_no >= 10010 AND emp_no <= 10020 AND gender = 'F';

SELECT * FROM employees
WHERE emp_no BETWEEN 10010 AND 10020;

SELECT * FROM departments
WHERE dept_no = 'd001' or dept_no = 'd003' or dept_no = 'd005';

SELECT * FROM departments
WHERE dept_no IN ('d001', 'd003', 'd005');

SELECT * FROM employees
WHERE emp_no % 2 = 0;

SELECT * FROM departments
WHERE dept_no % 2 = 0;