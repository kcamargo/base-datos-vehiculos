CREATE FUNCTION EJ4A(@vin VARCHAR(17))
RETURNS VARCHAR(17)
AS
BEGIN
DECLARE @RETURN VARCHAR(17)

-- aun no se como calcular el digito verificador del VIN


END
---------------------------------------------------------------------
--http://www.forosdelweb.com/f86/procedimientos-almacenados-funciones-856053/

CREATE FUNCTION EJ4B(@vin VARCHAR(17))
RETURNS INT
AS
BEGIN
DECLARE @anioModelo INT,@char VARCHAR(1) 

SELECT @char = SUBSTRING(@vin,10,1)

select @anioModelo = av.anio
from anioVehiculo av
where av.letra = @char

RETURN @anioModelo

END

select dbo.ej4b('1M8GDM9AXKPO42788') -- ver por que hay dos valores por letra

--------------------------------------------------------

CREATE FUNCTION EJ4C(@inicio DATETIME, @fin DATETIME)
RETURN NUMERIC
AS
BEGIN
DECLARE @cantidadVehiculos NUMERIC(12,1)

SELECT @cantidadVehiculos = top 1 count(e.desEnvio)
FROM Envios e
WHERE e.fchEnvio >= @inicio
and e.fchEnvio <= @fin
group by e.desEnvio
order by count(e.desEnvio) desc

return @cantidadVehiculos

END


------------------------------------------------------------------------

CREATE PROCEDURE EJ4D 
@inicio DATETIME, @fin DATETIME
AS
BEGIN
DECLARE @pais char(1)

	IF EXISTS (SELECT * FROM Envios e where e.fchEnvio >= @inicio and e.fchEnvio <= @fin)
		BEGIN
			UPDATE Envios
			set desEnvio = '#'
			where oriEnvio = desEnvio
			and fchEnvio >= @inicio 
			and fchEnvio <= @fin
		END
	

END

EXEC EJ4D '20080101','20171231'


-------------------------------------------------------------------------