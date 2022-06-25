CREATE OR REPLACE TYPE BODY "SALES_ETL"."PERSON_TYPE"
AS
   MEMBER FUNCTION get_city
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN SELF.city;
   END get_city;


   MEMBER PROCEDURE update_city (i_new_city IN VARCHAR2)
   IS
   BEGIN
      self.city := i_new_city;
   END update_city;
END;
/
