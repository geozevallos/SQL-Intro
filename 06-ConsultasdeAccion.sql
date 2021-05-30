#CONSULTAS DE ACCION

#ACTUALIZACION
UPDATE practicandobd.productos
SET PRECIO = PRECIO + 10
WHERE SECCIÓN = 'JUGUETERÍA';

UPDATE practicandobd.productos
SET SECCIÓN = 'JUGUETES'
WHERE SECCIÓN = 'JUGUETERÍA';

UPDATE practicandobd.productos
SET SECCIÓN = 'JUGUETERÍA'
WHERE SECCIÓN = 'JUGUETES';


#CREACION DE TABLA 
CREATE TABLE practicandobd.clientes_madrid
SELECT * FROM practicandobd.clientes
WHERE POBLACIÓN = 'MADRID';

####DELETE

SELECT * FROM practicandobd.clientes AS c
LEFT JOIN practicandobd.pedidos AS p
ON c.CÓDIGOCLIENTE = p.`CÓDIGO CLIENTE`
WHERE p.`CÓDIGO CLIENTE` IS NULL;

CREATE TABLE practicandobd.clientes2
SELECT * FROM practicandobd.clientes;

CREATE TABLE practicandobd.pedidos2
SELECT * FROM practicandobd.pedidos;

SELECT * FROM practicandobd.clientes2 AS c
LEFT JOIN practicandobd.pedidos2 AS p
ON c.CÓDIGOCLIENTE = p.`CÓDIGO CLIENTE`
WHERE p.`CÓDIGO CLIENTE` IS NULL;

DELETE c.*
FROM practicandobd.clientes2 AS c
LEFT JOIN practicandobd.pedidos2 AS p
ON c.CÓDIGOCLIENTE = p.`CÓDIGO CLIENTE`
WHERE p.`CÓDIGO CLIENTE` IS NULL;


DELETE FROM practicandobd.clientes2
WHERE POBLACIÓN = "MADRID";


######### INSERT INTO
INSERT INTO practicandobd.clientes2
SELECT * FROM practicandobd.clientes_madrid;


##INSERT INTO SOLO ALGUNOS CAMPOS
INSERT INTO practicandobd.clientes2 (CÓDIGOCLIENTE, EMPRESA, POBLACIÓN)
SELECT CÓDIGOCLIENTE, EMPRESA, POBLACIÓN FROM practicandobd.clientes_madrid;