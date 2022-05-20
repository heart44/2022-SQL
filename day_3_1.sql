SELECT * FROM dept_emp;

-- dept_emp 테이블에서 dept_no의종류가 몇개?
SELECT distinct dept_no FROM dept_emp;

-- 사원의 직무가 무엇이 있는지 select 해주시오.
SELECT DISTINCT title FROM titles;

SELECT * FROM employees
LIMIT 20;

SELECT * FROM employees
LIMIT 10, 10;

/* 가장 많은 연봉을 받은 금액 3개만 나오게. (사람, 연도 상관 없음) */
SELECT * FROM salaries
ORDER BY salary DESC
LIMIT 3;

/* 위의 결과에서 5~10위만 나오도록 */
SELECT * FROM salaries
ORDER BY salary DESC
LIMIT 4, 6;

/* 테이블 복사 */
-- 테이블 컬럼, 데이터 타입, 레코드 복사
CREATE TABLE departments_tmp as
(SELECT * FROM departments);
-- 테이블 스키마 복사 (레코드 X)
CREATE TABLE departments_tmp2
LIKE departments;
-- 복사된 테이블에 데이터 넣기
INSERT INTO departments_tmp2
SELECT * FROM departments;

-- 그룹 함수
SELECT MIN(salary), max(salary), sum(salary), avg(salary), COUNT(emp_no) 
FROM salaries;

-- group by
SELECT emp_no, MIN(salary), max(salary), sum(salary), avg(salary), COUNT(*) 
FROM salaries
GROUP BY emp_no;

SELECT * FROM dept_emp;
/* 부서별 사원수, 	부서별 사원수가 20000명 이상인 부서만 나오도록 */
SELECT dept_no, COUNT(*)
FROM dept_emp
GROUP BY dept_no
HAVING COUNT(*) >= 20000
ORDER BY COUNT(*) desc;

/* 가장 적은 salary를 받은 사람의 이름이 나오도록 */
SELECT * 
FROM employees
WHERE emp_no = (SELECT emp_no FROM salaries ORDER BY salary LIMIT 1);

SELECT first_name, last_name 
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no 
ORDER BY salary 
LIMIT 1;

-- 각 직업별로 평균 급여 확인
SELECT title, avg(salary) AS avg_salary 
FROM titles A INNER JOIN salaries B ON a.emp_no = b.emp_no
GROUP BY a.title;
 
-- emp_no : 10001의 모든 salary를 1000씩 올리고 싶다.
UPDATE salaries
SET salary = salary + 1000
WHERE emp_no = 10001;

WITH dept_emp_d001(aaa, from_date, to_date)
AS (
	SELECT emp_no, from_date, to_date
	FROM dept_emp
	WHERE dept_no = 'd001'
	)
SELECT * FROM dept_emp_d001;

 