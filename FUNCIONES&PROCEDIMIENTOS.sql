--a.	Crear una función almacenada que reciba como parámetro un número de VIN completo 
--y valide el dígito verificador, si dicho dígito es correcto la función debe retornar el texto ‘OK’
--, si es incorrecto, debe retornar todo el número de VIN pero incluyendo el dígito verificador correcto.

CREATE FUNCTION EJ4A(@vin VARCHAR(17))
RETURNS VARCHAR(17)
AS
BEGIN
DECLARE @RETURN VARCHAR(17), @i INT, @char CHAR, @valor int, @multiplo int, @producto int, @suma int, @resto int
set @i = 1;

while(@i < len(@vin) AND @i > 9 AND @i < 9)
BEGIN
 SET @char =  substring(@vin, @i, len(@vin))
  IF(@char <> 9)
  BEGIN
  SET @valor = SELECT CAST(vnv.numero as int)  FROM [dbo].[valorNumericoVin] vnv WHERE vnv.letra = @char
		SET @multiplo = SELECT fm.factor FROM [dbo].[factorMultipVin] fm where fm.posicion = @i
			SET @producto = @valor * @multiplo
				SET @suma = @suma + @producto
					SET @i = @i+1
  END
	
END	

SET @resto = @suma % 11


END

/*
CREATE FUNCTION EJ4A(@vin VARCHAR(17))
RETURNS VARCHAR(17)
AS
BEGIN
DECLARE @RETURN VARCHAR(17), @i INT, @char CHAR, @valor int, @multiplo int, @producto int, @suma int, @resto int
set @i = 1;

while(@i < len(@vin) AND @i > 9 AND @i < 9)
BEGIN
 SET @char =  substring(@vin, @i, len(@vin))
	SET @valor = SELECT CAST(vnv.numero as int)  FROM [dbo].[valorNumericoVin] vnv WHERE vnv.letra = @char
		SET @multiplo = SELECT fm.factor FROM [dbo].[factorMultipVin] fm where fm.posicion = @i
			SET @producto = @valor * @multiplo
				SET @suma = @suma + @producto
					SET @i = @i+1
END	

SET @resto = @suma % 11


END

*/


---------------------------------------------------------------------
--http://www.forosdelweb.com/f86/procedimientos-almacenados-funciones-856053/
/*
b.	Crear una función que reciba como parámetro un VIN y retorne el año del modelo de dicho vehículo.
*/

CREATE FUNCTION EJ4B(@vin VARCHAR(17)) -- ver por que hay dos valores por letra pero funciona
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

select dbo.ej4b('1M8GDM9AXKPO42788') 

--------------------------------------------------------

/*
c.	Dado un rango de fechas, retornar la cantidad de vehículos que recibió el país que más vehículos recibió en dicho rango.
*/

CREATE FUNCTION EJ4C(@inicio DATETIME, @fin DATETIME) --funcionando
RETURNS INT
AS
BEGIN
DECLARE @cantidadVehiculos INT, @pais INT
set @pais = 0

select @pais = max(e.desEnvio)
from Envios e
where exists (select count(e.desEnvio)
			  from Envios e
              group by e.desEnvio)

select @cantidadVehiculos = count(distinct(c.vin))
from Carga c, Envios e
where c.idEnvio = e.idEnvio
and e.desEnvio = @pais


return @cantidadVehiculos
END

select [dbo].[EJ4C] ('20100101',(getdate()))

------------------------------------------------------------------------
/*
d.	Mediante un procedimiento almacenado que reciba un rango de fechas de envío, 
cambiar el país de destino del envío a todos los vehículos cuyo país de fabricación 
del vehículo sea el mismo que el país de destino del envío, en ese caso crear un 
país de código ‘#’ que tenga como descripción ‘LOCAL’ y poner ese dato como destino.
*/
CREATE PROCEDURE EJ4D --funcionando
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


------------------------------------------------------------------------
/*
e.	Dado un rango de fechas, implementar una función que retorne el nombre del 
país al cual se le envió la menor cantidad de vehículos en dicho rango.
*/

CREATE FUNCTION EJ4E(@inicio DATETIME, @fin DATETIME) 
RETURNS INT
AS
BEGIN
DECLARE @pais int, @nombrePais VARCHAR(20)

select @pais = min(e.desEnvio)
from Envios e
where exists (select count(e.desEnvio)
			  from Envios e
              group by e.desEnvio)

select @nombrePais = p.nomPais
from Envios e, Paises p
where e.fchEnvio >= @inicio
and e.fchEnvio <= @fin
and p.codPais = @pais


RETURN @nombrePais
END

------------------------------------------------------------------------
/*
f.	Realizar un procedimiento almacenado que reciba un código de fabricante 
y retorne con parámetro de salida la cantidad de plantas que tiene y 
la cantidad de modelos de vehículos diferentes que produce.
*/
CREATE PROCEDURE EJ4F -- FUNCIONANDO
@codFab char(2), @cantPlantas int OUTPUT, @cantModelos int OUTPUT
AS
BEGIN

SELECT @cantPlantas = COUNT(DISTINCT(p.codPlan))
FROM Plantas p
WHERE p.codFab = @codFab

SELECT @cantModelos = COUNT(DISTINCT(v.modelo))
FROM Vehiculos v
WHERE v.codFab = @codFab

END

DROP PROCEDURE EJ4F

EXEC EJ4F'CH',0,0


------------------------------------------------------------------------