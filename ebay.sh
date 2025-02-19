#!/bin/bash

# Directory where the new directory is created
cd ~/path/to/directory || { echo "Failed to change directory. Please check the path."; exit 1; }

# Set directory name to the first argument
directory_name=$1
comment=$2

# Check if directory name is provided
if [[ -z "$directory_name" ]]; then
    echo "Error: No directory name provided."
    exit 1
fi

# Create the directory
mkdir "$directory_name"
if [[ $? -eq 0 ]]; then #if exit status = 0 -> succes, then
    echo "Directory '$directory_name' created successfully."
else
    echo "Error creating directory '$directory_name'."
    exit 1
fi

# Create a text file inside the directory
file_path="$directory_name/$directory_name.txt"
echo "Titel:'$directory_name'

Beschreibung:" > "$file_path"
if [[ $? -eq 0 ]]; then
    echo "File '$file_path' created successfully."
else
    echo "Error creating file '$file_path'."
    exit 1
fi

# Generate description using OpenAI API
API_KEY="PLEASE_INSERT_YOUR_API_KEY_HERE" # Replace with your API key
MODEL="gpt-4o" # change to use another model
PROMPT="Sei mein persönlicher Assistent. Ich möchte einen Artikel auf Kleinanzeigen verkaufen. Erstelle bitte eine kurze Beschreibung für den Artikel namens '$directory_name' auf Kleinanzeigen. Die Beschreibung sollte für potenzielle Käufer ansprechend wirken, ganz normal nicht übertrieben klingen und die üblichen Rahmenbedingungen eines Privatverkaufs berücksichtigen. Mein Kommentar zu dem Artikel lautet:'$comment'. Bitte verwende kein Markup oder Emojis. Lass am Ende zwei Zeilen frei und schreibe dann 'Preis: ' und schätze einen Preis." # this is for german descriptions, but can be translated to other languages or can be changed for your needs

# Call OpenAI API and store the response
description=$(curl -s https://api.openai.com/v1/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $API_KEY" \
    -d '{
        "model": "'"$MODEL"'",
        "messages": [{"role": "system", "content": "You are a helpful assistant that writes engaging sales descriptions."},
                     {"role": "user", "content": "'"$PROMPT"'"}],
        "max_tokens": 500
    }' | jq -r '.choices[0].message.content')


# Check if API call was successful
if [[ -z "$description" || "$description" == "null" ]]; then
    echo "Error: Failed to generate description."
    exit 1
fi

# Append generated description to the file
echo -e "$description" >> "$file_path"
echo "Generated description added to '$file_path'."
echo "$description"


