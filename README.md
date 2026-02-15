Automated Project Bootstrapping Script
Overview
Shell script that automates the setup of a Student Attendance Tracker project with signal handling, dynamic configuration, and environment validation.
How to Run

./setup_project.sh

Follow the prompts:

Enter a project name
Choose whether to customize attendance thresholds (y/n)
If yes, enter numeric values for warning and failure thresholds

Project Structure Created
attendance_tracker_{name}/
├── attendance_checker.py
├── Helpers/
│   ├── assets.csv
│   └── config.json
└── reports/
    └── reports.log
