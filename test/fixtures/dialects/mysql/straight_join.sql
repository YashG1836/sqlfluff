-- https://dev.mysql.com/doc/refman/8.4/en/join.html
SELECT * FROM t1 STRAIGHT_JOIN t2 ON t1.a = t2.a;

SELECT * FROM t1 STRAIGHT_JOIN t2;

SELECT * FROM t1 STRAIGHT_JOIN t2 USING (a);

SELECT t1.a, t3.c
FROM t1
STRAIGHT_JOIN t2 ON t1.a = t2.a
LEFT JOIN t3 ON t3.b = t2.b;

-- STRAIGHT_JOIN as a SELECT modifier still works
SELECT STRAIGHT_JOIN t1.a FROM t1 JOIN t2 ON t1.a = t2.a;
