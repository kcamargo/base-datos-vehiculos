--a.	Mostrar el mayor peso, el menor peso, la mayor fecha y la menor fecha de los env�os de los a�os 2015 y 2016.

SELECT MAX(E.pesoEnvio), MIN(e.pesoEnvio), MAX(e.fchEnvio), MIN(e.fchEnvio)
FROM Envios e
WHERE e.fchEnvio >= '20150101'
AND e.fchEnvio <= '20161231'

--b.	Mostrar para cada fabricante su nombre, la cantidad de veh�culos enviados y 
--el peso total de los mismos en el a�o 2016 (ordenar los resultados de mayor peso a menor peso).

Select distinct f.nomFab, e.pesoEnvio, COUNT(c.vin) -- EL count no devuelve bien
from Vehiculos v, Carga c, Envios e, Fabricantes f
where e.fchEnvio >= '20160101'
and e.fchEnvio <= '20161231'
and e.idEnvio = c.idEnvio
and c.vin = v.vin
and v.codFab = f.codFab
Group by f.nomFab, e.pesoEnvio


--c.Para todos los pa�ses que fueron destino de env�os, mostrar su nombre, 
--su cantidad de env�os en los 20 primeros d�as de enero de 2016 y la fecha del �ltimo env�o realizado,
-- si alg�n pa�s nunca fue destino de env�os igual debe mostrar su nombre.


select *
FROM Paises p 
left join Envios e
on e.desEnvio = p.codPais
and e.fchEnvio >= '2016-01-01'
and e.fchEnvio <= '2016-01-20'

select * from Envios e
where e.fchEnvio >= '20160101'
and e.fchEnvio <= '20160120'

SELECT p.nomPais, MIN(E.fchEnvio) as ultEnvio
FROM Paises p 
left join Envios e
on e.desEnvio = p.codPais
and e.fchEnvio >= '20160101'
and e.fchEnvio <= '20160120'
GROUP BY p.nomPais
ORDER BY COUNT(e.idEnvio)





--d.	Mostrar los datos de los fabricantes que tengan env�os con m�s de 500 veh�culos y que no tengan m�s de 3 env�os con menos de 100 veh�culos.

SELECT
FROM
WHERE

--e.	Obtener todos los datos de los veh�culos que fueron enviados en la fecha m�s reciente.

SELECT
FROM
WHERE

--f.	Mostrar los datos de los fabricantes que no han hecho env�os en el primer semestre del 2016, registraron alg�n env�o en el 2017 y solo han hecho env�os con destino Holanda.

SELECT
FROM
WHERE

--g.	Para cada veh�culo con menos de 2.300 kg de peso, mostrar sus datos, la fecha del �ltimo env�o donde particip�,  y el nombre del fabricante.

SELECT
FROM
WHERE

--h.	Bajar el peso en un 5% a todos los veh�culos que no nunca fueron enviados pasado 1 a�o de su fabricaci�n (puede utilizar la funci�n 4b).

SELECT
FROM
WHERE


--i.	Obtener los datos de los fabricantes de Jap�n que en el 2016 hayan tenido en alg�n mes un env�o de cantidad total superior a 100 veh�culos y que tambi�n hayan tenido alg�n mes con una cantidad total inferior a 20.
