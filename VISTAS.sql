--7.	Vistas:.
--Realizar una vista que muestre País de Fabricación del vehículo y cantidad de vehículos 
--enviados a Países diferentes a los de la fábrica.

CREATE VIEW EJ7 AS (
	
	SELECT f.estado, count(*) as cantFac, sum(f.monto) as total
	FROM factura f
	GROUP BY f.estado

)