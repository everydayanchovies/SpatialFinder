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

statefile=$(echo "$folder/.framedata.json")
[[ -f "$statefile" ]] || { exit 1 }

state=$(cat $statefile)

x=$(echo $state | jq ".x")
y=$(echo $state | jq ".y")
w=$(echo $state | jq ".w")
h=$(echo $state | jq ".h")

yabai -m window $windowid --move abs:$x:$y
yabai -m window $windowid --resize abs:$w:$h

echo "State loaded!"
