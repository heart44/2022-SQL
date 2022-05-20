/* 사원번호, 사원명, 직책, 부서이름 나타나게 select */
SELECT A.emp_no, A.first_name, A.last_name, C.dept_name, D.title 
FROM employees A, dept_emp B, departments C, titles D
WHERE A.emp_no = B.emp_no AND B.dept_no = C.dept_no
AND A.emp_no = D.emp_no;

SELECT A.emp_no, A.first_name, A.last_name, C.dept_name,D.title
FROM employees A
INNER JOIN dept_emp B
ON A.emp_no = B.emp_no
INNER JOIN departments C
ON B.dept_no = C.dept_no
INNER JOIN titles D
ON A.emp_no = D.emp_no;

/* 남녀 사원들의 평균 연봉 */
SELECT A.gender, AVG(B.salary)
FROM employees A, salaries B
WHERE A.emp_no = B.emp_no
GROUP BY A.gender;

SELECT A.gender, AVG(B.salary)
FROM employees A
INNER JOIN salaries B
ON A.emp_no = B.emp_no
GROUP BY A.gender;

-- 부서별 가장 높은 개인 평균 연봉 값(나중에 해보기)
/*
개인마다 평균 연봉 구함 > 개인을 부서로 조인 
> 부서별로 그룹 묶음  > 가장 높은 평균연봉 값
*/
SELECT B.dept_no, C.dept_name, MAX(A.avg_salary)
FROM (SELECT emp_no, AVG(salary) AS avg_salary 
		FROM salaries 
		GROUP BY emp_no) A, dept_emp B, departments C
WHERE A.emp_no = B.emp_no AND B.dept_no = C.dept_no
GROUP BY B.dept_no;

SELECT X.dept_no, MAX(Z.avg_salary) AS max_salary
FROM (
	SELECT emp_no, AVG(salary) AS avg_salary 
	FROM salaries
	GROUP BY emp_no
) Z
INNER JOIN dept_emp X
ON Z.emp_no = X.emp_no
GROUP BY X.dept_no;

/* 부서별 부서이름, 연봉 평균값, max값, min값 */
SELECT B.dept_no, D.dept_name, AVG(C.salary), MAX(C.salary), MIN(C.salary)
FROM dept_emp B, salaries C, departments D
WHERE B.emp_no = C.emp_no AND B.dept_no = D.dept_no
GROUP BY B.dept_no;

SELECT B.dept_no, C.dept_name, AVG(A.salary), MAX(A.salary), MIN(A.salary)
FROM salaries A
INNER JOIN dept_emp B
ON A.emp_no = B.emp_no
INNER JOIN departments C
ON B.dept_no = C.dept_no
GROUP BY B.dept_no, C.dept_name;

/* 직무별 연봉 평균값 */
SELECT A.title, AVG(B.salary)
FROM titles A, salaries B
WHERE A.emp_no = B.emp_no
GROUP BY A.title;
