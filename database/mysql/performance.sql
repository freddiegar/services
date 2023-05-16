-- https://dev.mysql.com/doc/refman/5.7/en/optimization.html
-- https://orangematter.solarwinds.com/2019/02/05/the-left-prefix-index-rule/

-- 10 more expensive queries

SELECT
    SCHEMA_NAME as db,
    SUM_TIMER_WAIT as total,
    COUNT_STAR as calls,
    AVG_TIMER_WAIT as avg,
    DIGEST_TEXT as query
FROM events_statements_summary_by_digest
WHERE 1 = 1
    AND SCHEMA_NAME NOT IN ('tpm')
    AND DIGEST_TEXT NOT LIKE 'SHOW T%'
    AND DIGEST_TEXT NOT LIKE 'SET %'
    AND DIGEST_TEXT NOT LIKE 'USE %'
    AND DIGEST_TEXT NOT LIKE 'SHOW %'
    AND DIGEST_TEXT NOT LIKE 'SELECT @@%'
    AND DIGEST_TEXT NOT LIKE 'SELECT SQL_NO_CACHE %'
    AND DIGEST_TEXT NOT LIKE 'START TRANSACTION %'
    AND DIGEST_TEXT NOT LIKE 'ROLLBACK %'
    AND DIGEST_TEXT NOT LIKE 'SAVEPOINT %'
    AND DIGEST_TEXT NOT LIKE 'RELEASE %'
    AND DIGEST_TEXT NOT LIKE 'FLUSH %'
    AND DIGEST_TEXT NOT LIKE 'UNLOCK %'
ORDER BY SUM_TIMER_WAIT DESC
LIMIT 10

-- @see https://www.percona.com/blog/queries-for-finding-poorly-designed-mysql-schemas-and-how-to-fix-them/

-- Find tables without PK

SELECT t.table_schema,t.table_name,t.engine
FROM information_schema.tables t
JOIN information_schema.columns c
ON t.table_schema=c.table_schema
AND t.table_name=c.table_name
WHERE 1=1
AND t.table_schema = 'mpi_co'
AND t.table_schema NOT IN ('mysql', 'information_schema', 'sys', 'performance_schema')
AND t.table_schema NOT IN ('prestashop', 'wordpress', 'magento', 'xhgui', 'sylius')
AND t.table_schema NOT IN ('lubri_centro', 'registrar', 'lubri_centro_tmp', 'job_center')
AND t.table_schema NOT LIKE '%phpunit'
AND t.table_name NOT IN ('password_resets', 'telescope_entries_tags', 'telescope_monitoring')
AND t.table_type = 'BASE TABLE'
GROUP BY t.table_schema,t.table_name, t.engine
HAVING SUM(IF(c.column_key IN ('PRI','UNI'), 1,0)) = 0;

-- Find columns in tables by type

SELECT table_schema, table_name, column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE 1 = 1
AND data_type IN ('datetime')
AND table_schema = 'microsites_co';

-- Find tables with non-integer PK's

SELECT table_schema, table_name, column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE column_key IN ('PRI','UNI')
AND ordinal_position=1
AND data_type NOT IN ('tinyint', 'smallint', 'mediumint', 'int', 'bigint', 'timestamp', 'datetime')
AND table_schema = 'mpi_co'
AND table_schema NOT IN ('mysql', 'information_schema', 'sys', 'performance_schema')
AND table_schema NOT IN ('prestashop', 'wordpress', 'magento', 'xhgui', 'sylius')
AND table_schema NOT IN ('lubri_centro', 'registrar', 'lubri_centro_tmp', 'job_center')
AND table_schema NOT LIKE '%phpunit';

-- Find tables not using InnoDB

SELECT t.table_schema,t.table_name,t.engine
FROM information_schema.tables t
WHERE 1=1
AND t.table_schema = 'mpi_co'
AND t.table_schema NOT IN ('mysql', 'information_schema', 'sys', 'performance_schema')
AND t.table_schema NOT IN ('prestashop', 'wordpress', 'magento', 'xhgui', 'sylius')
AND t.table_schema NOT IN ('lubri_centro', 'registrar', 'lubri_centro_tmp', 'job_center')
AND t.table_schema NOT LIKE '%phpunit'
AND t.engine <> 'InnoDB'
AND t.table_type = 'BASE TABLE';

