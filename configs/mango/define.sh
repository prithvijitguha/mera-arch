#!/bin/bash

word=${1:-$(wl-copy -o -selection primary 2>/dev/null || wl-paste 2>/dev/null)}

# Check for empty word or special characters
[[ -z "$word" || "$word" =~ [/] ]] && {
  notify-send -h string:bgcolor:#bf616a -t 3000 "Invalid input."
  exit 0
}

# Query the local dictionary
def=$(dict "$word" 2>/dev/null)

# Check for missing definitions
if [[ -z "$def" || "$def" == *"No definitions found"* ]]; then
  notify-send -h string:bgcolor:#bf616a -t 3000 "No definition found for $word."
  exit 0
fi

# Show the dictionary output
notify-send -t 6000 "$word" "$def"
### MORE OPTIONS :)
# Show first definition for each part of speech (thanks @morgengabe1 on youtube)
# def=$(echo "$query" | jq -r '.[0].meanings[] | "\(.partOfSpeech): \(.definitions[0].definition)\n"')

# Show all definitions
# def=$(echo "$query" | jq -r '.[].meanings[] | "\n\(.partOfSpeech). \(.definitions[].definition)"')

# Regex + grep for just definition, if anyone prefers that to jq
# def=$(grep -Po '"definition":"\K(.*?)(?=")' <<< "$query")

# bold=$(tput bold) # Print text bold with echo, for visual clarity
# normal=$(tput sgr0) # Reset text to normal
# echo "${bold}Definition of $word"
# echo "${normal}$def"
