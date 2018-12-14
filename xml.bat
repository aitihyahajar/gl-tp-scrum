mkdir -p textXml/ 
cd Papers
for i in *.pdf
do
	fname="${i%.*}"
	echo "<acticle>"  >> "../textXml/$fname.xml"
	echo "<titre>" >> "../textXml/$fname.xml"
	echo $fname >> "../textXml/$fname.xml"
	echo "</titre>" >> "../textXml/$fname.xml"
	sed -n '1,2p' "../textXml/$fname.txt" >> "../textXml/$fname.xml"
	echo "<abstract>" >> "../textXml/$fname.xml"
	
	cat "../text/$fname.txt" | sed -n '/Abstract/,/Introduction/p' | sed -e  's:.*<Abstract>::' | sed -e 's:<Introduction>.*::'  >> "../textXml/$fname.xml"
	
	echo "</abstract>" >> "../textXml/$fname.xml"
	echo "</acticle>" >> "../textXml/$fname.xml"
	
done
