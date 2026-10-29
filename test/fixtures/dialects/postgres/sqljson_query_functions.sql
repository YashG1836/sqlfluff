-- SQL/JSON query functions (PostgreSQL 17)
-- https://www.postgresql.org/docs/current/functions-json.html#SQLJSON-QUERY-FUNCTIONS
SELECT JSON_EXISTS(jsonb '{"key1": [1, 2, 3]}', 'strict $.key1[*] ? (@ > $x)' PASSING 2 AS x);

SELECT JSON_EXISTS(jsonb '{"a": [1, 2, 3]}', 'lax $.a[5]' ERROR ON ERROR);

SELECT JSON_EXISTS(js, '$.a' TRUE ON ERROR) FROM tbl;

SELECT JSON_QUERY(jsonb '[1, [2, 3], null]', 'lax $[*][$off]' PASSING 1 AS off WITH CONDITIONAL WRAPPER);

SELECT JSON_QUERY(jsonb '{"a": "[1, 2]"}', 'lax $.a' OMIT QUOTES);

SELECT JSON_QUERY(js, '$.a' WITH UNCONDITIONAL ARRAY WRAPPER KEEP QUOTES ON SCALAR STRING) FROM tbl;

SELECT JSON_QUERY(js, '$.a' RETURNING jsonb WITHOUT WRAPPER EMPTY ARRAY ON EMPTY NULL ON ERROR) FROM tbl;

SELECT JSON_VALUE(jsonb '"123.45"', '$' RETURNING float);

SELECT JSON_VALUE(jsonb '[1,2]', 'strict $[$off]' PASSING 1 AS off);

SELECT JSON_VALUE(jsonb '[1,2]', 'strict $[*]' DEFAULT 9 ON ERROR);

SELECT JSON_VALUE(js, '$.a' RETURNING int DEFAULT 0 ON EMPTY ERROR ON ERROR) FROM tbl;
