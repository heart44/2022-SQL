CREATE TABLE t_member_hobbit (
	member_id CHAR(8) NOT NULL,
	hobbit_id INT(10) UNSIGNED NOT NULL,
	PRIMARY KEY (member_id, hobbit_id),
	FOREIGN KEY (member_id) REFERENCES membertbl(memberID),
	FOREIGN KEY (hobbit_id) REFERENCES t_hobbit_2(hobbit_id)
);

SELECT * FROM t_member_hobbit;

INSERT INTO t_member_hobbit (member_id, hobbit_id) VALUES ('1', 1);
INSERT INTO t_member_hobbit (member_id, hobbit_id) VALUES ('1', 2);
INSERT INTO t_member_hobbit (member_id, hobbit_id)
VALUES ('2', 3), ('2', 7), ('2', 8);
INSERT INTO t_member_hobbit (member_id, hobbit_id) VALUES ('7', 5);

SELECT B.*, A.*, C.* FROM t_member_hobbit A
INNER JOIN membertbl B
ON A.member_id = B.memberID
INNER JOIN t_hobbit_2 C
ON A.hobbit_id = C.hobbit_id;

SELECT B.*, A.*, C.* 
from t_member_hobbit A, membertbl B, t_hobbit_2 C
WHERE A.member_id = B.memberID AND A.hobbit_id = C.hobbit_id;

