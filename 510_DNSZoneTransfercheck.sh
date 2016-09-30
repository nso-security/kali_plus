#/bin/bash

# only one argument site.com or echo usage and die
if [ -z "$1" ]; then
	echo "*** Sorry, you need to provide the domain name (e.g. site.com) like this $0 <domain name> "
	exit 0
fi
for nameserver in $(host -t ns $1 |cut -d" " -f4);do
	  echo "-----------$nameserver ----------"
	  host -l $1 $nameserver #|grep "has address"
  done
