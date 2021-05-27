#ORDERBY
SELECT * FROM practicandobd.productos
WHERE SECCIÓN = 'CERÁMICA' OR SECCIÓN = 'DEPORTES'
ORDER BY SECCIÓN;

#DESCENDENTE
SELECT * FROM practicandobd.productos
WHERE SECCIÓN = 'CERÁMICA' OR SECCIÓN = 'DEPORTES'
ORDER BY SECCIÓN DESC;

#POR DOS ORDENES SEGUIDOS
SELECT * FROM practicandobd.productos
WHERE SECCIÓN = 'CERÁMICA' OR SECCIÓN = 'DEPORTES'
ORDER BY SECCIÓN, PAÍSDEORIGEN, PRECIO DESC;