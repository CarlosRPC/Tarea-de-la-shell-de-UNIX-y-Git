meses=("Enero" "Febrero" "Marzo" "Abril" "Mayo" "Junio" "Julio" "Agosto" "Septiembre" "Octubre" "Noviembre" "Diciembre")

for year in {2006..2014}
do
	i=0
	for mes in ${meses[@]}
	do
		i=$(( i + 1 ))
		if [ i < 10 ]; then
			m=0$i
		else
			m=$i
		fi
		awk 'NR>9{print $0}' temp/Agosto_2011/T_127P_0811.txt | tr -s [:blank:] "," > provisional.txt
		#Quitamos la cabecera y todos los espacios se sustituyen por una coma.
		sed -i -e 's/S.C./S-C-/g' -e 's/\.//g' -e 's/\-/\./g' -e 's/\([A-Z]\)\,\([A-Z]\)/\1\ \2/g' provisional.txt	
		#Quitamos los puntos, teniendo cuidado con los puntos de *S.C.TENERIFE*, y las comas entre las provincias.
		while read line
		do
			 IDC=$(echo $lin | cut -d ',' -f1)
			 CA=$(echo $lin | cut -d ',' -f2)
			 IDP=$(echo $lin | cut -d ',' -f3)
			 PRV=$(echo $lin | cut -d ',' -f4)
		
		done < Ca-Prov.txt
	done
done

#for year in {2006..2014}


