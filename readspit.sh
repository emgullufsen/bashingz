#!/usr/bin/bash

filey=test_bb2.txt
while read xx; do
	var1=$(echo $xx | cut -f1 -d$'\t')
	echo $var1
	#at=`echo ${xx} | cut -f1 -d-`
	#ats=`echo ${xx} | cut -f2 -d-`
	#printf "%s: %s\n" $at $xx
done <$filey
