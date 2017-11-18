while read linea
do
	ID_C=$(echo $linea | cut -d ',' -f1)\_$(echo $linea | cut -d ',' -f2)
	ID_P=$(echo $linea | cut -d ',' -f3)\_$(echo $linea | cut -d ',' -f4)
	mkdir -p "$ID_C"/"$ID_P"
done < Ca-Prov.txt