--7.	Vistas:.
--Realizar una vista que muestre Pa�s de Fabricaci�n del veh�culo y cantidad de veh�culos 
--enviados a Pa�ses diferentes a los de la f�brica.

CREATE VIEW EJ7 AS (
	
	SELECT f.estado, count(*) as cantFac, sum(f.monto) as total
	FROM factura f
	GROUP BY f.estado

)