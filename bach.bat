mkdir -p text1/ 
cd Papers
for i in *.pdf
do 
	fname="${i%.*}"
	echo le nom de fichier est: $fname >> "../text1/$fname.txt"
	sed -n '1,2p' "../text/$fname.txt" >> "../text1/$fname.txt"
	echo L'abstract de l'auteur est: >> "../text1/$fname.txt"
	cat "../text/$fname.txt" | sed -n '/Abstract/,/Introduction/p' | sed -e  's:.*<Abstract>::' | sed -e 's:<Introduction>.*::'  >> "../text1/$fname.txt"
done
