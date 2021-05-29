# UNION

SELECT * FROM practicandobd.productos WHERE SECCIÓN = 'DEPORTES'
UNION
SELECT * FROM practicandobd.productosnuevos WHERE SECCIÓN = 'DEPORTES DE RIESGO';


SELECT * FROM practicandobd.productos WHERE PRECIO > 300
UNION
SELECT * FROM practicandobd.productosnuevos WHERE SECCIÓN = 'ALTA COSTURA';

#INNER JOIN
SELECT * FROM practicandobd.clientes
INNER JOIN practicandobd.pedidos ON
clientes.CÓDIGOCLIENTE = pedidos.`CÓDIGO CLIENTE`
WHERE POBLACIÓN = 'MADRID';


## LEFT JOIN

SELECT * FROM practicandobd.clientes AS c
LEFT JOIN practicandobd.pedidos AS p ON
c.CÓDIGOCLIENTE = p.`CÓDIGO CLIENTE`
WHERE POBLACIÓN = 'MADRID';


SELECT c.CÓDIGOCLIENTE, EMPRESA, p.`FORMA DE PAGO`, DESCUENTO FROM practicandobd.clientes AS c
LEFT JOIN practicandobd.pedidos AS p ON
c.CÓDIGOCLIENTE = p.`CÓDIGO CLIENTE`
WHERE POBLACIÓN = 'MADRID';

##QUIENES NO HAN HECHO PEDIDOS
SELECT c.CÓDIGOCLIENTE, EMPRESA, p.`FORMA DE PAGO`, DESCUENTO FROM practicandobd.clientes AS c
LEFT JOIN practicandobd.pedidos AS p ON
c.CÓDIGOCLIENTE = p.`CÓDIGO CLIENTE`
WHERE POBLACIÓN = 'MADRID' AND p.`CÓDIGO CLIENTE` IS NULL;