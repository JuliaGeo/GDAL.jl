# combines alls xmls
# place in directory with all xmls created by doxygen
# this is by default gdal/xml/

# done previously by running combine.xslt
# however the index.xml doesn't seem up to date
# with the contents of gdal/xml/

# after this script, doxygen.xml will be around 80 MB
# I manually deleted everything not under
# sectiondef, briefdescription, and detaileddescription
# this reduces the filesize to 15 MB
# LibExpat.jl froze when parsing the 80 MB version

from lxml import etree
from glob import glob

outxml = 'doxygen.xml'

xmls = glob('*.xml')

if outxml in xmls:
    xmls.remove(outxml)

xmls.remove('index.xml')

firstfile = xmls[0]
tree = etree.parse(firstfile)
root = tree.getroot()

for xml in xmls[1:]:
    addtree = etree.parse(xml)
    addroot = addtree.getroot()
    for child in addroot:
        root.append(child)

tree.write(outxml)
