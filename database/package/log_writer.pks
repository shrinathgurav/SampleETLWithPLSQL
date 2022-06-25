CREATE OR REPLACE  PACKAGE "SALES_ETL"."LOG_WRITER"
AS
   PROCEDURE write_logs (p_directory   IN VARCHAR2,
                         p_file_name   IN VARCHAR2,
                         p_open_mode   IN VARCHAR2,
                         p_refcursor   IN SYS_REFCURSOR);

   PROCEDURE generate_log;
END log_writer;
/
