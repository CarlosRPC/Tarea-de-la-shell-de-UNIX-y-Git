meses=("Enero" "Febrero" "Marzo" "Abril" "Mayo" "Junio" "Julio" "Agosto" "Septiembre" "Octubre" "Noviembre" "Diciembre")
for year in {2006..2014}
do
	i=0
	echo "UN AÑO MAS ", $year
	for mes in ${meses[@]}
	do
		i=$(( i + 1 ))
		if [ $i -le 9 ]; then
			m1=0$i
		else
			m1=$i
		fi
		
		sed 's/\.\([^S.C.T]\)/\1/g' temp/$mes\_$year/T_127P*.txt | head -n-2 | tail -n+10 > provisional.txt
		sed -i 's/\([A-Z0-9]\)\ \ *\([0-9]\)/\1,\2/g ; s/\([0-9]\)\  *\([A-Z0-9]\)/\1,\2/g' provisional.txt 
		echo "UN MES MAS ", $mes
		
		cat Ca-Prov.txt | while read lin
		do
			COM=$(echo $lin | cut -d ',' -f1)\_$(echo $lin | cut -d ',' -f2)
			IDP=$(echo $lin | cut -d ',' -f3)
			PRV=$(echo $lin | cut -d ',' -f4)
			
			awk -F, -v VAR="$PRV" -v VAR1="$year$m1" -v VAR2="$COM" -v VAR3="$IDP" '
			{
				if ($1==VAR) {
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
		done
	done
done



##awk 'NR>9{print $0}' temp/Agosto_2011/T_127P_0811.txt | tr -s [:blank:] "," > provisional.txt
##Quitamos la cabecera y todos los espacios se sustituyen por una coma.
##sed -i -e 's/\.\([^S.C.T]\)/\1/g' -e 's/\([A-Z]\)\,\([A-Z]\)/\1\ \2/g' provisional.txt	
##Quitamos los puntos, teniendo cuidado con los puntos de *S.C.TENERIFE*, y las comas entre las provincias.


