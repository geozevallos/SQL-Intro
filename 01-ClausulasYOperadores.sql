#MI primera consulta
#SELECT EMPRESA, DIRECCIÓN, POBLACIÓN 
#FROM practicandobd.clientes

#SELECT NOMBREARTÍCULO, SECCIÓN, PRECIO
#FROM practicandobd.PRODUCTOS
#WHERE SECCIÓN = 'CERÁMICA'
#OR SECCIÓN="DEPORTES";

#### WHERE Y OTRAS
#SELECT NOMBREARTÍCULO, SECCIÓN, PRECIO
#FROM practicandobd.PRODUCTOS
#WHERE SECCIÓN = 'CERÁMICA'
#AND PAÍSDEORIGEN="CHINA"
#AND PRECIO > 100


########## FECHAS
##BETWEEN DATES
#SELECT * FROM practicandobd.PRODUCTOS
#WHERE FECHA BETWEEN '2000-03-01' AND '2000-05-01'

#OTRA MANERA
SELECT * FROM practicandobd.PRODUCTOS
WHERE FECHA >= '2000-03-01' AND FECHA <=  '2000-05-01'