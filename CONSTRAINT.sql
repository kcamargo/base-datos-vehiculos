
/*VEHICULOS*/
ALTER TABLE Vehiculos ADD CONSTRAINT ck_vin CHECK (vin in('i', 'o', 'q', 'ñ'));
-- No se si está bien ALTER TABLE Vehiculos DROP COLUMN codPais; 
-- No se si está bien ALTER TABLE Vehiculos DROP COLUMN codFab; 

/*PAISES*/
ALTER TABLE Paises ADD CONSTRAINT uk_nomPais UNIQUE(nomPais);

/*FABRICANTES*/
ALTER TABLE Fabricantes ADD CONSTRAINT uk_mailFab UNIQUE(mailFab);
ALTER TABLE Fabricantes ADD emplFab NUMERIC(38) NOT NULL;
ALTER TABLE Fabricantes ADD CONSTRAINT ck_emplFab CHECK (emplFab > 0);

/*PLANTAS*/
ALTER TABLE Plantas DROP COLUMN mailPlan;
ALTER TABLE Plantas ADD mailPlan VARCHAR(50) NOT NULL;
ALTER TABLE Plantas ADD CONSTRAINT uk_mailPlan UNIQUE(mailPlan);
