#!/bin/zsh

windowid=$1

# ensure window id
[[ -z "$windowid" ]] && { exit 1 }

windobj=$(yabai -m query --windows --window $windowid)

foldername=$(echo $windobj | jq ".title")
foldername=${foldername:1:-1} # remove "

# ensure folder name not empty
[[ -z "$foldername" ]] && { exit 1 }

folder=$(spatialfinder_findfolder.sh "$foldername")

# ensure unique match
[[ -z "$folder" ]] && { exit 1 }

# save state to file
echo $windobj | jq '.frame' > "$folder/.framedata.json"

echo "State saved!"
