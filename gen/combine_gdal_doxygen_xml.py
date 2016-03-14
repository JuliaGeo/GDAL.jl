# combines alls xmls
# place in directory with all xmls created by doxygen
# this is by default gdal/xml/

# done previously by running combine.xslt
# however the index.xml doesn't seem up to date
# with the contents of gdal/xml/

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

# delete everything not under keep_elements
# this information is currently not used anyway
# this reduces the filesize from ~80MB to ~15MB
# LibExpat.jl froze when parsing the ~80MB version

keep_elements = ('sectiondef', 'briefdescription', 'detaileddescription')

for elem in tree.xpath('/doxygen/compounddef'):
    for subelem in elem:
        if subelem.tag not in keep_elements:
            elem.remove(subelem)

tree.write(outxml)
