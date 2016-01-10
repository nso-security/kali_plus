#!/bin/bash -v
mkdir /opt/NessusParser
echo "You need to manually download Nessus Parser v0.21 (or current)http://www.melcara.com/ and save it to /opt/NessusParser"
pause
cd /opt/NessusParser
unzip *.zip
mv parse_nessus_xml.v21.pl_1/parse_nessus_xml.v21.pl .
chmod 700 parse_nessus_xml.v21.pl
#CPAN requires user interaction
cpan -i XML::TreePP
cpan -i Math::Round
#may take some time
cpan -i Excel::Writer::XLSX
cpan -i Data::Table
#Note Command to run is perl /opt/NessusParser/parse_nessus_xml.v21.pl -f [filename]
cd /opt
