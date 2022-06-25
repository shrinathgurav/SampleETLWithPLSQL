CREATE OR REPLACE PACKAGE  pkg_load_order_data
AS
       PROCEDURE  prc_load_data ;

       PROCEDURE  prc_log_errors;

       FUNCTION fnc_check_product RETURN VARCHAR2 ;

       FUNCTION fnc_check_employee RETURN VARCHAR2 ;

       FUNCTION fnc_check_shipper RETURN VARCHAR2 ;

       FUNCTION fnc_check_customer RETURN VARCHAR2;

END ;
/

