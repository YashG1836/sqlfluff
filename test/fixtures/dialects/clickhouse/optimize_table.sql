-- https://clickhouse.com/docs/sql-reference/statements/optimize
OPTIMIZE TABLE example;

OPTIMIZE TABLE db.example FINAL;

OPTIMIZE TABLE example ON CLUSTER my_cluster FINAL;

OPTIMIZE TABLE example PARTITION 201901 FINAL;

OPTIMIZE TABLE example PARTITION ID '201901' FINAL DEDUPLICATE;

OPTIMIZE TABLE example PARTITION tuple('JP', toYYYYMM(toDate('2019-01-25'))) FINAL;

OPTIMIZE TABLE example FORCE;

OPTIMIZE TABLE example DEDUPLICATE;

OPTIMIZE TABLE example FINAL DEDUPLICATE BY primary_key, secondary_key, partition_key;

OPTIMIZE TABLE example FINAL DEDUPLICATE BY *;

OPTIMIZE TABLE example FINAL DEDUPLICATE BY * EXCEPT materialized_value;

OPTIMIZE TABLE example FINAL DEDUPLICATE BY * EXCEPT (materialized_value, value);

OPTIMIZE TABLE example FINAL DEDUPLICATE BY COLUMNS('.*_key');

OPTIMIZE TABLE example FINAL DEDUPLICATE BY COLUMNS('.*_key') EXCEPT secondary_key;
