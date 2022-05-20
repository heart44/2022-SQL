USE `employees`;

SELECT * FROM departments;
/* 
1. departments 테이블에 레코드 등록해 주세요.
dept_no : d010
dept_name : Business
*/
INSERT INTO departments (dept_no, dept_name)
VALUES ('d010', 'Business');


SELECT * FROM employees;
/* 
2. employees 테이블에 근로자 등록해 주세요.
emp_no : 500000
birth_date : 1999-10-10
first-name : Gildong
last_name : Hong
gender : M
hire_date : 2022-03-29
*/
INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES (500000, '1999-10-10', 'Gildong', 'Hong', 'M', '2022-03-29');

SELECT * FROM employees;
/* 
3. employees 테이블에서 여자면서 last_name에 'ch'가 포함돼 있는 사람들 모두 
select 하시오.
*/
SELECT * FROM employees
WHERE gender ='F' AND last_name LIKE '%ch%';

/* 년도로 찾고 싶을 때 */
SELECT * FROM employees 
where LEFT(birth_date, 4) = '1952';

SELECT * FROM employees; 
/* 
4. employees 테이블에서
emp_no : 500000 사원의 성별을 여성으로 바꾸고,
hire_date : 2021-03-29로 바꾸고,
first-name : Jindong으로 변경
*/
UPDATE employees SET gender = 'F', hire_date = '2021-03-29', first_name = 'Jindong'
WHERE emp_no = 500000;

/* employees 테이블에서 고용일이 2020년 이후인 사람 삭제 */
DELETE from employees WHERE LEFT(hire_date, 4) >= '2020';
