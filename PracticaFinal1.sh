 mkdir temp
 for year in {2006..2015}
 do 
	for mes in Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre
	do 
		if [ $year == '2009' ] && [ $mes != 'Diciembre' ]; then
			curl -o temp/$mes\_$year.zip http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/$year/$mes\%20$year.zip 	
		else
			curl -o temp/$mes\_$year.zip http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/$year/$mes\_$year.zip
		fi
		unzip temp/$mes\_$year -d temp/
		rm temp/$mes\_$year.zip
		#mv temp/$(tr 'A-Z' 'a-z' <<< $mes)\ $year temp/$mes\_$year #meses en minusculas y con espacio
		mv temp/$mes\ $year temp/$mes\_$year
		mv temp/$mes temp/$mes\_$year  # meses sin el año
	done
done
for mes2 in Enero Febrero Marzo Abril
	do
	curl -o temp/$mes2\_2015.zip http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/2015/$mes2\_2015.zip
	unzip temp/$mes\_2105 -d temp/
	rm temp/$mes\_2015.zip
	mv temp/$mes temp/$mes\_2015  # meses sin el año