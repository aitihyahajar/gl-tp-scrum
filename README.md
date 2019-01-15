# gl-tp-scrum

#Version 3

Dans cette version (partie XML et partie TXT) on réaliser un fichier (choix.bat)

+xml.bat:

-Ce fichier fait le fonctionnement des deux fichiers précédent (bach.bat & xml.bat) sauf que y a une amélioration dans la coté du convertation au XML.

-Ce fichier permet de de faire le choix de convertation (XML ou TXT). Aprés la convertation ce fichier créer un dossier text1 pour les fichiers TXT qui sont convertés et un autre dossier textXml pour les fichiers XML qui sont convertés.

-Pour convertir un fichier pdf  vous pouvez choisir votre fichier pdf en saisissant le numero ce fichier dans le dossier (numero selon l'ordre du pdf dans le dossier) et choisir le type de la sortie XML ou TXT donc la commande sera de cette façon:

gl-tp-scrum$ ./choix.bat -t 1 2 : cette commande convetit le pdf 1 et 2 en Format text.
gl-tp-scrum$ ./choix.bat -x 1 2 : cette commande convetit le pdf 1 et 2 en Format XML.

