/* Punto 5 */

set echo on
show user
CREATE OR REPLACE FUNCTION nombre_servicio (reg_id NUMBER)
  RETURN VARCHAR2
 IS
 r_id number;
  servicio VARCHAR2(20);
  MILLAS number;
 BEGIN
   r_id := reg_id;
   servicio := '';
   SELECT MILEAGE into MILLAS FROM VEHICLES WHERE REG_ID = r_id;
   IF MILLAS <= 3000 THEN
      servicio := '';
   ELSIF MILLAS > 3000 AND MILLAS <= 6000 THEN
      servicio := '3000_service';
   ELSIF MILLAS > 6000 AND MILLAS <= 9000 THEN
      servicio := '6000_service';
   ELSE
      servicio := '9000_service';
   END IF;
   RETURN servicio;
 END;