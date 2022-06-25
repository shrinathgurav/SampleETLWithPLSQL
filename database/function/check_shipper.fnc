/*Function checks for Shipper by providing shipper company name as in parameter and returns its shipper_id if exists or return -1 for error.*/
CREATE OR REPLACE FUNCTION check_shipper (pi_shipper_company IN VARCHAR2)
RETURN NUMBER 
AS
    v_shipper_id   NUMBER :=-1;
BEGIN
    SELECT shipper_id
    INTO v_shipper_id
    FROM shippers
    WHERE    company_name = pi_shipper_company;
RETURN v_shipper_id;
EXCEPTION
    WHEN no_data_found THEN
        RETURN v_shipper_id;
    WHEN others THEN
        RETURN v_shipper_id;       
END check_shipper;
/