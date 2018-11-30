import os
import subprocess

input1 = '/home/nas02a/etudiants/inf/uapv1900315/Bureau/gl-tp-scrum/py/Lin_2004_Rouge.pdf'
output = '/home/nas02a/etudiants/inf/uapv1900315/Bureau/gl-tp-scrum/py/Me.txt'

os.system(("pdftotext -l 2 %s %s") %( input1, output))
