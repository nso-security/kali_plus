#!/bin/bash
nmap -n -Pn -A -iL IPList.txt  -oA ./nmapresults/[CLIENT]-[PROJECT]-NmapScan

#-n says don't resolve DNS
#-Pn says don't depend on ping Sweep
#-A says to enable OS and version detection, script scanning, and traceroute;
#no need to put extension on the filename the -A will genreate them all
# add -T polite  (or sneaky) to slow the scan down
