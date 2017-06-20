--a.	Crear una funci�n almacenada que reciba como par�metro un n�mero de VIN completo 
--y valide el d�gito verificador, si dicho d�gito es correcto la funci�n debe retornar el texto �OK�
--, si es incorrecto, debe retornar todo el n�mero de VIN pero incluyendo el d�gito verificador correcto.

CREATE FUNCTION EJ4A(@vin VARCHAR(17)) -- Funcionando
RETURNS VARCHAR(17)
AS
BEGIN
DECLARE @RETURN VARCHAR(17), @i INT, @char CHAR, @valor int, @multiplo int, @producto int, @suma int, @resto int, @9 char(1)
set @suma = 0;
set @i = 1;

while(@i <= len(@vin))
BEGIN
 SET @char =  substring(@vin, @i, len(@vin))
  IF(@i = 9)
	  BEGIN
		SET @9 = @char
		SET @i = @i+1
	  END
  ELSE
	  BEGIN
		  SET @valor = (SELECT CAST(v.numero as int) FROM valorNumericoVin v WHERE v.letra = @char)
				SET @multiplo = (SELECT fm.factor FROM [dbo].[factorMultipVin] fm where fm.posicion = @i)
					SET @producto = @valor * @multiplo
						SET @suma = @suma + @producto
							SET @i = @i+1
	  END
	
END	

SET @resto = @suma % 11

IF (@resto = 10)
	BEGIN
		SET @vin = (SELECT STUFF(@vin,9,1,'X'))
		SET @return = 'ok'
	END
ELSE IF (@9 = 'x')
	BEGIN
		SET @return = 'ok'
	END
ELSE
	BEGIN
		SET @vin = (SELECT STUFF(@vin,9,1,@resto))
		SET @return = @vin
	END

RETURN @return

END

DROP FUNCTION EJ4A

select [dbo].[EJ4A]('1M8GDM9AXKP042788')


---------------------------------------------------------------------
--http://www.forosdelweb.com/f86/procedimientos-almacenados-funciones-856053/
/*
b.	Crear una funci�n que reciba como par�metro un VIN y retorne el a�o del modelo de dicho veh�culo.
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
c.	Dado un rango de fechas, retornar la cantidad de veh�culos que recibi� el pa�s que m�s veh�culos recibi� en dicho rango.
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
d.	Mediante un procedimiento almacenado que reciba un rango de fechas de env�o, 
cambiar el pa�s de destino del env�o a todos los veh�culos cuyo pa�s de fabricaci�n 
del veh�culo sea el mismo que el pa�s de destino del env�o, en ese caso crear un 
pa�s de c�digo �#� que tenga como descripci�n �LOCAL� y poner ese dato como destino.
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
e.	Dado un rango de fechas, implementar una funci�n que retorne el nombre del 
pa�s al cual se le envi� la menor cantidad de veh�culos en dicho rango.
*/

CREATE FUNCTION EJ4E(@inicio DATETIME, @fin DATETIME) -- arreglar que cuando trae un pais que sea # no sabe que pais es
RETURNS VARCHAR(20)
AS
BEGIN
DECLARE @pais CHAR(1), @nombrePais VARCHAR(20), @pais2 CHAR(1)

select @pais = min(e.desEnvio)
from Envios e
where exists (select count(e.desEnvio)
			  from Envios e
              group by e.desEnvio) 

select * from Envios

IF(@pais = '#')
	BEGIN
		SET @pais = @pais2
	END

select @nombrePais = p.nomPais
from Envios e, Paises p
where e.fchEnvio >= @inicio
and e.fchEnvio <= @fin
and p.codPais = @pais


RETURN @nombrePais
END

DROP FUNCTION EJ4E 

EXEC EJ4E '20080101','20171231'
------------------------------------------------------------------------
/*
f.	Realizar un procedimiento almacenado que reciba un c�digo de fabricante 
y retorne con par�metro de salida la cantidad de plantas que tiene y 
la cantidad de modelos de veh�culos diferentes que produce.
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