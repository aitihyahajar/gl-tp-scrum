if [ $1 = "-t" ]; then

	value=$(./convertPreci.bat)
	echo $value
fi
	
if [ $1 = "-x" ]; then
	
	value=$(./convertXml.bat)
	echo $value

fi
