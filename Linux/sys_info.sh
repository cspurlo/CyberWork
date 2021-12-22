#!/usr/bin/env bash

if [ ! -d $HOME/research ]
then
mkdir $HOME/research
fi

output=$HOME/research/sys_info.txt
echo "A Quick System Audit Script" >> $output
date >> $output
echo "" >> $output
echo "Machine Type Info:" >> $output
echo -e "$MACHTYPE \n" >> $output
echo -e "Uname info: $(uname -a) \n" >> $output
echo -e "IP Info:" >> $output


files=(
'/etc/passwd'
'/etc/shadow'
)

echo -e "\nThe permissions for sensitive /etc files: \n" >> $output
for file in ${files[@]}
do
ls -l $file >> $output
done

