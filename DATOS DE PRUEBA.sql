-- DATOS DE PRUEBA TABLAS AUXILIARES

INSERT INTO anioVehiculo (letra, anio) VALUES 
('A', 1980),
('B', 1981),
('C', 1982),
('D', 1983),
('E', 1984),
('F', 1985),
('G', 1986),
('H', 1987),
('J', 1988),
('K', 1989),
('L', 1990),
('M', 1991),
('N', 1992),
('P', 1993),
('R', 1994),
('S', 1995),
('T', 1996),
('V', 1997),
('W', 1998),
('X', 1999),
('Y', 2000),
('1', 2001),
('2', 2002),
('3', 2003),
('4', 2004),
('5', 2005),
('6', 2006),
('7', 2007),
('8', 2008),
('9', 2009),
('A', 2010),
('B', 2011),
('C', 2012),
('D', 2013),
('E', 2014),
('F', 2015),
('G', 2016),
('H', 2017),
('J', 2018),
('K', 2019),
('L', 2020),
('M', 2021),
('N', 2022),
('P', 2023),
('R', 2024),
('S', 2025),
('T', 2026),
('V', 2027),
('W', 2028),
('X', 2029),
('Y', 2030),
('1', 2031),
('2', 2032),
('3', 2033),
('4', 2034),
('5', 2035),
('6', 2036),
('7', 2037),
('8', 2038),
('9', 2039)

INSERT INTO valorNumericoVin (letra, numero) VALUES
('A', 1),
('B', 2),
('C', 3),
('D', 4),
('E', 5),
('F', 6),
('G', 7),
('H', 8),
('J', 1),
('K', 2),
('L', 3),
('M', 4),
('N', 5),
('P', 7),
('R', 9),
('S', 2),
('T', 3),
('U', 4),
('V', 5),
('W', 6),
('X', 7),
('Y', 8),
('Z', 9)

INSERT INTO factorMultipVin (posicion, factor) VALUES
(1,8),
(2,7),
(3,6),
(4,5),
(5,4),
(6,3),
(7,2),
(8,10),
(10,9),
(11,8),
(12,7),
(13,6),
(14,5),
(15,4),
(16,3),
(17,2)

/*DATOS*/


