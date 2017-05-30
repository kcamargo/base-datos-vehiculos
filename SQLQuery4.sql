SELECT distinct f.*
FROM Fabricantes f, Vehiculos v, Carga c, Envios e
WHERE f.codFab = v.codFab
and v.vin = c.vin
and c.idEnvio = e.idEnvio
AND e.idEnvio IN (SELECT e.idEnvio
					  FROM Envios e
					  WHERE e.fchEnvio >= '20160101'
                      and e.fchEnvio <= '20160830')
select * from Fabricantes