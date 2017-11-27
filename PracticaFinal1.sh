 #Descargamos todos los archivos y se organizan dentro del directorio "temp/"
 echo "Descargando archivos..."
 mkdir temp
 for year in {2006..2015}
 do 
	for mes in Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre
	do 
		cod="_"
		if [ $year == '2015' ] && [ $mes == 'Mayo' ]; then break; fi # Rompe el bucle a partir de Mayo de 2015.
		if [ $year == '2009' ] && [ $mes != 'Diciembre' ]; then cod="%20"; fi # Para la meses de Enero-Noviembre de 2009 la URL es distinta
		curl -o temp/$mes\_$year.zip http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/$year/$mes$cod$year.zip &>> aux.log
		unzip -q -j temp/$mes\_$year.zip -d temp/$mes\_$year &>> aux.log # Descomprime los ficheros en un directorio llamado *Mes_Año*
		rm temp/$mes\_$year.zip # Borra el archivo comprimido
	done
done

find temp/*/* ! -name T_127P* -delete #Finalmente borramos todos los archivos y directorios sobrantes
echo "Listo"
########################################################################################################################################################