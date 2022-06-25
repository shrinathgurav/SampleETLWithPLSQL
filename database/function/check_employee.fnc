/*Function checks for employee by providing first and last name as in parameter and returns its employee_id if exists or return -1 for error.*/
CREATE OR REPLACE FUNCTION check_employee (pi_last_name    IN VARCHAR2,pi_first_name   IN VARCHAR2)
RETURN NUMBER 
AS
    v_employee_id   NUMBER :=-1;
BEGIN
    SELECT  employee_id
    INTO v_employee_id
    FROM employees
    WHERE last_name = pi_last_name
        AND first_name = pi_first_name;

    RETURN v_employee_id;
    
EXCEPTION
    WHEN no_data_found THEN
        RETURN v_employee_id;
    WHEN others THEN
        RETURN v_employee_id;
END check_employee;
/