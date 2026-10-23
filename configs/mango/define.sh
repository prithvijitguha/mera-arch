#!/bin/bash

word=${1:-$(wl-copy -o -selection primary 2>/dev/null || wl-paste 2>/dev/null)}

if [[ -z "$word" || "$word" =~ [/] ]]; then
  notify-send -h string:bgcolor:#bf616a -t 3000 "Invalid input."
  exit 0
fi

# Query the dictionary
def=$(dict "$word" --formatted 2>/dev/null)

if [[ -z "$def" || "$def" == *"No definitions found"* ]]; then
  notify-send -h string:bgcolor:#bf616a -t 3000
  "No definition found for $word"
  exit 0
fi

# Remove server metadata and clean up the output
formatted=$(printf '%s\n' "$def" | awk '
  /^[[:space:]]*dict\.org[[:space:]]/ { next }
  /^[0-9]+ definitions found/ { next }
  /^[[:space:]]*$/ {
    if (content) blank = 1
    next
  }
  {
    sub(/^[[:space:]]+/, "")
    if (blank && content) print ""
    print
    content = 1
    blank = 0
  }
')

# Display the formatted definition
notify-send -t 12000 "$word" "$formatted"
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
