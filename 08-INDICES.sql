CREATE TABLE practicandobd.practica (
DNI VARCHAR(8),
NOMBRE VARCHAR(30),
EDAD INT,
PRIMARY KEY(DNI)
);

DROP TABLE practicandobd.practica;


CREATE TABLE practicandobd.practica (
DNI VARCHAR(8),
NOMBRE VARCHAR(30),
EDAD INT
);

#AGREGANDO CAMPO PRIMARIO
ALTER TABLE practicandobd.practica
ADD PRIMARY KEY (DNI);


#QUITANDO PRIMARY KEY
ALTER TABLE practicandobd.practica
DROP PRIMARY KEY;

#CAMPO PRIMARIO POR 2 CAMPSOS 
ALTER TABLE practicandobd.practica
ADD PRIMARY KEY(DNI,NOMBRE);


#### INDICE ORDINARIO
CREATE INDEX indordinario ON practicandobd.practica (NOMBRE);

##CREAR INDICE UNICO
CREATE UNIQUE INDEX indunico ON practicandobd.practica(DNI);

##INDICE COMPUESTO
CREATE UNIQUE INDEX idnombunico ON practicandobd.practica (NOMBRE,EDAD);


####### ELIMINAR INDICES
DROP INDEX indordinario ON practicandobd.practica;