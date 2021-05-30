#DDL CREACION DE TABLAs
#CREACION TABLA
CREATE TABLE practicandobd.prueba (
primercampo VARCHAR(20)
);

#BORRAR TABLA
DROP TABLE practicandobd.prueba;


CREATE TABLE practicandobd.prueba (
primercampo VARCHAR(20),
segundocampo INT,
tercampo DATE
);

CREATE TABLE practicandobd.prueba (
llave INT AUTO_INCREMENT,
primercampo VARCHAR(20),
segundocampo INT,
tercampo DATE,
SINO BOOL,
PRIMARY KEY(llave)
);


################ MODIFICACION DE TABLAS

#AGEGAR COLUMNA
ALTER TABLE practicandobd.prueba
ADD COLUMN columnanueva varchar(10);

#ELIMINANDO COLUMNA
ALTER TABLE practicandobd.prueba
DROP COLUMN columnanueva;

#MODIFICAR NOMBRE Y TIPO
ALTER TABLE practicandobd.prueba
CHANGE COLUMN primercampo campo1
INT;

#CAMBIAR TIPO DE CAMPO
ALTER TABLE practicandobd.prueba
MODIFY campo1 VARCHAR(5);

#ASIGNAR VALOR POR DEFECTO
ALTER TABLE practicandobd.prueba
ALTER COLUMN campo1
SET DEFAULT  "ALGO";

#ELIMINAR VALOR POR DEFECTO
ALTER TABLE practicandobd.prueba
ALTER COLUMN campo1
DROP DEFAULT;