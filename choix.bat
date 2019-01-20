if [ $1 = "-t" ]; then
	j=0
	mkdir -p text1/ 
	cd Papers
	for i in *.pdf
	do 
	var=1
	args=("$@") 
		if [[ " ${args[@]} " =~ " ${var} " ]]; then
			echo "$i à convertir... "
			fname="${i%.*}"	
			echo le nom de fichier est: $fname > "../text1/$fname.txt"
			sed -n '1,2p' "../text/$fname.txt" >> "../text1/$fname.txt"
			echo L'abstract de l'auteur est: >> "../text1/$fname.txt"
			cat "../text/$fname.txt" | sed -n '/Abstract/,/Introduction/p' | sed -e  's:.*<Abstract>::' | sed -e 's:<Introduction>.*::'  >> "../text1/$fname.txt"
			cat "../text/$fname.txt" | sed -n '/ABSTRACT/,/INTRODUCTION/p' | sed -e  's:.*<ABSTRACT>::' | sed -e 's:<INTRODUCTION>.*::'  >> "../text1/$fname.txt"
			

			cat "../text/$fname.txt" | sed -n '/Conclusion/,/Références/p' | sed -e  's:.*<Conclusion>::' | sed -e 's:<Références>.*::'  >> "../text1/$fname.txt"
			cat "../text/$fname.txt" | sed -n '/Conclusion/,/References/p' | sed -e  's:.*<Conclusion>::' | sed -e 's:<References>.*::'  >> "../text1/$fname.txt"
			cat "../text/$fname.txt" | sed -n '/CONCLUSION/,/REFERENCES/p' | sed -e  's:.*<CONCLUSION>::' | sed -e 's:<REFERENCES>.*::'  >> "../text1/$fname.txt"
			
			echo La discussion de la recherche est: >> "../text1/$fname.txt"
			cat "../text/$fname.txt" | sed -n '/Discussion/,/Conclusion/p' | sed -e  's:.*<Discussion>::' | sed -e 's:<References>.*::'  >> "../text1/$fname.txt"
			cat "../text/$fname.txt" | sed -n '/CONCLUSION/,/REFERENCES/p' | sed -e  's:.*<CONCLUSION>::' | sed -e 's:<REFERENCES>.*::'  >> "../text1/$fname.txt"

			echo La bibliographie de la recherche est: >> "../text1/$fname.txt"
			cat "../text/$fname.txt" | sed -n '/References/,/aaa/p' | sed -e  's:.*<References>::' | sed -e 's:<aaa>.*::'  >> "../text1/$fname.txt"
			cat "../text/$fname.txt" | sed -n '/REFERENCES/,/aaa/p' | sed -e  's:.*<References>::' | sed -e 's:<aaa>.*::'  >> "../text1/$fname.txt"


		fi
	done
fi
	
if [ $1 = "-x" ]; then
	
	mkdir -p textXml/ 
	cd Papers
	
	args=("$@")
	var=1
	echo "vos fichiers : "
	
	for i in *.pdf
	do
	echo "$i"
	echo ""	
		if [[ " ${args[@]} " =~ " ${var} " ]]; then
			echo "$i à convertir... "
			fname="${i%.*}"
			echo "</acticle>" >> "../textXml/$fname.xml"
			echo "<preamble>" >> "../textXml/$fname.xml"
			echo $fname >> "../textXml/$fname.xml"
			echo "</preamble>" >> "../textXml/$fname.xml"
			
			echo "<titre>" >> "../textXml/$fname.xml"
			sed -n '1,2p' "../text/$fname.txt" >> "../textXml/$fname.xml"
			echo "</titre>" >> "../textXml/$fname.xml"
			echo "<auteur>" >> "../textXml/$fname.xml"
			cat "../text/$fname.txt" | sed -n '/auteur/,/Introduction/p' | sed -e  's:.*<auteur>::' | sed -e 's:<Introduction>.*::'  >> "../textXml/$fname.xml"
			cat "../text/$fname.txt" | sed -n '/ABSTRACT/,/INTRODUCTION/p' | sed -e  's:.*<ABSTRACT>::' | sed -e 's:<INTRODUCTION>.*::'  >> "../textXml/$fname.xml"
			echo "</auteur>" >> "../textXml/$fname.xml"

			
			
			echo "<abstract>" >> "../textXml/$fname.xml"
			cat "../text/$fname.txt" | sed -n '/Abstract/,/Introduction/p' | sed -e  's:.*<Abstract>::' | sed -e 's:<Introduction>.*::'  >> "../textXml/$fname.xml"
			cat "../text/$fname.txt" | sed -n '/ABSTRACT/,/INTRODUCTION/p' | sed -e  's:.*<ABSTRACT>::' | sed -e 's:<INTRODUCTION>.*::'  >> "../textXml/$fname.xml"
			echo "</abstract>" >> "../textXml/$fname.xml"
			
			echo "<corps>" >> "../textXml/$fname.xml"
			cat "../text/$fname.txt" | sed -n '/Method/,/Conclusion/p' | sed -e  's:.*<Method>::' | sed -e 's:<Conclusion>.*::'  >> "../textXml/$fname.xml"
			cat "../text/$fname.txt" | sed -n '/METHOD/,/CONCLUSION/p' | sed -e  's:.*<METHOD>::' | sed -e 's:<CONCLUSION>.*::'  >> "../textXml/$fname.xml"
			echo "</corps>" >> "../textXml/$fname.xml"
			
			echo "<conclusion>" >> "../textXml/$fname.xml"
			cat "../text/$fname.txt" | sed -n '/conclusion/,/discussion/p' | sed -e  's:.*<conclusion>::' | sed -e 's:<discussion>.*::'  >> "../textXml/$fname.xml"
			cat "../text/$fname.txt" | sed -n '/Conclusions/,/discussion/p' | sed -e  's:.*<Conclusions>::' | sed -e 's:<discussion>.*::'  >> "../textXml/$fname.xml"

			cat "../text/$fname.txt" | sed -n '/CONCLUSION/,/DISCUSSION/p' | sed -e  's:.*<CONCLUSION>::' | sed -e 's:<DISCUSSION>.*::'  >> "../textXml/$fname.xml"
			echo "</conclusion>" >> "../textXml/$fname.xml"
	
			echo "<discussion>" >> "../textXml/$fname.xml"
			cat "../text/$fname.txt" | sed -n '/Acknowledgements/,/References/p' | sed -e  's:.*<Acknowledgements>::' | sed -e 's:<References>.*::'  >> "../textXml/$fname.xml"
			cat "../text/$fname.txt" | sed -n '/Acknowledgements/,/REFERENCES/p' | sed -e  's:.*<Acknowledgements>::' | sed -e 's:<REFERENCES>.*::'  >> "../textXml/$fname.xml"
			echo "</discussion>" >> "../textXml/$fname.xml"
			

			echo "<biblio>" >> "../textXml/$fname.xml"
			cat "../text/$fname.txt" | sed -n '/REFERENCES/,/motNexistPas/p' | sed -e  's:.*<REFERENCES>::' | sed -e 's:<motNexistPas>.*::'  >> "../textXml/$fname.xml"
			cat "../text/$fname.txt" | sed -n '/References/,/motNexistPas/p' | sed -e  's:.*<References>::' | sed -e 's:<motNexistPas>.*::'  >> "../textXml/$fname.xml"
			echo "</biblio>" >> "../textXml/$fname.xml"
			
			echo "</acticle>" >> "../textXml/$fname.xml"
		fi
	var=$((var+1))
	echo "+------------------------------------------------------------------+"
	done

fi