--Paises
INSERT INTO Paises VALUES(1, 'Argentina');
INSERT INTO Paises VALUES(2, 'Australia');
INSERT INTO Paises VALUES(3, 'Barbados');
INSERT INTO Paises VALUES(4, 'Bolivia');
INSERT INTO Paises VALUES(5, 'Brasil');
INSERT INTO Paises VALUES(6, 'Canadá');
INSERT INTO Paises VALUES(7, 'Chile');
INSERT INTO Paises VALUES(8, 'China');
INSERT INTO Paises VALUES(9, 'Colombia');
INSERT INTO Paises VALUES(10, 'Corea del Norte');
INSERT INTO Paises VALUES(11, 'Corea del Sur');
INSERT INTO Paises VALUES(12, 'Costa de Marfil');
INSERT INTO Paises VALUES(13, 'Costa Rica');
INSERT INTO Paises VALUES(14, 'Dinamarca');
INSERT INTO Paises VALUES(15, 'República Dominicana');
INSERT INTO Paises VALUES(16, 'Ecuador');
INSERT INTO Paises VALUES(17, 'Egipto');
INSERT INTO Paises VALUES(18, 'El Salvador');
INSERT INTO Paises VALUES(19, 'Emiratos Árabes Unidos');
INSERT INTO Paises VALUES(20, 'España');
INSERT INTO Paises VALUES(21, 'Estados Unidos');
INSERT INTO Paises VALUES(22, 'Finlandia');
INSERT INTO Paises VALUES(23, 'Francia');
INSERT INTO Paises VALUES(24, 'Grecia');
INSERT INTO Paises VALUES(25, 'Guatemala');
INSERT INTO Paises VALUES(26, 'Hong Kong');
INSERT INTO Paises VALUES(27, 'Hungría');
INSERT INTO Paises VALUES(28, 'India');
INSERT INTO Paises VALUES(29, 'Indonesia');
INSERT INTO Paises VALUES(30, 'Irán');
INSERT INTO Paises VALUES(31, 'Iraq');
INSERT INTO Paises VALUES(32, 'Irlanda');
INSERT INTO Paises VALUES(33, 'Israel');
INSERT INTO Paises VALUES(34, 'Italia');
INSERT INTO Paises VALUES(35, 'Jamaica');
INSERT INTO Paises VALUES(36, 'Japón');
INSERT INTO Paises VALUES(37, 'Luxemburgo');
INSERT INTO Paises VALUES(38, 'Macao');
INSERT INTO Paises VALUES(39, 'Marruecos');
INSERT INTO Paises VALUES(40, 'México');
INSERT INTO Paises VALUES(41, 'Noruega');
INSERT INTO Paises VALUES(42, 'Nueva Zelanda');
INSERT INTO Paises VALUES(43, 'Paraguay');
INSERT INTO Paises VALUES(44, 'Perú');
INSERT INTO Paises VALUES(45, 'Portugal');
INSERT INTO Paises VALUES(46, 'Puerto Rico');
INSERT INTO Paises VALUES(47, 'Qatar');
INSERT INTO Paises VALUES(48, 'Reino Unido');
INSERT INTO Paises VALUES(4, 'Rusia');
INSERT INTO Paises VALUES(50, 'Singapur');
INSERT INTO Paises VALUES(51, 'Sudáfrica');
INSERT INTO Paises VALUES(52, 'Suecia');
INSERT INTO Paises VALUES(53, 'Suiza');
INSERT INTO Paises VALUES(54, 'Tailandia');
INSERT INTO Paises VALUES(55, 'Taiwán');
INSERT INTO Paises VALUES(56, 'Tanzania');
INSERT INTO Paises VALUES(57, 'Turquía');
INSERT INTO Paises VALUES(58, 'Ucrania');
INSERT INTO Paises VALUES(59, 'Uganda');
INSERT INTO Paises VALUES(60, 'Uruguay');
INSERT INTO Paises VALUES(61, 'Venezuela');
INSERT INTO Paises VALUES(62,'Alemania');

