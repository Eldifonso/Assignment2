
CREATE OR REPLACE TRIGGER tr_update_mileage
BEFORE UPDATE OF MILEAGE
ON VEHICLES
BEGIN
	EXEC sp_servicio (reg_id)
END tr_update_mileage;
