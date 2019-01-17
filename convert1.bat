
mkdir -p text/ 
mkdir -p info/
cd Papers

echo 	 "Liste et indice des pdfs : "
indice=0
for i in *.pdf
do
	pdftotext -o "../text/$i.txt" "$i"
	echo "----------------------------------------"
	echo "$i indice=$indice"
	echo 
	((indice=indice+1))	
done
echo "----------------------------------------"
echo "pour convertir la forme de coverte(txt ou XML) "
echo "executez la commande : "
echo "./choix.bat -t *indice* pour  obtenir un fichier txt "
echo "./choix.bat -x *indice* pour  obtenir un fichier XML"