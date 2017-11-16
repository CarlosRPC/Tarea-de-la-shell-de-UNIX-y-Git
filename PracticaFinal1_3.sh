meses=("Enero" "Febrero" "Marzo" "Abril" "Mayo" "Junio" "Julio" "Agosto" "Septiembre" "Octubre" "Noviembre" "Diciembre")

for year in {2006..2014}
do
	i=0
	for mes in ${meses[@]}
	do
		 i += 1
		 if [ i < 10 ]; then
			m=0$i
		 else
			m=$i
		 fi
		 while read line
		 do
			 IDC=$(echo $lin | cut -d ',' -f1)
			 CA=$(echo $lin | cut -d ',' -f2)
			 IDP=$(echo $lin | cut -d ',' -f3)
			 PRV=$(echo $lin | cut -d ',' -f4)
		 
			 sed -n '/$PRV/ w ficherito.dat' temp/$mes_$year/T_127P*.txt
			 sed -i -e 's/LA RIOJA *//' -e 's/ LA RIOJA$//' ficherito.dat
			 awk '{print value, $1}' value=$year$m ficherito.dat >> $IDC\_"$CA"/$IDP\_"$PRV"/Nuclear.txt
			 awk '{print value, $2}' value=$year$m ficherito.dat >> $IDC\_"$CA"/$IDP\_"$PRV"/Carbones.txt
			 awk '{print value, $3}' value=$year$m ficherito.dat >> $IDC\_"$CA"/$IDP\_"$PRV"/Lignitos.txt
			 awk '{print value, $4}' value=$year$m ficherito.dat >> $IDC\_"$CA"/$IDP\_"$PRV"/Fuel.txt
			 awk '{print value, $5}' value=$year$m ficherito.dat >> $IDC\_"$CA"/$IDP\_"$PRV"/GasNatural.txt
			 awk '{print value, $6}' value=$year$m ficherito.dat >> $IDC\_"$CA"/$IDP\_"$PRV"/Otros.txt
			 awk '{print value, $7}' value=$year$m ficherito.dat >> $IDC\_"$CA"/$IDP\_"$PRV"/Total.txt
		 done < Ca-Prov.txt
	done
done

#for year in {2006..2014}


