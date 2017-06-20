/*
a.	Crear un trigger que valide un número de VIN al ingresar un nuevo vehículo, debe utilizar la función creada en el punto 4a.
*/
----------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER EJ5A -- funciona
ON VEHICULOS
INSTEAD OF INSERT
AS
BEGIN
DECLARE @vin VARCHAR(17), @valorConsulta VARCHAR(5)

	SELECT @vin = i.vin FROM inserted i
	SET @valorConsulta =  dbo.EJ4A(@vin) 

	IF (@valorConsulta = 'ok')
		BEGIN
			INSERT INTO Vehiculos 
			SELECT i.caracteristicas, i.codFab, i.codPais, i.color, i.modelo, i.peso, i.vin
			FROM inserted i
		END

END

ENABLE TRIGGER EJ5A ON Vehiculos
----------------------------------------------------------------------------------------------------------------------
/*
b.	Crear un trigger al ingresar una línea de carga, ponga el peso correcto de 
acuerdo al peso del vehículo mas el 5% de combustible y accesorios, también debe 
acumular el peso total del envío.
*/
----------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER EJ5B --sin probar
ON Carga
INSTEAD OF INSERT
AS
BEGIN
DECLARE @peso NUMERIC(9,2), @nuevoPeso NUMERIC(9,2)
	
	IF EXISTS (SELECT * FROM inserted i)
		BEGIN
			SELECT @peso = i.pesoCarga
			FROM inserted i	

			SET @nuevoPeso = @peso + ((@peso/100)*5)

			INSERT INTO Carga
			SELECT i.idCarga, i.idEnvio, @nuevoPeso, i.vin
			FROM inserted i
		END

END

ENABLE TRIGGER EJ5B ON Carga

----------------------------------------------------------------------------------------------------------------------
/*
c.	Definir un trigger que al ingresar un envío, si el país de origen es igual 
al país de destino no procese la linea.
*/
----------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER EJ5C --sin probar
ON Envios
INSTEAD OF INSERT
AS
BEGIN
DECLARE @paisOrigen INT, @paisDestino INT

		SELECT @paisOrigen =  i.oriEnvio FROM inserted i
		SELECT @paisDestino =  i.desEnvio FROM inserted i

	IF EXISTS (SELECT * FROM inserted)
		BEGIN
			IF(@paisOrigen <> @paisDestino)
				BEGIN
					INSERT INTO Envios
					SELECT GETDATE(),i.pesoEnvio, i.oriEnvio, i.desEnvio
					FROM inserted i
				END
		END

END

ENABLE TRIGGER EJ5C ON Envios

----------------------------------------------------------------------------------------------------------------------
/*
d.	Implementar un trigger que permita el borrado de uno o más envíos, para ello debe borrar en cascada todos 
los registros en las tablas relacionadas, se debe tener en cuenta los borrados múltiples.
*/
----------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER EJ5D --sin probar
ON Envios
INSTEAD OF DELETE
AS
BEGIN
	IF EXISTS(SELECT * FROM deleted)
		BEGIN
				DELETE Carga FROM Carga c, Envios e
				WHERE c.idEnvio = e.idEnvio
				AND e.idEnvio IN (SELECT d.idEnvio FROM deleted d)

				DELETE FROM Envios
				WHERE idEnvio IN (SELECT idEnvio FROM deleted)
		END
END

ENABLE TRIGGER EJ5D ON Envios

----------------------------------------------------------------------------------------------------------------------