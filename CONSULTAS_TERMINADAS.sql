--consultas termiandas

--a.	Mostrar el mayor peso, el menor peso, la mayor fecha y la menor fecha de los envíos de los años 2015 y 2016.

--terminado funcionando
SELECT MAX(E.pesoEnvio), MIN(e.pesoEnvio), MAX(e.fchEnvio), MIN(e.fchEnvio)
FROM Envios e
WHERE e.fchEnvio >= '20150101'
AND e.fchEnvio <= '20161231'


--b.	Mostrar para cada fabricante su nombre, la cantidad de vehículos enviados y 
--el peso total de los mismos en el año 2016 (ordenar los resultados de mayor peso a menor peso).


Select f.nomFab, sum(c.pesoCarga) pesoTotal --funciona
from Vehiculos v, Carga c, Envios e, Fabricantes f
where datepart(yyyy,e.fchEnvio) = '2016'
and e.idEnvio = c.idEnvio
and c.vin = v.vin
and v.codFab = f.codFab
Group by f.nomFab
order by pesoTotal desc

--e.	Obtener todos los datos de los vehículos que fueron enviados en la fecha más reciente.

SELECT v.*
FROM Vehiculos v, Envios e, Carga c
WHERE v.vin = c.vin
and c.idEnvio = e.idEnvio
and e.fchEnvio in (select MAX(e.fchEnvio)
					from Envios e)

--f.	Mostrar los datos de los fabricantes que no han hecho envíos en el primer semestre del 2016, 
--registraron algún envío en el 2017 y solo han hecho envíos con destino Holanda. ALEMANIA

SELECT distinct f.*
FROM Fabricantes f ,Vehiculos v, Carga c, Envios e
WHERE f.codFab = v.codFab
and v.vin = c.vin
and c.idEnvio = e.idEnvio
AND e.idEnvio NOT IN (SELECT e.idEnvio
					  FROM Envios e
					  WHERE e.fchEnvio >= '20160101'
                      and e.fchEnvio <= '20160830')-- cambie la fecha para tener margen
AND E.idEnvio IN (SELECT e.idEnvio
				  FROM Envios e
				  WHERE e.fchEnvio >= '20170101'
				  and e.fchEnvio <= GETDATE()
				  and e.desEnvio = '2')


--g.	Para cada vehículo con menos de 2.300 kg de peso, mostrar sus datos, 
--la fecha del último envío donde participó,  y el nombre del fabricante.

SELECT v.vin, v.modelo, f.nomFab, e.fchEnvio
FROM Vehiculos v, Fabricantes f, Envios e, Carga c
WHERE v.peso < 2300
and v.codFab = f.codFab
and v.vin = c.vin
and c.idEnvio = e.idEnvio


--c.Para todos los países que fueron destino de envíos, mostrar su nombre, 
--su cantidad de envíos en los 20 primeros días de enero de 2016 y la fecha del último envío realizado,
-- si algún país nunca fue destino de envíos igual debe mostrar su nombre.


--cambie las fechas para tener mas margen
SELECT p.nomPais, MIN(E.fchEnvio) as ultEnvio, COUNT(e.idEnvio) as cantidad
FROM Paises p 
left join Envios e
on e.desEnvio = p.codPais
and e.fchEnvio >= '20160101'
and e.fchEnvio <= '20170530'
GROUP BY p.nomPais
ORDER BY COUNT(e.idEnvio)

--d.	Mostrar los datos de los fabricantes que tengan envíos con más de 500 vehículos y 
--que no tengan más de 3 envíos con menos de 100 vehículos.


--falta revisar
select distinct f.nomFab
from Envios e, Carga c, Vehiculos v, Fabricantes f
where c.idEnvio = e.idEnvio
and c.vin = v.vin
and v.codFab = f.codFab
and e.idEnvio IN (SELECT e.idEnvio
				 FROM Envios e, Carga c
				 where e.idEnvio =c.idEnvio
				 group by e.idEnvio
				 having count(c.vin) >=2
				 and e.idEnvio NOT IN (SELECT e.idEnvio
									  FROM Envios e, Carga c
									  where e.idEnvio =c.idEnvio
									  group by e.idEnvio
									  having (count(c.vin) <= 1
									  AND count(e.idEnvio) >= 1)))

/*i.	Obtener los datos de los fabricantes de Japón que en el 2016 
hayan tenido en algún mes un envío de cantidad total superior a 100 vehículos y 
que también hayan tenido algún mes con una cantidad total inferior a 20.
*/

--igual que el ejercicio d
SELECT distinct f.*
FROM Fabricantes f, Vehiculos v, Carga c, Envios e
WHERE f.codFab = v.codFab
and v.vin = c.vin
and c.idEnvio = e.idEnvio
and e.idEnvio in (select e.idEnvio
					from Carga c, Envios e
					where e.oriEnvio = 5
					and c.idEnvio = e.idEnvio
					and DATEPART(YYYY, e.fchEnvio) = '2016'
					group by e.idEnvio
					having (count(distinct(c.vin)) > 4 
					and count(distinct(c.vin)) < 20))
