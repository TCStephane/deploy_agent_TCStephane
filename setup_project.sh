#!/usr/bin/env bash

#taking the name from the user
echo "please enter the factory name:"
read input

#creating the different directories
mkdir -p attendance_tracker_$input attendance_tracker_$input/Helpers attendance_tracker_$input/reports

#copying the different files into their respective directories
cp program_files/attendance_checker.py attendance_tracker_$input
cp program_files/assets.csv attendance_tracker_$input/Helpers/
cp program_files/config.json attendance_tracker_$input/Helpers/
cp program_files/reports.log attendance_tracker_$input/reports/
