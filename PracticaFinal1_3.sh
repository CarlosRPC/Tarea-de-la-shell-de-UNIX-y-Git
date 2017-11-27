meses=("Enero" "Febrero" "Marzo" "Abril" "Mayo" "Junio" "Julio" "Agosto" "Septiembre" "Octubre" "Noviembre" "Diciembre")
for year in {2006..2015}
do
	i=0
	for mes in ${meses[@]}
	do
		i=$(( i + 1 ))
		if [ $i -le 9 ]; then m1=0$i; else m1=$i; fi # Conseguimos los meses en formato numerico con un contador, y añadimos el 0, para tener 01,02,...,12.
		if [ $year == '2015' ] && [ $mes == 'Mayo' ]; then break; fi # Evitamos que siga buscando a partir de Mayo de 2015.
		
		sed 's/\.\([^S.C.T]\)/\1/g' temp/$mes\_$year/T*.txt | head -n-2 | tail -n+10 > provisional.txt 
		# Quitamos los datos innecesarios (la cabecera y dos ultimas lineas). Tambien quitamos los puntos de los miles, teniendo cuidado con *S.C.TENERIFE*.
		sed -i 's/\([A-Z0-9]\)\ \ *\([0-9]\)/\1,\2/g ; s/LA\ CORU/LA\ CORUÑA/ ; s/\([0-9]\)\  *\([A-Z0-9]\)/\1,\2/g' provisional.txt
		# Quitamos todos los espacios en blanco y los sustituimos por comas, exepto los espacios entre las provincias con mas de una palabra.
		
		cat Ca-Prov.txt | while read linea
		do
			COM=$(echo $linea | cut -d '_' -f1,2)
			IDP=$(echo $linea | cut -d '_' -f3)
			PRV=$(echo $linea | cut -d '_' -f4)
			
			awk -F, -v VAR="$PRV" -v VAR1="$year$m1" -v VAR2="$COM" -v VAR3="$IDP" '
			{
				if ($1 ~ VAR) {
					print VAR1, $2 >> ""VAR2"/"VAR3"_"VAR"/NUCLEAR.txt"
					print VAR1, $3 >> ""VAR2"/"VAR3"_"VAR"/CARBONES.txt"
					print VAR1, $4 >> ""VAR2"/"VAR3"_"VAR"/LIGNITOS.txt"
					print VAR1, $5 >> ""VAR2"/"VAR3"_"VAR"/FUEL.txt"
					print VAR1, $6 >> ""VAR2"/"VAR3"_"VAR"/GAS_NATURAL.txt"
					print VAR1, $7 >> ""VAR2"/"VAR3"_"VAR"/OTROS_COMBUSTIBLES.txt"
					print VAR1, $8 >> ""VAR2"/"VAR3"_"VAR"/TOTAL.txt"
				}
			}
            ' provisional.txt
			# Extraemos los datos de cada provincia poniendo cada dato en su fichero correspondiente. 
		done
		echo "Datos de" $mes "de" $year "copiados" 
	done
done

echo "Listo"
rm provisional.txt
#####################################################################################################################################################################
