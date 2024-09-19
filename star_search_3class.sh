#!/bin/bash

#Simple script to search star files for similar occurences and write those particles to new star files
#Written by MM 10-10-2022

#First, find particle string searching for
#Note, this initial run is weird because had to do some csparc2star workarounds to write particle set, so will need to change awk in future
#line is number 12

#Insert name of input files here
instar=J280_particles.star

#Next, echo out particle names 
awk '{ print $12 }' ${instar} > parts.star
infile=parts.star


#Then, loop through star files to search for occurences
for i in $(cat ${infile})
do
	numbuh=$(cat *open* | grep -c ${i})
        numbuh2=$(cat *im* | grep -c ${i})
	
	if [[ "$numbuh" == 0 ]] &&  [[ "$numbuh2" == 0 ]]; then
		grep ${i} ${instar} >> 0_op_0_im.star
	elif [[ "$numbuh" == 1 ]] &&  [[ "$numbuh2" == 0 ]]; then
		grep ${i} ${instar} >> 1_op_0_im.star
	elif [[ "$numbuh" == 2 ]] &&  [[ "$numbuh2" == 0 ]]; then
		grep ${i} ${instar} >> 2_op_0_im.star
	elif [[ "$numbuh" == 3 ]] &&  [[ "$numbuh2" == 0 ]]; then
		grep ${i} ${instar} >> 3_op_0_im.star
	elif [[ "$numbuh" == 0 ]] &&  [[ "$numbuh2" == 1 ]]; then
		grep ${i} ${instar} >> 0_op_1_im.star
	elif [[ "$numbuh" == 0 ]] &&  [[ "$numbuh2" == 2 ]]; then
		grep ${i} ${instar} >> 0_op_2_im.star
	elif [[ "$numbuh" == 0 ]] &&  [[ "$numbuh2" == 3 ]]; then
		grep ${i} ${instar} >> 0_op_3_im.star
	elif [[ "$numbuh" == 1 ]] &&  [[ "$numbuh2" == 1 ]]; then
		grep ${i} ${instar} >> 1_op_1_im.star
	elif [[ "$numbuh" == 1 ]] &&  [[ "$numbuh2" == 2 ]]; then
		grep ${i} ${instar} >> 1_op_2_im.star
	elif [[ "$numbuh" == 1 ]] &&  [[ "$numbuh2" == 3 ]]; then
		grep ${i} ${instar} >> 1_op_3_im.star
	elif [[ "$numbuh" == 2 ]] &&  [[ "$numbuh2" == 1 ]]; then
		grep ${i} ${instar} >> 2_op_1_im.star
	elif [[ "$numbuh" == 2 ]] &&  [[ "$numbuh2" == 2 ]]; then
		grep ${i} ${instar} >> 2_op_2_im.star
	elif [[ "$numbuh" == 2 ]] &&  [[ "$numbuh2" == 3 ]]; then
		grep ${i} ${instar} >> 2_op_3_im.star
	elif [[ "$numbuh" == 3 ]] &&  [[ "$numbuh2" == 1 ]]; then
		grep ${i} ${instar} >> 3_op_1_im.star
	elif [[ "$numbuh" == 3 ]] &&  [[ "$numbuh2" == 2 ]]; then
		grep ${i} ${instar} >> 3_op_2_im.star
	elif [[ "$numbuh" == 3 ]] &&  [[ "$numbuh2" == 3 ]]; then
		grep ${i} ${instar} >> 3_op_3_im.star
	else
		grep ${i} ${instar} >> i_forgot_a_class_whoops.star
	fi
done

#Last, remove parts.star
rm parts.star

