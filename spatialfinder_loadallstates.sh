#!/bin/zsh

winds=$(yabai -m query --windows --space | jq 'map(select(.app == "Finder"))')

nwinds=$(echo $winds | jq 'length')

echo "Loading state of all Finder windows on this space..."

for i in {0..$((nwinds - 1))}; do
    windid=$(echo $winds | jq ".[$i].id")
    spatialfinder_loadstate.sh $windid
done
