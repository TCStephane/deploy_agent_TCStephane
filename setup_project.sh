#!/usr/bin/env bash

#taking the name from the user
echo "please enter the factory name:"
read input

project_dir=attendance_tracker_$input
#creating the different directories
mkdir -p $project_dir $project_dir/Helpers $project_dir/reports

#copying the different files into their respective directories
cp program_files/attendance_checker.py $project_dir
cp program_files/assets.csv $project_dir/Helpers/
cp program_files/config.json $project_dir/Helpers/
cp program_files/reports.log $project_dir/reports/

#asking if they want to change the numbers:
echo "Do you want to change the attendance threshold? (y/n)"
read attend

if ["$attend" == "y"] || ["$attend" == "Y"]; then
	echo "Enter Warning threshold:"
	read warning

	echo "Enter failure threshold:"
	read fail

	#changing each value using sed
	fi
