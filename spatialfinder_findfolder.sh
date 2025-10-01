#!/bin/zsh

folders=()

mdfind -onlyin ~/Documents "kMDItemDisplayName == '$1' && (kMDItemKind == 'Folder')" | while IFS= read -r line; do
    folders+=("$line")
done

if [[ ${#folders[@]} -eq 1 ]]; then
    echo "${folders[1]}"
else
    exit 1
fi