-- Find tables and indexes with the most latency
-- Amdhal's law: the overall performance improvement gained by optimizing a single part of a system, is limited by the fraction of time that the improved part is actually used

SELECT *
FROM sys.schema_table_statistics
WHERE 1=1
AND table_schema = 'mpi_co'
AND table_schema NOT IN ('mysql', 'information_schema', 'sys', 'performance_schema')
AND table_schema NOT IN ('prestashop', 'wordpress', 'magento', 'xhgui', 'sylius')
AND table_schema NOT IN ('lubri_centro', 'registrar', 'lubri_centro_tmp', 'job_center')
AND table_schema NOT LIKE '%phpunit';

SELECT *
FROM sys.schema_index_statistics
WHERE 1=1
AND table_schema = 'mpi_co'
AND table_schema NOT IN ('mysql', 'information_schema', 'sys', 'performance_schema')
AND table_schema NOT IN ('prestashop', 'wordpress', 'magento', 'xhgui', 'sylius')
AND table_schema NOT IN ('lubri_centro', 'registrar', 'lubri_centro_tmp', 'job_center')
AND table_schema NOT LIKE '%phpunit';

-- Find tables whose indexes > data by 50%

SELECT table_schema, table_name, index_length, data_length, index_length/data_length AS index_to_data_ratio
FROM information_schema.tables
WHERE 1=1
AND table_schema = 'mpi_co'
AND table_schema NOT IN ('mysql', 'information_schema', 'sys', 'performance_schema')
AND table_schema NOT IN ('prestashop', 'wordpress', 'magento', 'xhgui', 'sylius')
AND table_schema NOT IN ('lubri_centro', 'registrar', 'lubri_centro_tmp', 'job_center')
AND table_schema NOT LIKE '%phpunit';
AND INDEX_LENGTH > DATA_LENGTH*1.5;

-- Find tables with duplicate indexes

SELECT table_schema,table_name,redundant_index_name AS redundant_index, redundant_index_columns AS redundant_columns, dominant_index_name AS covered_by_index,sql_drop_index
FROM sys.schema_redundant_indexes
WHERE 1=1
AND table_schema = 'mpi_co'
AND table_schema NOT IN ('mysql', 'information_schema', 'sys', 'performance_schema')
AND table_schema NOT IN ('prestashop', 'wordpress', 'magento', 'xhgui', 'sylius')
AND table_schema NOT IN ('lubri_centro', 'registrar', 'lubri_centro_tmp', 'job_center')
AND table_schema NOT LIKE '%phpunit';

-- Find unused indexes

SELECT *
FROM sys.schema_unused_indexes
WHERE 1=1
AND object_schema = 'mpi_co'
AND object_schema NOT IN ('mysql', 'information_schema', 'sys', 'performance_schema')
AND object_schema NOT IN ('prestashop', 'wordpress', 'magento', 'xhgui', 'sylius')
AND object_schema NOT IN ('lubri_centro', 'registrar', 'lubri_centro_tmp', 'job_center')
AND object_schema NOT LIKE '%phpunit';

