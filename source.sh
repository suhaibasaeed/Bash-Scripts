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
  # Loop through files in the source directory and print filename
  for filename in source/*
  do # Do these commands in loop
    # Inform user below file is not being copied but others are
    if [ $filename == "source/secretinfo.md" ]
    then
      echo $filename "is not being copied"
    else
      echo $filename "is being copied"
      # Copy the file to the build directory
      cp $filename build/.
    fi
  done

  # List the files in the build directory
  cd build # Change directory first
  echo "The files in build version $version are:"
  ls

else
  echo "Please come back when you are ready"
fi