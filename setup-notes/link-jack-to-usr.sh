#!/bin/bash

# The modep installer installs jack to '/usr/local/', but some programs assume
# it's in '/usr/'.  The following command puts a symlink for every jack
# bin or lib or include into the corresponding spot in '/usr/'

for i in $(find /usr/local/{bin/,include/,lib/} -iname '*jack*') ; do ln -s $i $(echo $i | sed 's/\/usr\/local/\/usr/g') ; done
