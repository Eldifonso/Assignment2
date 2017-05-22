SET echo ON
SHOW USER
CREATE OR REPLACE PROCEDURE sp_servicio (reg_id IN NUMBER)
 IS
  r_id NUMBER;
  nom_servicio VARCHAR2(20);
  servicio VARCHAR2(150);
  millas NUMBER;
  serv_id NUMBER;
  
 BEGIN
   r_id := reg_id;
   servicio := 'Mandatory ' || nom_servicio || ' service; current mileage ' || millas;
   SELECT nombre_servicio(r_id), MILEAGE INTO nom_servicio, millas FROM VEHICLES WHERE REG_ID = r_id;
   IF nom_servicio <> '' THEN
      INSERT INTO SERVICE (REG_ID, ISSUE_DATE, SERVICE_STATUS) VALUES (r_id, CURRENT_DATE, 'Pending') RETURNING SERVICE_ID INTO serv_id;
      INSERT INTO SERVICES_DETAIL (SERVICE_ID, SERVICE_TYPE_ID, DESCRIPTION) VALUES (serv_id, 10, 'servicio');
   END IF;
 END;

