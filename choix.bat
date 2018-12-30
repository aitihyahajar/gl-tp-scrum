if [ $1 = "-t" ]; then
	j=0
	mkdir -p text1/ 
	cd Papers
	for i in *.pdf
	do 
		for (( j=2 ; j<=$#; j++))
			if [[ $j in $@ ]]; then
				fname="${i%.*}"	
				echo le nom de fichier est: $fname >> "../text1/$fname.txt"
				sed -n '1,2p' "../text/$fname.txt" >> "../text1/$fname.txt"
				echo L'abstract de l'auteur est: >> "../text1/$fname.txt"
				cat "../text/$fname.txt" | sed -n '/Abstract/,/Introduction/p' | sed -e  's:.*<Abstract>::' | sed -e 's:<Introduction>.*::'  >> "../text1/$fname.txt"
			fi
		fi	
	done
fi
	
if [ $1 = "-x" ]; then
	
	mkdir -p textXml/ 
	cd Papers
	for i in *.pdf
	do
		for (( j=2 ; j<=$#; j++))
			if [[ $j in $@ ]]; then				
				fname="${i%.*}"
				echo "</acticle>" >> "../textXml/$fname.xml"
				echo "<preamble>" >> "../textXml/$fname.xml"
				echo $fname >> "../textXml/$fname.xml"
				echo "</preamble>" >> "../textXml/$fname.xml"
				
				echo "<titre>" >> "../textXml/$fname.xml"
				sed -n '1,2p' "../text/$fname.txt" >> "../textXml/$fname.xml"
				echo "</titre>" >> "../textXml/$fname.xml"
				
				echo "<abstract>" >> "../textXml/$fname.xml"
				cat "../text/$fname.txt" | sed -n '/Abstract/,/Introduction/p' | sed -e  's:.*<Abstract>::' | sed -e 's:<Introduction>.*::'  >> "../textXml/$fname.xml"
				echo "</abstract>" >> "../textXml/$fname.xml"
				
				echo "<corps>" >> "../textXml/$fname.xml"
				cat "../text/$fname.txt" | sed -n '/II/,/Conclusion/p' | sed -e  's:.*<II>::' | sed -e 's:<Conclusion>.*::'  >> "../textXml/$fname.xml"
				echo "</corps>" >> "../textXml/$fname.xml"
				
				echo "<conclusion>" >> "../textXml/$fname.xml"
				cat "../text/$fname.txt" | sed -n '/conclusion/,/discussion/p' | sed -e  's:.*<conclusion>::' | sed -e 's:<discussion>.*::'  >> "../textXml/$fname.xml"
				echo "</conclusion>" >> "../textXml/$fname.xml"
				
				echo "<biblio>" >> "../textXml/$fname.xml"
				cat "../text/$fname.txt" | sed -n '/REFERENCES/,/motNexistPas/p' | sed -e  's:.*<REFERENCES>::' | sed -e 's:<motNexistPas>.*::'  >> "../textXml/$fname.xml"
				echo "</biblio>" >> "../textXml/$fname.xml"
				
				echo "</acticle>" >> "../textXml/$fname.xml"
			fi	
		fi
	done

fi
