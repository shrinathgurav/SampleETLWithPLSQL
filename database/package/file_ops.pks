CREATE OR REPLACE PACKAGE "SALES_ETL"."FILE_OPS"
AS
   PROCEDURE write_contents (p_file_name IN VARCHAR2);
END file_ops;
/
