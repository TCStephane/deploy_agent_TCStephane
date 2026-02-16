#!/usr/bin/env bash

#Implimenting the signal trap

cleanup() {
    echo "Process interrupted. Cleaning up..."
    
    if [[ -d "$project_dir" ]]; then
	mkdir -p archives

        mv "$project_dir" "archives/${project_dir}_archive"
        echo "Project archived as archives/${project_dir}_archive"
    else
        echo "No project directory to archive"
    fi
    
    exit 1
}
trap cleanup SIGINT

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

if [[ "$attend" == "y" ]] || [[ "$attend" == "Y" ]]; then
	echo "Enter Warning threshold:"
	read warning

	if ! [[ "$warning" =~ ^[0-9]+$ ]]; then
        	echo "Invalid input. Using default value (75)."
        	warning=75
    	fi

	echo "Enter failure threshold:"
	read fail

	if ! [[ "$fail" =~ ^[0-9]+$ ]]; then
        	echo "Invalid input. Using default value (50)."
        	fail=50
    	fi

	#changing each value using sed
	#sed syntax: sed -i "s/OLD/NEW/ file_name
	sed -i "s/\"warning_threshold\": [0-9]*/\"warning_threshold\": $warning/" "$project_dir/Helpers/config.json"
	sed -i "s/\"failure_threshold\": [0-9]*/\"failure_threshold\": $fail/" "$project_dir/Helpers/config.json"

fi

echo "Verifying if python 3 is installed"

python3 --version
if [ $? -eq 0 ]; then
	echo "Python3 is installed"
else
	python --version
	if [ $? -eq 0 i]; then
		echo "Python is here but check if it is python 3."
	else
		echo "Warning: Python3 is not installed"
	fi
fi

echo "Verifying if the directory stucture is okay"

if [[ -f "$project_dir/attendance_checker.py" ]] && \
   [[ -f "$project_dir/Helpers/assets.csv" ]] && \
   [[ -f "$project_dir/Helpers/config.json" ]] && \
   [[ -f "$project_dir/reports/reports.log" ]]; then
    echo "All files are in here"
    echo "Directory structure is good"
else
    echo "Warning: Some files may be missing"
fi
