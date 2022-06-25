--------------------------------------------------------
--  DDL for Package Body FILES_OPS
--------------------------------------------------------

  CREATE OR REPLACE  PACKAGE BODY "SALES_ETL"."FILES_OPS" 
as


procedure write_contents(p_file_name IN VARCHAR2)
is
      v_file_handle  UTL_FILE.file_type ;
begin

       v_file_handle := utl_file.fopen(order_data,p_file_name,'a',32767) ;

       for rc in (select dummy from dual connect by level < 10)
       loop
                   utl_file.put_line(v_file_handle,rc.dummy) ;
       end loop ;

exception
when others then
null ;
end write_contents ;
end files_ops ;

/