--Fabricantes
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('VK','Volkswagen','Wolfsburgo, Alemania','info@volkswagen.com',3000);
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('AR','Alfa Romeo', 'Turín, Italia', 'info@alfaromeo.com', 5400);		
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('AM','Aston Martin','Gaydon, Warwickshire, Reino Unido','info@astonmartin.com', 2893);			
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('AS','Audi','Ingolstadt, Alemania', 'info@audi.com', 6245);			
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('BM','BMW',	,'info@bmw.com', 7321);		
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('BQ','Bentley','Crewe, Reino Unido','info@bentley.com', 3097);			
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('BG','Bugatti', 'Molsheim, Alsacia, Francia', 'info@bugatti.com',1823);		
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('CH','Chevrolet','Detroit, MI, Estados Unidos','info@chevrolet.com', 10273);			
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('CI','Citroen', 'París, Francia','info@citroen.com', 6729);			
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('DA','Dacia','Rumanía','info@dacia.com', 3820);		
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('DS','Datsun','Japón','info@datsun.com', 4391);			
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('DT','Ducati',	'Bolonia, Italia', 'info@ducati.com', 4982);		
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('DD','Dodge','Auburn H. MI, Estados Unidos','info@dodge.com', 5932);	
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('FR', 'Ferrari', 'Maranello, Italia','info@ferrari.com', 10384);	
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('FI', 'Fiat', 'Turín, Italia',	'info@fiat.com', 9284);		
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('FD', 'Ford','Dearborn, MI, Estados Unidos','info@ford.com', 3748);	
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('GC','GMC', 'Detroit, MI, Estados Unidos','info@gmc.com', 2354);	
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('HD','Honda','Tokio, Japón','info@honda.com', 5367);	
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('HY','Hyundai','Seúl, Corea del Sur','info@hyundai.com', 11476);			
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('JG','Jaguar',	'Coventry, Reino Unido','info@jaguar.com', 4246);		
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('JP', 'Jeep', 'Toledo, Ohio, Estados Unidos','info@jeep.com', 7698);		
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('KI','Kia','Seúl, Corea del Sur', 'info@kia.com', 12678);
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('LG','Lamborghini', 'SantAgata Bolognese, Italia', 'info@lamborghini.com', 32902);		
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('LC','Lancia','Turín, Italia','info@lancia.com',5468);
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('LR','Land Rover', 'Coventry, WM, Inglaterra','info@landrover.com', 9857);	
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('LX','Lexus','Nagoya, Aichi, Japón','info@lexux.com',54875);
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('MS','Maserati', 'Módena,  Italia','info@maserati.com',4638);
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('MZ', 'Mazda',	'Hiroshima, Japón', 'info@mazda.com', 6583);	
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('MB','Mercedes-Benz','Stuttgart, Alemania','info@mercedezbenz.com',8694);
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('NS', 'Nissan', 'Nishi-ku, Yokohama, Japón', 'info@nissan.com', 20348);	
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('OP','Opel', 'Hesse, Alemania', 'info@opel.com', 3842);		
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('PG','Peugeot', 'París, Francia', 'info@peugeot.com', 4738);	
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('PS', 'Porsche', 'Stuttgart, Alemania', 'info@porsche.com', 5683);		
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('RT', 'Renault', 'Boulogne-Billancourt, Francia', 'info@renault.com', 9649);		
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('RY','Rolls Royce', 'Derby,  Reino Unido', 'info@rollsroyce.com', 4320);	
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('SA', 'Saab', 'Estocolmo,  Suecia', 'info@saab.com', 3019);	
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('ST', 'Seat', 'Martorell (Barcelona) España', 'info@seat.com', 4526);		
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('SB','Subaru', 'Ōta, Japón','info@subaru.com', 3284);
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('SK', 'Suzuki', 'Hamamatsu, Shizuoka, Japón', 'info@suzuqui.com', 9133);	
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('TS','Tesla', 'Palo Alto, California',	'info@tesla.com',23947);
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('TY','Toyota', 'Aichi, Japón', 'info@toyota.com', 8592);
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('VV', 'Volvo', 'Gotemburgo, Suecia', 'info@volvo.com', 5563);
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('YH', 'Yamaha', 'Iwata, Shizuoka, Japón', 'info@yamaha.com', 9002);	
INSERT INTO Fabricantes (codFab, nomFab, dirFab, mailFab, emplFab) VALUES('HN', 'Harley-Davidson', 'Milwaukee, WI, Estados Unidos','info@harleydavidson.com', 11233);

