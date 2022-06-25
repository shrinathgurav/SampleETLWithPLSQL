--------------------------------------------------------
--  DDL for Package Body LOG_WRITER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SALES_ETL"."LOG_WRITER" 
as

	procedure write_logs(p_directory  in varchar2
     	                ,p_file_name  in varchar2
     	                ,p_open_mode  in varchar2
     	                ,p_refcursor  in sys_refcursor) 
	is

		type str_arr is table of varchar2(4000) index by pls_integer ;
		v_strarr  str_arr ;

		v_file_handle	UTL_FILE.file_type ;
		v_max_rwl			PLS_INTEGER := 200 ;
		v_max_buff		PLS_INTEGER := 32767 ;


	begin

			loop

				fetch p_refcursor bulk collect into v_strarr limit v_max_rwl ;

				exit when v_strarr.count = 0 ;

					if not UTL_FILE.is_open(v_file_handle) then

						v_file_handle := UTL_FILE.fopen(p_directory,p_file_name,p_open_mode,v_max_buff) ;

					end if ;

					for idx in 1..v_strarr.count
					loop

							UTL_FILE.put_line(v_file_handle,v_strarr(idx)) ;

					end loop ;

			end loop ;

					close p_refcursor;

					UTL_FILE.fclose(v_file_handle) ;

					dbms_output.put_line('File generated successfully'||p_file_name) ;
	exception 
		when others then
			dbms_output.put_line(sqlerrm) ;
	end write_logs;


	procedure generate_log
	is
		v_file_name varchar2(100) := 'Employees'||to_char(systimestamp,'ddmmyyyyhhmissff')||'.log' ;
		v_dir varchar2(20) := 'TEMP_SAMPLE';
		v_cur sys_refcursor ;
	begin

	      open v_cur for select employee_id||'~'||first_name||'~'||last_name  as str from employees ;

	      write_logs(v_dir,v_file_name,'w',v_cur) ;

	exception
		when others then
			raise ;
	end ;

end log_writer ;

/
