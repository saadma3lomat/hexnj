#!/bin/bash
gr="\e[90m" end="\e[0m"
#*="\x2a" ?="\x3f" ' '="\x20"
clear
ban () {
echo -e "$gr
 _   _                _   _  _ 
| | | | _____  __    | \ | |(_)
| |_| |/ _ \ \/ /____|  \| || |
|  _  |  __/>  <_____| |\  || |
|_| |_|\___/_/\_\    |_| \_|/ |
               $end  @Saad-Nj$gr |__/ $end
"
}
ban
read -p "text : " ask
ask=`sed 's/ /�/g' <<< $ask`
as=`echo "$ask"|grep -o .`
for ic in $as ;do
	if [ `printf *` == $ic ];then g+="\x2a"
		continue
	elif [ $ic == � ];then g+="\x20"
		continue
	elif [ $ic == ? ];then g+="\x3f"
		continue
	else	
		for i in {0..255};do 
			a="\\\x%02x $i" b+=(`printf $a`) c=`printf $a`
			if [ `printf $a` == "\x2a" -o `printf $a` == "\x3f" ];then continue
			fi
			if [[ $ic == $(echo -e $c) ]] &> /dev/null ;then g+=`printf $a`
				break
			fi
		done
	fi
done
clear
ban
echo -e "dec = ${g[*]}\n"
echo "hex = ${g[*]}"

mkdir fold &> /dev/null 
cd fold
cat > 'test.sh' <<- BASH
#!/bin/bash

hex="${g[*]}"
dec=\`echo -e \$hex\`
\$dec
BASH
cat > 'test.py' <<- PYTHON
#!/usr/bin/python

import os
hex="${g[*]}"
os.system(hex)
PYTHON
cat > 'test.php' <<- PHP
#!/usr/bin/php

<?php 
\$hex = "${g[*]}" ; 
system("\$hex") ;
?>
PHP
