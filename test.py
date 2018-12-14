from cStringIO import StringIO
from pdfminer.pdfinterp import PDFResourceManager, PDFPageInterpreter
from pdfminer.converter import TextConverter
from pdfminer.layout import LAParams
from pdfminer.pdfpage import PDFPage
import os
import sys, getopt
os.
def convert(fname, pages=None):
    if not pages:
        pagenums = set()
    else:
        pagenums = set(pages)

    output = StringIO()
    manager = PDFResourceManager()
    converter = TextConverter(manager, output, laparams=LAParams())
    interpreter = PDFPageInterpreter(manager, converter)
    
    infile = file(fname, 'rb')
    for page in PDFPage.get_pages(infile, pagenums):
        interpreter.process_page(page)
    infile.close()
    converter.close()
    text = output.getvalue()
    output.close
    return text
def convertMultiple(pdfDir, txtDir):
    if pdfDir == "": pdfDir = os.getcwd() + "\\" 
    for pdf in os.listdir(pdfDir): 
        fileExtension = pdf.split(".")[-1]
        if fileExtension == "pdf":
            pdfFilename = pdfDir + pdf
            text = convert(pdfFilename) 
            textFilename = txtDir +os.path.splitext(pdf)[0]  + ".txt"
            textFile = open(textFilename, "w")
            textFile.write(text)
pdfDir = "/home/nas02a/etudiants/inf/uapv1900407/gl_projet/gl-tp-scrum/Papers/"
txtDir = "/home/nas02a/etudiants/inf/uapv1900407/gl_projet/gl-tp-scrum/text/"
convertMultiple(pdfDir, txtDir)

