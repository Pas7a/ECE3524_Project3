#!/bin/bash

#limit is used to test if we have enough arguments
limit=2

#Tree function performs recusive search of all underlying folders for files
#nd dirctories
function tree() {
for file in "$1"/*
do
#This if test checks if it is a directory and if its readable
    if [ -d "${file}" ] && [ -r "${file}" ] ; then

#This if test checks if the folder is empty or not.
#If it is empty it will not call tree inside
#It will then write all directories to output.txt
      if [ "$(ls -A ${file})" ]; then
      echo "<h4> ${file} </h4>" >> output.txt
      tree "${file}"
    else
      echo "<h4> ${file} </h4>">> output.txt
    fi
#If it is a readble file, then we will write it to output.txt
    else
      if [ -r "${file}" ]; then
        echo "<p> &emsp;${file} </p>">> output.txt

      fi

    fi
done


}

#This if then test checks to make sure we have the right number of argyments
if [ $# == $limit ]
then
  #echo "we have 2 arguments"
  tree "$1"

  #Once tree is complete - we convert to html using argument 2 as file name
  pandoc output.txt -o $2
else
    echo "We need "$limit " arguments."
    echo "You have" $# " arguments "
    echo "Sorry! You do not have the right number of arguments :("

fi
