CREATE DATABASE test;
DROP DATABASE test;

CREATE TABLE membertbl (
	memberID CHAR(8) NOT NULL PRIMARY key,
	memberName CHAR(5) NOT NULL,
	memberAddress CHAR(20) NULL
);
drop TABLE membertbl;

drop TABLE producttbl;
CREATE TABLE producttbl (
	productname CHAR(4) PRIMARY KEY,
	cost INT NOT NULL,
	makeDate DATE,
	company CHAR(5),
	amount INT NOT null
);

INSERT INTO membertbl VALUES (1, '홍길동', '서울시');
INSERT INTO membertbl VALUES (2, '홍길동', '서울시');
INSERT INTO membertbl (memberid, membername) VALUES (3, '홍길동');
INSERT INTO membertbl VALUES (5, '신사임당', '서울시'), 
(6, '홍길동', '서울시'), (7, '홍길동', '서울시');

SELECT memberid, membername, memberaddress FROM membertbl;
SELECT * FROM membertbl WHERE memberid = '1';
SELECT * FROM membertbl WHERE membername = '홍길동';
SELECT * FROM membertbl WHERE memberAddress = '서울시';
SELECT * FROM membertbl WHERE memberAddress != '서울시' OR memberAddress IS null;
SELECT * FROM membertbl WHERE memberAddress IS NULL;
SELECT * 
FROM membertbl 
WHERE memberAddress = '부산시' AND membername = '사나이';
SELECT *
FROM membertbl
WHERE membername LIKE '%이%';
SELECT *
FROM membertbl
WHERE membername LIKE '%이';
SELECT *
FROM membertbl
WHERE membername LIKE '나%';

UPDATE membertbl SET membername = '게일'
WHERE memberid = '7';
UPDATE membertbl SET membername = 'hong', memberaddress = '강원도'
WHERE memberid = '2' ;

DELETE FROM membertbl WHERE memberaddress IS NULL;
