CREATE OR REPLACE PROCEDURE load_orders AS

    CURSOR cr_dl IS SELECT
                       order_id,
                       company_name,
                       contact_name,
                       last_name,
                       first_name,
                       order_date,
                       required_date,
                       shipped_date,
                       shipper_company,
                       freight,
                       ship_name,
                       ship_address,
                       ship_city,
                       ship_region,
                       ship_postal_code,
                       ship_country,
                       product_name,
                       unite_price,
                       quintity,
                       discount
                   FROM
                       ext_tab;

    TYPE typ_order_details IS
        TABLE OF cr_dl%rowtype;
    ty_dl   typ_order_details := typ_order_details ();
BEGIN
    OPEN cr_dl;
    LOOP
        FETCH cr_dl BULK COLLECT INTO ty_dl LIMIT 10000;
        NULL;
        EXIT WHEN cr_dl%notfound;
    END LOOP;

END load_orders;