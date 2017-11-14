while read lin
do
	IDC=$(echo $lin | cut -d ',' -f1)
	CA=$(echo $lin | cut -d ',' -f2)
	IDP=$(echo $lin | cut -d ',' -f3)
	PRV=$(echo $lin | cut -d ',' -f4)
	mkdir -p $IDC\_"$CA"/$IDP\_"$PRV"
done < CAPROV.txt