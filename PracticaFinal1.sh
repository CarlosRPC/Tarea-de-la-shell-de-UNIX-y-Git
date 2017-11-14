 #Descargamos todos los archivos y se organizan dentro del directorio "temp/"
 mkdir temp
 for year in {2006..2015}
 do 
	for mes in Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre
	do 
		if [ $year == '2009' ] && [ $mes != 'Diciembre' ]; then
			curl -o temp/$mes\_$year.zip http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/$year/$mes\%20$year.zip &>> aux.log	
		else
			curl -o temp/$mes\_$year.zip http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/$year/$mes\_$year.zip &>> aux.log
		fi
		unzip temp/$mes\_$year -d temp/ &>> aux.log
		rm temp/$mes\_$year.zip &>> aux.log
		mv temp/$mes\ $year temp/$mes\_$year &>> aux.log
		mv temp/$mes temp/$mes\_$year &>> aux.log # meses sin el año
		#mv temp/$(tr 'A-Z' 'a-z' <<< $mes)\ $year temp/$mes\_$year #meses en minusculas y con espacio
	done
done
for mes2 in Enero Febrero Marzo Abril
do
	curl -o temp/$mes2\_2015.zip http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/2015/$mes2\_2015.zip &>> aux.log
	unzip temp/$mes2\_2105 -d temp/ &>> aux.log
	rm temp/$mes2\_2015.zip &>> aux.log
	mv temp/$mes2 temp/$mes2\_2015 &>> aux.log  # meses sin el año
done
########################################################################################################################################################3