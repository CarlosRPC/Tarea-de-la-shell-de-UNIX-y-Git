 mkdir temp
 for year in {2006..2014}
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
		mv temp/$(tr 'A-Z' 'a-z' <<< $mes)\ $year temp/$mes\_$year #meses en minusculas y con espacio
		mv temp/$mes temp/$mes\_$year  # meses sin el año
	done
done
		