--Plantas
INSERT INTO Plantas (codPlan, codFab, nomPlan, dirPlan, codPais, mailPlan) VALUES(125483,'VK','Planta Volkswagen','Algo algo algo',	62,'planta@volkswagen.com');
INSERT INTO Plantas (codPlan, codFab, nomPlan, dirPlan, codPais, mailPlan) VALUES(899871,'BM','Planta BMW','Algo algo algo', 62,'planta@bmw.com');
INSERT INTO Plantas (codPlan, codFab, nomPlan, dirPlan, codPais, mailPlan) VALUES(343687,'CH', 'Planta Chevrolet','Algo algo algo',21,'planta@chevrolet.com');
INSERT INTO Plantas (codPlan, codFab, nomPlan, dirPlan, codPais, mailPlan) VALUES(131894,'CI','Planta Citroen','Algo algo algo',23,'planta@citroen.com');
INSERT INTO Plantas (codPlan, codFab, nomPlan, dirPlan, codPais, mailPlan) VALUES(641245,'FI','Planta Fiat','Algo algo algo',34,'planta@fiat.com');
INSERT INTO Plantas (codPlan, codFab, nomPlan, dirPlan, codPais, mailPlan) VALUES(212318,'FD', 'Planta Ford','Algo algo algo',21,'planta@ford.com');
INSERT INTO Plantas (codPlan, codFab, nomPlan, dirPlan, codPais, mailPlan) VALUES(789456,'HD','Planta Honda','Algo algo algo',36,'planta@honda.com');
INSERT INTO Plantas (codPlan, codFab, nomPlan, dirPlan, codPais, mailPlan) VALUES(785825,'HY','Planta Hyundai','Algo algo algo',11,'planta@hyundai.com');
INSERT INTO Plantas (codPlan, codFab, nomPlan, dirPlan, codPais, mailPlan) VALUES(125434,'JP','Planta Jeep','Algo algo algo',21,'planta@jeep.com');
INSERT INTO Plantas (codPlan, codFab, nomPlan, dirPlan, codPais, mailPlan) VALUES(521565,'MB','Planta Mercedez Benz','Algo algo algo',62,'planta@mercedezbenz.com');
INSERT INTO Plantas (codPlan, codFab, nomPlan, dirPlan, codPais, mailPlan) VALUES(289734,'NS','Planta Nissan','Algo algo algo',36,'planta@nissan.com');
INSERT INTO Plantas (codPlan, codFab, nomPlan, dirPlan, codPais, mailPlan) VALUES(842567,'RT','Planta Renault','Algo algo algo',23,'planta@renault.com');
INSERT INTO Plantas (codPlan, codFab, nomPlan, dirPlan, codPais, mailPlan) VALUES(645273,'SK','Planta Suzuki','Algo algo algo',36,'planta@suzuki.com');
INSERT INTO Plantas (codPlan, codFab, nomPlan, dirPlan, codPais, mailPlan) VALUES(945472,'HN','Planta Harley-Davidson','Algo algo algo',21,'planta@harleydevidson.com');

-- Vehiculos
INSERT INTO Vehiculos(vin, modelo, color, peso, caracteristicas, codPais, codFab) VALUES('3FAHP0HA7AR316241','FUSION','VERDE',1134,'SEDAN 2.5', 40,'FD');
INSERT INTO Vehiculos(vin, modelo, color, peso, caracteristicas, codPais, codFab) VALUES('1J4FA24158L541376','WRANGLER','AZUL',1530,'2DR SUV 3.8 V8',21,'JP');
INSERT INTO Vehiculos(vin, modelo, color, peso, caracteristicas, codPais, codFab) VALUES('1C6RR7GT1ES409326','RAM PICKUP', 'NEGRO', 2581,'4DR PICKUP 5.7 V8',21,'DD');
INSERT INTO Vehiculos(vin, modelo, color, peso, caracteristicas, codPais, codFab) VALUES('1GBJC34R1YF432082','CK3500', 'AZUL',2209,'COUPE 2-DR V-8 6.2L',21,'CH');
INSERT INTO Vehiculos(vin, modelo, color, peso, caracteristicas, codPais, codFab) VALUES('1G1YY25R695700001','CORVETTE','VIOLETA', 1511,'COUPE 2-DR V-8 6.2L',21,'CH');
INSERT INTO Vehiculos(vin, modelo, color, peso, caracteristicas, codPais, codFab) VALUES('1FDXE45S53HC05364','VAN','BLANCO',1696,'V-10 6.8L 6.8L V10',21,'FD');
INSERT INTO Vehiculos(vin, modelo, color, peso, caracteristicas, codPais, codFab) VALUES('1GNEK13ZX3R298984','Tahoe','AZUL',2419,'4WD 5.3L V8 OHV 16V FFV',21,'CH');