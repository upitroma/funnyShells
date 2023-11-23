#!/bin/bash

# Wordle API URL
API_URL="https://www.nytimes.com/svc/wordle/v2/$(date +'%Y-%m-%d').json"

# Fetch Wordle data
wordle_data=$(curl -s "$API_URL")

# Extract the target word
target_word=$(echo "$wordle_data" | jq -r '.solution')

while true; do
	read -p "For added security, please enter today's Wordle answer (lowercase): " user_guess

    # Check if the guess is correct
    if [ "$user_guess" == "$target_word" ]; then
        break
    else
	echo "Wrong! Try again!"
    fi
done

# Grant shell access
echo "Access granted!"
/bin/bash
