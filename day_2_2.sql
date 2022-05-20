/* emp_no = 499613인 근로자의 생년월일과 같은 사람을 찾자. */
SELECT * FROM employees
WHERE birth_date = '1953-06-09';

SELECT birth_date FROM employees
WHERE  emp_no = 499613;

SELECT * FROM employees
WHERE birth_date = (SELECT birth_date FROM employees WHERE emp_no = 499613);

/* emp_no = 499619인 사원과 같은 성별인 사람을 찾자. */
SELECT * FROM employees
WHERE gender = (SELECT gender FROM employees WHERE emp_no = 499619);

/* 499619인 사원은 안나오게 */
SELECT * FROM employees
WHERE gender = (SELECT gender FROM employees WHERE emp_no = 499619)
AND emp_no != 499619;

SELECT salary FROM salaries
WHERE emp_no = 10010;

SELECT * FROM salaries
WHERE salary = any (SELECT salary FROM salaries WHERE emp_no = 10010);

SELECT * FROM salaries
WHERE emp_no IN (499988, 499987, 499986)
ORDER BY emp_no DESC, from_date ASC;

/* 
생년월일이 늦은 사람이 젤 먼저 나오게하고, 
생년월일이 같다면 여성이 먼저 나오게 
*/
SELECT * FROM employees
ORDER BY birth_date DESC, gender desc; 

