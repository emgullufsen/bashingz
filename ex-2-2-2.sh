#!/bin/bash
# write a script that shows time and date, lists all logged-in users, and
# gives the system uptime. then saves all this to a logfile

filey=/tmp/ex2-2-2-info.txt
datey="Date is: $(date)"
logged_intro="Currently logged in users are:" 
echo $datey | tee $filey
echo $logged_intro | tee -a $filey
who | tee -a $filey
echo "Current Uptime:"
uptime | tee -a $filey
