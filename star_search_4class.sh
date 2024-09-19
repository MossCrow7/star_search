#!/bin/bash

#Simple script to search star files for similar occurences and write those particles to new star files
#Written by MM 10-10-2021

#First, find particle string searching for
#Note, this initial run is weird because had to do some csparc2star workarounds to write particle set, so will need to change awk in future
#line is number 12

#Insert name of input files here
instar=J91_out.star

#Next, echo out particle names 
awk '{ print $12 }' ${instar} > parts.star
infile=parts.star


#Then, loop through star files to search for occurences
for i in $(cat ${infile})
do
	numbuh=$(cat *open.star* | grep -c ${i})
        numbuh2=$(cat *im.star* | grep -c ${i})
        numbuh3=$(cat *im2.star* | grep -c ${i})
	grep ${i} ${instar} >> ${numbuh}_op_${numbuh2}_im_${numbuh3}_im2.star
	
done

#Last, remove parts.star
rm parts.star

