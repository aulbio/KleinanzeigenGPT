#!/bin/bash

cd ~/Desktop/sell\(\)

    directory_name=$1

    # Create the directory
    mkdir "$directory_name"
    if [[ $? -eq 0 ]]; then
        echo "Directory '$directory_name' created successfully."
    else
        echo "Error creating directory '$directory_name'."
        return 1
    fi

    # Create a text file inside the directory
    file_path="$directory_name/$directory_name.txt"
echo "Titel:

Preis:

Beschreibung:" > "$file_path"
    if [[ $? -eq 0 ]]; then
        echo "File '$file_path' created successfully."
    else
        echo "Error creating file '$file_path'."
        return 1
    fi
