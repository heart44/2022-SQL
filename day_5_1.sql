-- 형 변환 convert
SELECT '10';
SELECT CONVERT('10', INT); -- 강제 형 변환

SELECT '10' + '10'; -- 자동 형 변환

SELECT 10;
SELECT CONVERT(10, CHAR);

-- 형 변환 cast
SELECT CAST('10' AS INT);

-- 문자열 합치기 concat, concat_ws
SELECT CONCAT('A1', '_', 'A2');
SELECT CONCAT_WS(' - ', 'A', 'B', 'C');

-- if
SELECT if(100>200, '100은 200보다 크다', '100은 200보다 작다');
/* gender 값이 'M'이면 '남자', 'F'면 '여자'가 뜨도록 해주세요. */
SELECT gender, if(gender='M', '남자', '여자') FROM employees;

-- 응용
SELECT if('A'='M', '남자', if('A'='F', '여자', '외계인'));

/* 
응용2
농구 > basketball
배구 > valleyball
야구 > baseball
*/
SELECT * FROM t_hobbit;
SELECT nm, if(nm = '농구', 'basketball', if(nm = '배구', 'valleyball', 'baseball')) 
FROM t_hobbit;

SELECT if(nm = '농구', 
				CONCAT(nm, ' basketball'), 
				if(nm = '배구', 
					CONCAT(nm, ' valleyball'), 
					CONCAT(nm, ' baseball')
				)
			) 
FROM t_hobbit;

-- ifnull
SELECT *, IFNULL(memberAddress, '주소없음')
FROM membertbl;

-- nullif
SELECT NULLIF('안녕', '안녕');
SELECT NULLIF('안녕1', '안녕2');

-- case 값 when 비교값 then 결과값
SELECT nm,
	case nm
		when '농구' then 'basketball'
		when '배구' then 'valleyball'
		when '야구' then 'baseball'
	end
FROM t_hobbit;

-- case when 조건식 then 결과값
SELECT nm,
	case when nm = '농구' then 'basketball'
		  when nm = '배구' then 'valleyball'
		  when nm = '야구' then 'baseball'
		  ELSE '없음'
	end
FROM t_hobbit;

-- format
SELECT FORMAT(1212121212, 0);

-- insert
SELECT INSERT('abcdefghi', 3, 4, '@@@@'), 
		 INSERT('abcdefghi', 3, 0, '@@@@');

-- trim
SELECT '     abc      ', TRIM('     abc      ');
SELECT TRIM(BOTH 'ㅋ' FROM 'ㅋㅋㅋㅋ재밌어요ㅋㅋㅋㅋ');

-- date_format
SELECT *, DATE_FORMAT(created_at, '%y.%m.%d %h:%i %p') FROM t_hobbit_2;


