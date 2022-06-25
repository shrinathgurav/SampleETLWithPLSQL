/*Function checks for product by providing product name as in parameter and returns its product_id if exists or return -1 for error.*/
CREATE OR REPLACE FUNCTION check_product (pi_product_name IN VARCHAR2)
RETURN NUMBER AS
    v_product_id   NUMBER :=-1;
BEGIN
    SELECT
        product_id
    INTO v_product_id
    FROM
        products
    WHERE
        product_name = pi_product_name;

    RETURN v_product_id;
EXCEPTION
    WHEN no_data_found THEN
        RETURN v_product_id;
    WHEN others THEN
        RETURN v_product_id;        
END check_product;
/