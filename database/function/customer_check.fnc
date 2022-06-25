/*Function checks for customer by providing customer name as in parameter and returns its customer_id if exists or return -1 for error.*/
CREATE OR REPLACE FUNCTION check_customer (pi_customer_name IN VARCHAR2)
RETURN NUMBER 
AS
    v_customer_id   customers.customer_id%TYPE :=-1;
BEGIN
    SELECT
        customer_id
    INTO v_customer_id
    FROM
        customers
    WHERE
        company_name = pi_customer_name;

    RETURN v_customer_id;
    
EXCEPTION
    WHEN no_data_found THEN
        RETURN v_customer_id;
    WHEN others THEN
        RETURN v_customer_id;
END check_customer;
/