/*
a.	Crear un trigger que valide un n�mero de VIN al ingresar un nuevo veh�culo, debe utilizar la funci�n creada en el punto 4a.
*/
----------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER EJ5A -- funciona
ON VEHICULOS
INSTEAD OF INSERT
AS
BEGIN
DECLARE @vin VARCHAR(17), @valorConsulta VARCHAR(5)

	SELECT @vin = i.vin FROM inserted i
	SET @valorConsulta = SELECT dbo.EJ4A(@vin) 

	IF (@valorConsulta = 'ok')
		BEGIN
			INSERT INTO Vehiculos 
			SELECT i.caracteristicas, i.codFab, i.codPais, i.color, i.modelo, i.peso, i.vin
			FROM inserted i
		END

END
----------------------------------------------------------------------------------------------------------------------
/*
b.	Crear un trigger al ingresar una l�nea de carga, ponga el peso correcto de 
acuerdo al peso del veh�culo mas el 5% de combustible y accesorios, tambi�n debe 
acumular el peso total del env�o.
*/
----------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER EJ5B
ON Carga
INSTEAD OF INSERT
AS
BEGIN
DECLARE @peso NUMERIC(9,2), @nuevoPeso NUMERIC(9,2)
	
	IF EXISTS (SELECT i. FROM inserted i)
		BEGIN
			SELECT @peso = i.pesoCarga
			FROM inserted i	

			SET @nuevoPeso = @peso + ((@peso/100)*5)

			INSERT INTO Carga
			SELECT i.idCarga, i.idEnvio, @nuevoPeso, i.vin
			FROM inserted i
		END

END






----------------------------------------------------------------------------------------------------------------------
/*
c.	Definir un trigger que al ingresar un env�o, si el pa�s de origen es igual 
al pa�s de destino no procese la linea.
*/
----------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER EJ5C
ON Envios
INSTEAD OF INSERT
AS
BEGIN
DECLARE @paisOrigen INT, @paisDestino INT

		SELECT @paisOrigen =  i.oriEnvio FROM inserted i
		SELECT @paisDestino =  i.desEnvio FROM inserted i

	IF EXISTS (SELECT * FROM inserted)
		BEGIN

		IF(@paisOrigen = @paisDestino)
			BEGIN
				--no procese la linea
			END

		INSERT INTO Envios
		SELECT i.desEnvio, i.fchEnvio, i.idEnvio, i.oriEnvio, i.pesoEnvio
		FROM inserted i
				
		END

END


----------------------------------------------------------------------------------------------------------------------
/*
d.	Implementar un trigger que permita el borrado de uno o m�s env�os, para ello debe borrar en cascada todos 
los registros en las tablas relacionadas, se debe tener en cuenta los borrados m�ltiples.
*/
----------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER EJ5D
ON

----------------------------------------------------------------------------------------------------------------------