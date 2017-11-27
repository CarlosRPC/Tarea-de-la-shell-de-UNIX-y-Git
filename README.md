# Tarea de la shell de UNIX y Git
Este trabajo consta de tres scripts para acceder a las seriestemporales mensuales de producción eléctrica publicadas por el Ministerio de Industria.

En concreto la producción bruta de energía termoelectrica por provincias segun el combustible.
Con el script "PracticaFinal1.sh" descargamos los datos mencionados de 

http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/Paginas/ElectricasMensuales.aspx.

Por otro lado, con el script "PracticaFinal1_2.sh", generamos un directorio por Comunidad Autonoma (ID_Nombre Comunidad Autonoma),
dentro de cada comunidad autonoma, habra otro directorio con la Provincia (ID_Provincia)

http://www.ine.es/daco/daco42/codmun/cod_ccaa_provincia.htm

Por último, con el script "PracticaFinal1_3.sh", dentro de los directorios (ID_Provincia) anteriores, generamos un fichero por cada tipo de energía termoelectrica, incluyendo el Total.
Cada fichero consistirá en una serie termporal completa del tipo de energía con el formato siguiente:

      200601  61653
      200602   4653
      ......   ....
      
en la primera columna aparecerá el año y el mes (YYYYMM) y en la segunda columna la producción expresada en MWh eliminando el '.' para separar los miles
   
# Autores
 Carlos Rafael Perez Cabrera 
