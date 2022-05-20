USE `test`;

-- auto_increment
CREATE TABLE t_hobbit (
	i_hobbit INT UNSIGNED AUTO_INCREMENT,
	nm VARCHAR(10) UNIQUE NOT NULL,
	PRIMARY KEY (i_hobbit)
);

INSERT INTO t_hobbit (nm)
VALUES ('농구');
INSERT INTO t_hobbit (nm)
VALUES ('축구');
INSERT INTO t_hobbit (nm)
VALUES ('야구');
INSERT INTO t_hobbit (nm)
VALUES ('배구');

SELECT * FROM t_hobbit;

CREATE TABLE t_hobbit_2 (
	hobbit_id INT UNSIGNED PRIMARY KEY,
	NAME VARCHAR(20) NOT NULL,
	created_at DATETIME DEFAULT NOW()
);

SELECT * FROM t_hobbit_2;

INSERT INTO t_hobbit_2 (hobbit_id, NAME)
VALUES (1, '핸드볼');
INSERT INTO t_hobbit_2 (hobbit_id, NAME, created_at)
VALUES (2, '등산', '2022-02-10');
INSERT INTO t_hobbit_2 (hobbit_id, NAME, created_at)
VALUES (3, '독서', '2022-02-10 12:12:14');

INSERT INTO t_hobbit_2 (hobbit_id, NAME)
SELECT i_hobbit + 3, nm FROM t_hobbit;                                                                                       

-- insert ignore
SELECT * FROM t_hobbit_2;
INSERT ignore INTO t_hobbit_2 (hobbit_id, NAME) VALUES (7, '탁구');
INSERT ignore INTO t_hobbit_2 (hobbit_id, NAME) VALUES (8, '족구');

INSERT INTO t_hobbit_2 (hobbit_id, NAME) VALUES (8, '산책')
ON DUPLICATE KEY UPDATE NAME = '달리기';

CREATE table t_board(
	i_board INT UNSIGNED PRIMARY KEY,
	hits INT UNSIGNED DEFAULT 0;
);

SELECT * FROM t_board;

INSERT INTO t_board (i_board, hits) VALUES (1, 0)
ON DUPLICATE KEY UPDATE hits = hits + 1;


-- 문제
CREATE TABLE t_order (
	o_no INT unsigned PRIMARY KEY,
	cus_no INT unsigned,
	o_date DATE default NOW(),
	o_price INT DEFAULT 0,
	FOREIGN KEY (cus_no) REFERENCES t_customer(cus_no)
);
DROP TABLE t_order;

CREATE TABLE t_customer(
	cus_no INT unsigned PRIMARY KEY,
	nm varCHAR(10) NOT null
);
DROP TABLE t_customer;

SELECT * FROM t_order;
SELECT * FROM t_customer;

INSERT INTO t_customer (cus_no, nm)
VALUES (3, '홍길동'), (5, '이순신');

INSERT INTO t_order (o_no, cus_no, o_price)
VALUES (1, 3, 55000), (2, 5, 70000), (3, 3, 60000);

UPDATE t_customer SET nm = '장보고'
WHERE cus_no = 5;

DELETE FROM t_order WHERE o_no = 2;

SELECT * FROM t_order
WHERE cus_no = 3;

SELECT o_no, o_price FROM t_order;