/*
desc events_statements_summary_by_digest;
+-----------------------------+---------------------+------+-----+---------------------+-------+
| Field                       | Type                | Description
+-----------------------------+---------------------+------+-----+---------------------+-------+
| SCHEMA_NAME                 | varchar(64)         | Database related
| DIGEST                      | varchar(32)         | UUID
| DIGEST_TEXT                 | longtext            | SQL stament executed normalized
| COUNT_STAR                  | bigint(20) unsigned | Number of time executed
| SUM_TIMER_WAIT              | bigint(20) unsigned | Total amount of time all COUNT_STAR times
| MIN_TIMER_WAIT              | bigint(20) unsigned |
| AVG_TIMER_WAIT              | bigint(20) unsigned |
| MAX_TIMER_WAIT              | bigint(20) unsigned |
| SUM_LOCK_TIME               | bigint(20) unsigned | Total time locking table
| SUM_ERRORS                  | bigint(20) unsigned |
| SUM_WARNINGS                | bigint(20) unsigned |
| SUM_ROWS_AFFECTED           | bigint(20) unsigned |
| SUM_ROWS_SENT               | bigint(20) unsigned |
| SUM_ROWS_EXAMINED           | bigint(20) unsigned |
| SUM_CREATED_TMP_DISK_TABLES | bigint(20) unsigned | Temporary tables time on disk
| SUM_CREATED_TMP_TABLES      | bigint(20) unsigned | Temporary tables time on memory
| SUM_SELECT_FULL_JOIN        | bigint(20) unsigned |
| SUM_SELECT_FULL_RANGE_JOIN  | bigint(20) unsigned |
| SUM_SELECT_RANGE            | bigint(20) unsigned |
| SUM_SELECT_RANGE_CHECK      | bigint(20) unsigned |
| SUM_SELECT_SCAN             | bigint(20) unsigned |
| SUM_SORT_MERGE_PASSES       | bigint(20) unsigned |
| SUM_SORT_RANGE              | bigint(20) unsigned |
| SUM_SORT_ROWS               | bigint(20) unsigned |
| SUM_SORT_SCAN               | bigint(20) unsigned |
| SUM_NO_INDEX_USED           | bigint(20) unsigned |
| SUM_NO_GOOD_INDEX_USED      | bigint(20) unsigned |
| FIRST_SEEN                  | timestamp           |
| LAST_SEEN                   | timestamp           |
+-----------------------------+---------------------+------+-----+---------------------+-------+
*/

-- Time Gold
-- Response time expected between Client and Server
-- A query is a task (with sub-task), split and check each part
-- 1. What is current time taken?
-- 2. Reduce sub-task (limit, columns, index, filter, order, etc)
-- 3. Data recolection (statics over LONG time)
-- 4. Take actions over facts!
-- 5. What is actual time taken?
-- 6. Repeat from 1.

/*
@see https://dev.mysql.com/doc/workbench/en/wb-performance-explain.html
System Name     Color   Text on Visual Diagram  Tooltip Related Information
----------------|---------|-----------------------------------------------------|------------------------------------------------------------------------------------------------
SYSTEM          | Blue    | Single row: system constant                         | Very low cost
CONST           | Blue    | Single row: constant                                | Very low cost
EQ_REF          | Green   | Unique Key Lookup                                   | Low cost -- The optimizer is able to find an index that it can use to
                                                                                    retrieve the required records. It is fast because the index search
                                                                                    directly leads to the page with all the row data
REF             | Green   | Non-Unique Key Lookup                               | Low-medium -- Low if the number of matching rows is small;
                                                                                    NOTE: higher as the number of rows increases
FULLTEXT        | Yellow  | Fulltext Index Search Specialized FULLTEXT search.  | Low -- for this specialized search requirement
REF_OR_NULL     | Green   | Key Lookup + Fetch NULL Values                      | Low-medium -- if the number of matching rows is small;
                                                                                |   NOTE: higher as the number of rows increases
INDEX_MERGE     | Green   | Index Merge                                         | Medium -- look for a better index selection in the query to improve performance
UNIQUE_SUBQUERY | Orange  | Unique Key Lookup into table of subquery            | Low -- Used for efficient Subquery processing
INDEX_SUBQUERY  | Orange  | Non-Unique Key Lookup into table of subquery        | Low -- Used for efficient Subquery processing
RANGE           | Orange  | Index Range Scan                                    | Medium -- partial index scan
INDEX           | Red     | Full Index Scan                                     | High -- especially for large indexes
ALL             | Red     | Full Table Scan                                     | Very High -- very costly for large tables, but less of an impact for small ones.
                                                                                |   No usable indexes were found for the table, which forces the optimizer to search every row.
                                                                                |   This could also mean that the search range is so broad that the index would be useless.
UNKNOWN         | Black   | unknown                                             | Note: This is the default, in case a match cannot be determined
*/
