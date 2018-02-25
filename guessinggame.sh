#!/usr/bin/env bash
termwidth="$(tput cols)"
printf '\n';printf '%*s\n' "$termwidth" '' | tr ' ' =

echo "This program dares you to guess how many files and folders are in the current directory (including hidden files). If you are too afraid to guess, you can bravely retreat by pressing 'Control' + 'C'. Otherwise, arm yourself and press 'Enter'." | fold -sw "$termwidth" || true

printf '%*s\n' "$termwidth" '' | tr ' ' =;printf '\n'
read -p ""

function get_file_num {
	echo $(($(\ls -afq | wc -l)-2))
}
file_num="$(get_file_num)"
echo "How many files are in the current directory?"

while [[ true ]]
do
	read response
	if ! [[ $response =~ ^[0-9]+$ ]]
	then
		echo "Are you drunk? That is not a number. Try again."
		continue
	elif [[ $response -eq $file_num+1 || response -eq $file_num-1 ]]
	then
		encouragement="But you are really close."
	fi
	if [[ $response -gt $file_num ]]
	then
		echo "You are aiming too high. It is lower than that. $encouragement"
	elif [[ $response -lt $file_num ]]
	then
		echo "Not quite. There are more files than that. $encouragement"
	elif [[ $response -eq $file_num ]]
	then
		echo "You are correct! Have a beer on me!"
		exit
	fi
	encouragement=""
	echo "Guess again."
done
