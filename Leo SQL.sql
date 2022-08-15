create database Peluqueria;
use Peluqueria;

CREATE TABLE Dueno
(
  DNI INT NOT NULL UNIQUE,
  Nombre    VARCHAR (40) NOT NULL,
  Apellido  VARCHAR (40) NOT NULL,
  Telefono  VARCHAR (35) NOT NULL,
  Direccion VARCHAR (90) NOT NULL,
  PRIMARY KEY (DNI)
);

CREATE TABLE Historial
(
  ID_Historial INT NOT NULL AUTO_INCREMENT,
  Fecha        DATE NOT NULL,
  Perro        INT NOT NULL,
  Descripcion  VARCHAR(250),
  Monto        FLOAT,
  PRIMARY KEY (ID_Historial)
);

CREATE TABLE Perro
(
  ID_Perro INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Fecha_nac DATE,
  Sexo      VARCHAR (10) NOT NULL,
  DNI_dueno INT NOT NULL,
  PRIMARY KEY (ID_Perro)
);

ALTER TABLE Perro
  ADD CONSTRAINT FK_Dueno_TO_Perro
    FOREIGN KEY (DNI_dueno)
    REFERENCES Dueno (DNI);

ALTER TABLE Historial
  ADD CONSTRAINT FK_Perro_TO_Historial
    FOREIGN KEY (Perro)
    REFERENCES Perro (ID_Perro);
    
    -- 2 Inserte información del nuevo animal (perro) y datos del dueño.
INSERT INTO DUENO (DNI, NOMBRE, APELLIDO, TELEFONO, DIRECCION) VALUES (42607652,"nicolas","ferreira",3515299747,"Av. japon 6999");
INSERT INTO Perro (NOMBRE, FECHA_NAC, SEXO, DNI_DUENO) VALUES ("Firulais","2014-03-08","MACHO",42607652);
INSERT INTO Historial (FECHA, PERRO, DESCRIPCION, MONTO) VALUES ("2018-08-10","1","revision y control",2000);

INSERT INTO DUENO (DNI, NOMBRE, APELLIDO, TELEFONO, DIRECCION) VALUES (45679360,"Yesica","Alfonso",3517634853,"Av. juan B. justo 697");
INSERT INTO Perro (NOMBRE, FECHA_NAC, SEXO, DNI_DUENO) VALUES ("Manteca","2017-11-28","HEMBRA",45679360);
INSERT INTO Historial (FECHA, PERRO, DESCRIPCION, MONTO) VALUES ("2022-06-13","1","limpieza de estomago",5000);

INSERT INTO DUENO (DNI, NOMBRE, APELLIDO, TELEFONO, DIRECCION) VALUES (47325609,"Roberto","Duran",351646358,"Av. Colon 555, piso 3");
INSERT INTO Perro (NOMBRE, FECHA_NAC, SEXO, DNI_DUENO) VALUES ("Mirtha","2020-12-27","HEMBRA",47325609);
INSERT INTO Historial (FECHA, PERRO, DESCRIPCION, MONTO) VALUES ("2021-05-02","3","Corte y Baño",1200);

	-- busqueda de perfil: 
select * from dueno;
select * from perro;
select * from historial;

    -- 6) saber que perros asistieron a la veterinaria en 2022  (Obtengo los id perro, podria buscar tambien select * from historial, para ver los datos completos)
			SELECT PERRO FROM HISTORIAL WHERE FECHA >= '2022-00-00' AND FECHA < '2023-00-00';
            
            
     -- 7) Ingresos ganados en Julio del 2022 
			SELECT MONTO FROM HISTORIAL WHERE FECHA >= '2022-07-00' AND FECHA < '2022-08-00'