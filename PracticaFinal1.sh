 #Descargamos todos los archivos y se organizan dentro del directorio "temp/"
 echo "Descargando archivos..."
 mkdir temp
 for year in {2006..2015}
 do 
	for mes in Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre
	do 
		if [ $year == '2015' ] && [ $mes == 'Mayo' ]; then break; fi # Rompe el bucle a partir de Mayo de 2015.
		if [ $year == '2009' ] && [ $mes != 'Diciembre' ]; then # Para la meses de Enero-Noviembre de 2009 la URL es distinta
			curl -o temp/$mes\_$year.zip http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/$year/$mes\%20$year.zip &>> aux.log	
		else
			curl -o temp/$mes\_$year.zip http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/$year/$mes\_$year.zip &>> aux.log
		fi
		unzip -q temp/$mes\_$year.zip -d temp/$mes\_$year &>> aux.log # Descomprime los ficheros en un directorio llamado *Mes_Año*
		rm temp/$mes\_$year.zip # Borra el archivo comprimido
		mv temp/$mes\_$year/*/T_127P*.txt temp/$mes\_$year # Mueve el archivo que necesitamos a el directorio creado anteriormente *Mes_Año*.
	done
done

find temp/*/* ! -name T_127P* -delete #Finalmente borramos todos los archivos y directorios sobrantes
echo "Listo"
########################################################################################################################################################