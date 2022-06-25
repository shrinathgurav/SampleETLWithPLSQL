CREATE TABLE regions
(
  region_id            NUMBER,
  region_description   VARCHAR2(200),
  CONSTRAINT region_pk PRIMARY KEY(region_id)
) ;
/

CREATE TABLE territories
(
  territory_id          NUMBER,
  territory_description VARCHAR2(200),
  region_id             NUMBER,
  CONSTRAINT territories_pk PRIMARY KEY(territory_id),
  CONSTRAINT  territ_region_fk1 FOREIGN KEY(region_id) REFERENCES regions(region_id)
  ) ;
/

CREATE TABLE employees
(
  employee_id               NUMBER,
  last_name                 VARCHAR2(50) NOT NULL,
  first_name                VARCHAR2(50),
  title                     VARCHAR2(8),
  courtesy_title            VARCHAR2(10),
  birth_date                DATE,
  hire_date                 DATE NOT NULL,
  address                   VARCHAR2(200),
  city                      VARCHAR2(50),
  region                    VARCHAR2(50),
  postal_code               VARCHAR2(10),
  country                   VARCHAR2(50),
  home_phone                VARCHAR2(15),
  extension                 NUMBER,
  photo                     BLOB,
  notes                     VARCHAR2(200),
  reports_to                NUMBER,
  photo_path                VARCHAR2(200),
  CONSTRAINT employee_pk PRIMARY KEY(employee_id),
  CONSTRAINT emp_mgremp_fk1 FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
) ;
/

CREATE TABLE employee_territories
(
  employee_id  NUMBER,
  territory_id NUMBER,
  CONSTRAINT emp_teritor_pk PRIMARY KEY(employee_id,territory_id),
  CONSTRAINT emp_teritor_fk1 FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
  CONSTRAINT emp_teritor_fk2 FOREIGN KEY(territory_key) REFERENCES territories( territory_key)
);
/

CREATE TABLE shippers
(
  shipper_id     NUMBER,
  company_name   VARCHAR2(50),
  phone          VARCHAR2(15),
  CONSTRAINT shippers_pk PRIMARY KEY(shipper_id)
 );
 /
 
 CREATE TABLE customers
 (
   customer_id    NUMBER,
   company_name   VARCHAR2(50),
   contact_name   VARCHAR2(50),
   contact_title  VARCHAR2(10),
   address        VARCHAR2(200),
   city           VARCHAR2(50),
   region         VARCHAR2(50),
   postal_code    VARCHAR2(15),
   country        VARCHAR2(50),
   phone          VARCHAR2(15),
   fax            VARCHAR2(15)
   CONSTRAINT customers_pk PRIMARY KEY(customer_id)
 );
 /
 
 CREATE TABLE categories
 (
  category_id     NUMBER,
  category_name   VARCHAR2(50),
  description     VARCHAR2(200),
  picture         BLOB,
  CONSTRAINT categories_pk(category_id)
 );
 
 /
 
 CUBETE TABLE suppliers
 (
   supplier_id    NUMBER,
   company_name   VARCHAR2(50),
   contact_name   VARCHAR2(50),
   contact_title  VARCHAR2(10),
   address        VARCHAR2(200),
   city           VARCHAR2(50),
   region         VARCHAR2(50),
   postal_code    VARCHAR2(15),
   country        VARCHAR2(50),
   phone          VARCHAR2(15),
   fax            VARCHAR2(15),
   homepage       VARCHAR2(50),
   CONSTRAINT customers_pk PRIMARY KEY(supplier_id)
 );
 /
 
 CREATE TABLE products
 (
   product_id NUMBER,
   product_name VARCHAR2(50),
   supplier_id  NUMBER,
   category_id  NUMBER,
   quantity_per_unit NUMBER,
   unit_price   NUMBER(8,2),
   units_in_stock NUMBER,
   units_on_order NUMBER,
   reorder_level  NUMBER,
   discontinued   VARCHAR2(1),
   CONSTRAINT products_pk PRIMARY KEY(product_id),
   CONSTRAINT prod_supl_fk1(supplier_id) REFERENCES suppliers(supplier_id),
   CONSTRAINT prod_catgr_fk2(category_id) REFERENCES categories(category_id)
 );
 /
 
 CREATE TABLE orders
 (
   order_id NUMBER,
   customer_id NUMBER,
   employee_id NUMBER,
   order_date  DATE,
   required_date DATE,
   shipped_date  DATE,
   ship_via      NUMBER,
   freight       NUMBER,
   ship_name     VARCHAR2(50),
   ship_address  VARCHAR2(200),
   ship_city     VARCHAR2(50),
   ship_region   VARCHAR2(50),
   ship_postal_code VARCHAR2(15),
   ship_country   VARCHAR2(50),
   CONSTRAINT orders_pk PRIMARY KEY    (order_id),
   CONSTRAINT ordr_cust_fk1 FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
   CONSTRAINT ordr_empl_fk2 FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
   CONSTRAINT ordr_shpr_fk3 FOREIGN KEY(ship_via)    REFERENCES shippers(shipper_id)
 );
 /
 
 CREATE TABLE order_details
 (
   order_id  NUMBER,
   customer_id NUMBER,
   unit_price  NUMBER(8,2),
   discount    NUMBER,
   CONSTRAINT order_details_pk PRIMARY KEY(order_id,customer_id),
   CONSTRAINT ordr_dtl_ordr_fk1 FOREIGN KEY(order_id) REFERENCES orders(order_id),
   CONSTRAINT ordr_det_cust_fk2 FOREIGN KEY(customer_id) REFERENCES customers(customer_id) 
 );
/

