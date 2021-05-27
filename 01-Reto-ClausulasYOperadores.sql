# 1era 
#SELECT EMPRESA, POBLACIÓN 
#FROM practicandobd.clientes;

#articulos de la seccion ceramica
SELECT * FROM practicandobd.productos
WHERE SECCIÓN = 'CERÁMICA';

#ARTICULOS DE LA SECCIÓN DEPORTES
SELECT NOMBREARTÍCULO, PRECIO FROM practicandobd.productos
WHERE SECCIÓN = 'DEPORTES' AND (PRECIO >= 100 AND PRECIO <= 200);

#NO es españa
SELECT * FROM practicandobd.productos
WHERE PAÍSDEORIGEN <> 'ESPAÑA';

SELECT * FROM practicandobd.productos
WHERE (PAÍSDEORIGEN = 'ESPAÑA' AND SECCIÓN = 'DEPORTES')
OR (PRECIO > 350);

SELECT NOMBREARTÍCULO, SECCIÓN, FECHA FROM practicandobd.productos
WHERE FECHA BETWEEN '2001-05-01' AND '2001-12-15';
