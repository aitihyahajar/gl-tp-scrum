mkdir -p textXml/ 
cd Papers
for i in *.pdf
do
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
	
done
