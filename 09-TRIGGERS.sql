#CREAR TABLA PARA ALMACENAR LAS MODIFICACIONES
CREATE TABLE practicandobd.REG_PRODUCTOS (CODARTICULO VARCHAR (25),
NOMBREARTICULO VARCHAR(30), PRECIO INT, INSERTADO DATETIME);

####CREANDO EL TRIGGER AL INSERTAR
CREATE TRIGGER practicandobd.PRODUCTOS_AFI
AFTER INSERT ON practicandobd.productos
FOR EACH ROW 
INSERT INTO practicandobd.REG_PRODUCTOS(
CODARTICULO, NOMBREARTICULO, PRECIO, INSERTADO
) 
#Estos son en base al insert q hago
VALUES (
NEW.CODARTICULO,
NEW.NOMBREARTÍCULO,
NEW.PRECIO,
NOW()
);

## PROBANDO EL TRIGGER
INSERT INTO practicandobd.productos (CODARTICULO, SECCIÓN, NOMBREARTÍCULO, PRECIO)
VALUES ('AR75', 'DEPORTES', 'CASACA BLANQUIAZUL', 100);

############## TRIGGER DE ACTUALIZACION ##################################
#PARA GUARDAR ALGO DEBERIA SER BEFORE

DROP TABLE practicandobd.PRODUCTOS_ACTUALIZADOS;

CREATE TABLE practicandobd.PRODUCTOS_ACTUALIZADOS (
ANTERIOR_CODIGOARTICULO VARCHAR(4),
ANTERIOR_NOMBREARTICULO VARCHAR(25),
ANTERIOR_SECCION VARCHAR(15),
ANTERIOR_PRECIO INT,
ANTERIOR_IMPORTADO VARCHAR(15),
ANTERIOR_PAISORIGEN VARCHAR(15),
ANTERIOR_FECHA DATE,
NUEVO_CODIGOARTICULO VARCHAR(4),
NUEVO_NOMBREARTICULO VARCHAR(25),
NUEVO_SECCION VARCHAR(15),
NUEVO_PRECIO INT,
NUEVO_IMPORTADO VARCHAR(15),
NUEVO_PAISORIGEN VARCHAR(15),
NUEVO_FECHA DATE,
USUARIO VARCHAR(15),
F_MODIF DATE);

##CREANDO TRIGGER
CREATE TRIGGER practicandobd.act_prod_BU
BEFORE UPDATE ON practicandobd.productos
FOR EACH ROW
INSERT INTO practicandobd.PRODUCTOS_ACTUALIZADOS (
ANTERIOR_CODIGOARTICULO,
ANTERIOR_NOMBREARTICULO,
ANTERIOR_SECCION,
ANTERIOR_PRECIO,
ANTERIOR_IMPORTADO,
ANTERIOR_PAISORIGEN,
ANTERIOR_FECHA,
NUEVO_CODIGOARTICULO,
NUEVO_NOMBREARTICULO,
NUEVO_SECCION,
NUEVO_PRECIO,
NUEVO_IMPORTADO,
NUEVO_PAISORIGEN,
NUEVO_FECHA,
USUARIO,
F_MODIF
) VALUES(
OLD.CODARTICULO,
OLD.NOMBREARTÍCULO,
OLD.SECCIÓN,
OLD.PRECIO,
OLD.IMPORTADO,
OLD.PAÍSDEORIGEN,
OLD.FECHA,
NEW.CODARTICULO,
NEW.NOMBREARTÍCULO,
NEW.SECCIÓN,
NEW.PRECIO,
NEW.IMPORTADO,
NEW.PAÍSDEORIGEN,
NEW.FECHA,
CURRENT_USER(),
NOW()
);

DROP TRIGGER practicandobd.act_prod_BU;

### UPDATE
UPDATE practicandobd.productos
SET PRECIO = PRECIO + 20
WHERE CODARTICULO = 'AR40';


############## TRIGGER DE ELIMINACION ##################################
CREATE TABLE practicandobd.prod_eliminados ( 
CODIGOARTICULO VARCHAR(4),
NOMBREARTICULO VARCHAR(25),
SECCION VARCHAR(15),
PRECIO INT,
IMPORTADO VARCHAR(15),
PAISORIGEN VARCHAR(15),
FECHA DATE);


## CREANDO TRIGGER
CREATE TRIGGER practicandobd.ELIMPROD_AD
AFTER DELETE ON practicandobd.productos
FOR EACH ROW
INSERT INTO practicandobd.prod_eliminados (
CODIGOARTICULO,
NOMBREARTICULO,
SECCION,
PRECIO,
IMPORTADO,
PAISORIGEN,
FECHA
) VALUES (
OLD.CODARTICULO,
OLD.NOMBREARTÍCULO,
OLD.SECCIÓN,
OLD.PRECIO,
OLD.IMPORTADO,
OLD.PAÍSDEORIGEN,
OLD.FECHA);

##ELIMINANDO
DELETE FROM practicandobd.productos
WHERE CODARTICULO='AR75';


######### ACTUALIZAR TRIGGER #####
# PRIMERO LA TABLA
ALTER TABLE practicandobd.prod_eliminados
ADD COLUMN (USUARIO VARCHAR(15), FECHA_ELIM DATETIME);

## DE POR SI NO SE PUEDE ACTUALIZAR, PUEDE BORRAR Y VOLVER A CREER

DROP TRIGGER IF EXISTS practicandobd.ELIMPROD_AD;

CREATE TRIGGER practicandobd.ELIMPROD_AD
AFTER DELETE ON practicandobd.productos
FOR EACH ROW
INSERT INTO practicandobd.prod_eliminados (
CODIGOARTICULO,
NOMBREARTICULO,
SECCION,
PRECIO,
IMPORTADO,
PAISORIGEN,
FECHA,
USUARIO,
FECHA_ELIM
) VALUES (
OLD.CODARTICULO,
OLD.NOMBREARTÍCULO,
OLD.SECCIÓN,
OLD.PRECIO,
OLD.IMPORTADO,
OLD.PAÍSDEORIGEN,
OLD.FECHA,
CURRENT_USER(),
NOW());

##ELIMINANDO
DELETE FROM practicandobd.productos
WHERE CODARTICULO='AR17';