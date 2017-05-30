--a.	Mostrar el mayor peso, el menor peso, la mayor fecha y la menor fecha de los envíos de los años 2015 y 2016.

--terminado funcionando
SELECT MAX(E.pesoEnvio), MIN(e.pesoEnvio), MAX(e.fchEnvio), MIN(e.fchEnvio)
FROM Envios e
WHERE e.fchEnvio >= '20150101'
AND e.fchEnvio <= '20161231'

--b.	Mostrar para cada fabricante su nombre, la cantidad de vehículos enviados y 
--el peso total de los mismos en el año 2016 (ordenar los resultados de mayor peso a menor peso).


Select f.nomFab, sum(c.pesoCarga) pesoTotal
from Vehiculos v, Carga c, Envios e, Fabricantes f
where datepart(yyyy,e.fchEnvio) = '2016'
and e.idEnvio = c.idEnvio
and c.vin = v.vin
and v.codFab = f.codFab
Group by f.nomFab
order by pesoTotal desc



--c.Para todos los países que fueron destino de envíos, mostrar su nombre, 
--su cantidad de envíos en los 20 primeros días de enero de 2016 y la fecha del último envío realizado,
-- si algún país nunca fue destino de envíos igual debe mostrar su nombre.


--sin hacer
select distinct p.nomPais
from Envios e, Paises p
where e.desEnvio = p.codPais

select * from Envios e
where e.fchEnvio >= '20160101'
and e.fchEnvio <= '20170530' --cambie la fecha para tener más margen

SELECT p.nomPais, MIN(E.fchEnvio) as ultEnvio
FROM Paises p 
left join Envios e
on e.desEnvio = p.codPais
and e.fchEnvio >= '20160101'
and e.fchEnvio <= '20160120'
GROUP BY p.nomPais
ORDER BY COUNT(e.idEnvio)


--d.	Mostrar los datos de los fabricantes que tengan envíos con más de 500 vehículos y 
--que no tengan más de 3 envíos con menos de 100 vehículos.

select f.nomFab
from Envios e, Carga c, Vehiculos v, Fabricantes f
where c.idEnvio = e.idEnvio
and c.vin = v.vin
and v.codFab = f.codFab	
group by f.nomFab
having COUNT(c.vin) >= 2 

select *
from Envios e, Carga c, Vehiculos v, Fabricantes f
where c.idEnvio = e.idEnvio
and c.vin = v.vin
and v.codFab = f.codFab        


--e.	Obtener todos los datos de los vehículos que fueron enviados en la fecha más reciente.

SELECT v.*
FROM Vehiculos v, Envios e, Carga c
WHERE v.vin = c.vin
and c.idEnvio = e.idEnvio
and e.fchEnvio in (select MAX(e.fchEnvio)
					from Envios e)

--f.	Mostrar los datos de los fabricantes que no han hecho envíos en el primer semestre del 2016, 
--registraron algún envío en el 2017 y solo han hecho envíos con destino Holanda.

SELECT distinct f.*
FROM Fabricantes f ,Vehiculos v, Carga c, Envios e
WHERE f.codFab = v.codFab
and v.vin = c.vin
and c.idEnvio = e.idEnvio
AND e.idEnvio NOT IN (SELECT e.idEnvio
					  FROM Envios e
					  WHERE e.fchEnvio >= '20160101'
                      and e.fchEnvio <= '20160830')-- cambie la fecha para tener margen

--g.	Para cada vehículo con menos de 2.300 kg de peso, mostrar sus datos, 
--la fecha del último envío donde participó,  y el nombre del fabricante.

SELECT
FROM
WHERE

--h.	Bajar el peso en un 5% a todos los vehículos que no nunca fueron enviados pasado 1 año de su fabricación 
--(puede utilizar la función 4b).

SELECT
FROM
WHERE


--i.	Obtener los datos de los fabricantes de Japón que en el 2016 
--hayan tenido en algún mes un envío de cantidad total superior a 100 vehículos y 
--que también hayan tenido algún mes con una cantidad total inferior a 20.


select DATEPART(MM,e.fchEnvio) [Mes], c.vin
from Envios e, Carga c
where DATEPART(YYYY, e.fchEnvio) = '2016'
and c.idEnvio = e.idEnvio
group by DATEPART(MM,e.fchEnvio), c.vin
having (count(distinct(c.vin)) > 100 or count(distinct(c.vin)) < 20)




select distinct f.nomFab
from Fabricantes f, Vehiculos v, Paises p, Envios e
where f.codFab = v.codFab
and v.codPais = p.codPais
and p.nomPais = 'Japón'
and DATEPART(YYYY, e.fchEnvio) = '2016'
and exists ( select DATEPART(MM,e.fchEnvio) [Mes], c.vin
			from Carga c
			where c.idEnvio = e.idEnvio
			group by DATEPART(MM,e.fchEnvio), c.vin
			having (count(distinct(c.vin)) > 100 or count(distinct(c.vin)) < 20))

