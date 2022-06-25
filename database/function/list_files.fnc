  CREATE OR REPLACE  FUNCTION "SALES_ETL"."LIST_FILES" (
    path VARCHAR2
)RETURN file_list IS LANGUAGE JAVA NAME 'ListVirtualDirectory.getList(java.lang.String) return oracle.sql.ARRAY';

/
