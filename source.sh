#!/bin/bash

echo "Hello mate this is a bash script"
# Read in first line of md file into firstline var
firstline=$(head -n1 source/changelog.md)

# Extract version no by splitting string read in
read -a splitfirstline <<< $firstline
# Version is 2nd element in the list
version=${splitfirstline[1]}
# Print version to console
echo "You are building version"  $version

# Give user chance to exit the script
echo "Would you like to continue the script?"
# Put users option into versioncontinue variable
read -p "1 = yes & 0 = no: " versioncontinue
# Print confirmation to console depending on user input
if [ $versioncontinue == 1 ]
then
  echo "OK - continuing script"
else
  echo "Please come back when you are ready"
fi