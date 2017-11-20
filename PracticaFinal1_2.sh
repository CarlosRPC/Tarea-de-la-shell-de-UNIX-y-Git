echo "Creando directorios..."
while read linea
do
	ID_C=$(echo $linea | cut -d '_' -f1,2)
	ID_P=$(echo $linea | cut -d '_' -f3,4)
	mkdir -p "$ID_C"/"$ID_P"
done < Ca-Prov.txt

echo "Listo"
###################################################