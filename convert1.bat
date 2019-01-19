
mkdir -p text/ 
mkdir -p info/
cd Papers



echo 	 "Liste et indice des pdfs : "
indice=1
for i in *.pdf
do
	
	if [ "$i" != "${i// /_}" ]
	then
		mv "$i" "${i// /_}"
	fi

	i="${i// /_}"
		
	fname="${i%.*}"
	
	echo $fname
	echo "" >  ../text/$fname.txt
	
	pdftotext $i "../text/$fname.txt"

	echo "$i indice=$indice"
	echo 
	((indice=indice+1))
	echo "----------------------------------------"	
done
echo "----------------------------------------"
echo "pour convertir la forme de coverte(txt ou XML) "
echo "executez la commande : "
echo "./choix.bat -t *indice* pour  obtenir un fichier txt "
echo "./choix.bat -x *indice* pour  obtenir un fichier XML"
