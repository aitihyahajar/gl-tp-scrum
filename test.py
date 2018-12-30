import os ###################################################
import re # Display debug information about compiled expression.

def DirectoryCreator() :
			
					
					# get argument formm command in a list
					listPdf = os.listdir(str(sys.argv)) 
					
					#curr  path 
					path1 = os.path.dirname(os.path.abspath(__file__))
					for n in listPdf :	
							# remove already exist
						  if n.endswith(".txt"):
							  os.remove(os.path.join(path1, n))	  
							  
						  if n.endswith(".pdf"):
							  var2 = os.path.splitext(os.path.basename(n))[0]
							  var1= n.replace(' ', '_')
							  
							  os.rename (n , var1)
							  cmd=  'pdftotext ' + var1  + ' ' + var2 +'.txt'
							  os.system( cmd )
			
def FileCreator():
		listPdf = os.listdir('.')
		# our path
		path2 = os.path.dirname(os.path.abspath(__file__))
		# create..............
		for n in listPdf :
						os.mkdir(path2+"/" + os.path.splitext(os.path.basename(n))[0])
					
# main or to test function Q	