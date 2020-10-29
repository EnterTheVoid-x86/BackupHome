#!/bin/bash

# This bash script is used to backup a user's directory they wish to a specified directory or drive.

if [[ "$1" = "--help" || "$1" = "-h" ]]; then
        printf "To use this program, just specify a directory to backup /home/$USER/ to."
        exit
fi

testingbranch=1

echo "Welcome to BACKDv2."
echo "Which directory do you want to backup?"
read dirchoice
echo "Where do you want to backup $USER's $input directory?"
read choicefordirback

user=$(whoami)
input=$dirchoice
output=/$choice/${user}_directory_$(date +%Y-%m-%d_%H%M%S).tar.gz
file=/$choice/${user}_directory_$(date +%Y-%m-%d_%H%M%S).tar.gz

echo "Starting backup as $user..."

if [ $testingbranch = 1 ]
then
        echo "Packing dir into file as $file..."

# The function total_files reports a total number of files for a given directory. 
function total_files {
        find $1 -type f | wc -l
}

# The function total_directories reports a total number of directories
# for a given directory. 
function total_directories {
        find $1 -type d | wc -l
}

tar -czf $output $input 2> /dev/null

echo -n "Files to be included:"
total_files $input
echo -n "Directories to be included:"
total_directories $input

echo "Backup of $input completed!"

echo "Details about the output backup file:"
ls -l $output
file $output
# There's nothing more annoying than broken, non running code, folks! -Sonic
else
    # The function total_files reports a total number of files for a given directory. 
function total_files {
        find $1 -type f | wc -l
}

# The function total_directories reports a total number of directories
# for a given directory. 
function total_directories {
        find $1 -type d | wc -l
}

tar -czf $output $input 2> /dev/null

echo -n "Files to be included:"
total_files $input
echo -n "Directories to be included:"
total_directories $input

echo "Backup of $input completed!"

echo "Details about the output backup file:"
ls -l $output
fi
