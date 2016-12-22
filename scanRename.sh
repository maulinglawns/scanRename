#!/bin/bash

# A script that removes the automatically added numbers by
# Epson scanner software: a three digit number preceding the extension (*001.jpg)
#
# Written because it is extrememly annoying to have to delete all
# of those using 'point-and-click' + 'rename' in a GUI.

# For displaying text in bold
bold=$(tput bold)
normal=$(tput sgr0)

# Usage examples and help
helpText="${bold}Usage: $0 [-h] [path]${normal}
If no [path] is passed as argument. \$HOME/Desktop/scans will be used

${bold}Summary:${normal}
This program deletes the autumatically added numbers that are added to
the filenames by Epson scanner software.

${bold}Examples:${normal}
$0 /home/images/scandir
Will use the directory /home/images/scandir to process images
$0 -h
Show this help"

# Our regex patterns:
fileName="([0-9A-Öa-ö ].*)"
extensions="(\.tif|\.tiff|\.jpg|\.png)"
# Complete regex:
regex="$fileName[0-9]{3}$extensions"

nrOfImages=0

# Basic error handling:
if [[ $# > 1 ]]; then
    echo "Too many arguments. See $0 -h for usage"
    exit 1
elif [[ $# == 1 && $1 == "-h" ]]; then
    echo "$helpText"
    exit 0
elif [[ $# == 1 && $1 =~ ^- && $1 != "-h" ]]; then
    echo "Unknown option $1. See $0 -h for usage."
    exit 2
elif [[ $# == 1 && ! -r $1 ]]; then
    echo "The directory $1 does not exist or is not readable."
    exit 3
fi


# Where are the images?
# If no argument is passed to script, then use hardcoded value.
if [[ $# == 0 ]]; then
    scanDir=$HOME/Desktop/scans
elif [[ $# == 1 && -r $1 ]]; then
    scanDir=$1
fi

# Change into directory specified above
if [[ -r $scanDir ]]; then
    cd $scanDir
else
    echo "The directory $scanDir does not exist or is not readable!"
    exit 4
fi

# Loop directory for images
for img in *; do
    if [[ "$img" =~ $regex ]]; then
        ((nrOfImages++))
        newName=$(echo "$img" | sed -E "s/^$regex/\1\2/g")
        echo "$img -> $newName"
        mv "$img" "$newName"
    fi
done 

if (($nrOfImages < 1)); then
    echo "No images processed."
    exit 0
else
    echo "$nrOfImages image(s) processed."
    exit 0
fi

