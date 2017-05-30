--a.	Mostrar el mayor peso, el menor peso, la mayor fecha y la menor fecha de los env�os de los a�os 2015 y 2016.

--terminado funcionando
SELECT MAX(E.pesoEnvio), MIN(e.pesoEnvio), MAX(e.fchEnvio), MIN(e.fchEnvio)
FROM Envios e
WHERE e.fchEnvio >= '20150101'
AND e.fchEnvio <= '20161231'

--b.	Mostrar para cada fabricante su nombre, la cantidad de veh�culos enviados y 
--el peso total de los mismos en el a�o 2016 (ordenar los resultados de mayor peso a menor peso).


Select f.nomFab, sum(c.pesoCarga) pesoTotal
from Vehiculos v, Carga c, Envios e, Fabricantes f
where datepart(yyyy,e.fchEnvio) = '2016'
and e.idEnvio = c.idEnvio
and c.vin = v.vin
and v.codFab = f.codFab
Group by f.nomFab
order by pesoTotal desc



--c.Para todos los pa�ses que fueron destino de env�os, mostrar su nombre, 
--su cantidad de env�os en los 20 primeros d�as de enero de 2016 y la fecha del �ltimo env�o realizado,
-- si alg�n pa�s nunca fue destino de env�os igual debe mostrar su nombre.


--sin hacer
select distinct p.nomPais
from Envios e, Paises p
where e.desEnvio = p.codPais

select * from Envios e
where e.fchEnvio >= '20160101'
and e.fchEnvio <= '20170530' --cambie la fecha para tener m�s margen

SELECT p.nomPais, MIN(E.fchEnvio) as ultEnvio
FROM Paises p 
left join Envios e
on e.desEnvio = p.codPais
and e.fchEnvio >= '20160101'
and e.fchEnvio <= '20160120'
GROUP BY p.nomPais
ORDER BY COUNT(e.idEnvio)


--d.	Mostrar los datos de los fabricantes que tengan env�os con m�s de 500 veh�culos y 
--que no tengan m�s de 3 env�os con menos de 100 veh�culos.

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


--e.	Obtener todos los datos de los veh�culos que fueron enviados en la fecha m�s reciente.

SELECT v.*
FROM Vehiculos v, Envios e, Carga c
WHERE v.vin = c.vin
and c.idEnvio = e.idEnvio
and e.fchEnvio in (select MAX(e.fchEnvio)
					from Envios e)

--f.	Mostrar los datos de los fabricantes que no han hecho env�os en el primer semestre del 2016, 
--registraron alg�n env�o en el 2017 y solo han hecho env�os con destino Holanda.

SELECT distinct f.*
FROM Fabricantes f ,Vehiculos v, Carga c, Envios e
WHERE f.codFab = v.codFab
and v.vin = c.vin
and c.idEnvio = e.idEnvio
AND e.idEnvio NOT IN (SELECT e.idEnvio
					  FROM Envios e
					  WHERE e.fchEnvio >= '20160101'
                      and e.fchEnvio <= '20160830')-- cambie la fecha para tener margen

--g.	Para cada veh�culo con menos de 2.300 kg de peso, mostrar sus datos, 
--la fecha del �ltimo env�o donde particip�,  y el nombre del fabricante.

SELECT
FROM
WHERE

--h.	Bajar el peso en un 5% a todos los veh�culos que no nunca fueron enviados pasado 1 a�o de su fabricaci�n 
--(puede utilizar la funci�n 4b).

SELECT
FROM
WHERE


--i.	Obtener los datos de los fabricantes de Jap�n que en el 2016 
--hayan tenido en alg�n mes un env�o de cantidad total superior a 100 veh�culos y 
--que tambi�n hayan tenido alg�n mes con una cantidad total inferior a 20.


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
and p.nomPais = 'Jap�n'
and DATEPART(YYYY, e.fchEnvio) = '2016'
and exists ( select DATEPART(MM,e.fchEnvio) [Mes], c.vin
			from Carga c
			where c.idEnvio = e.idEnvio
			group by DATEPART(MM,e.fchEnvio), c.vin
			having (count(distinct(c.vin)) > 100 or count(distinct(c.vin)) < 20))

