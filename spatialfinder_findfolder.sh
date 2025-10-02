#!/bin/zsh

searchin="Documents"

foldername=$(echo "$1" | sed 's/ — Local$//')

if [[ "$foldername" == "$searchin" ]]; then
    echo $(readlink --canonicalize ~/$searchin)
else
    folders=()

    mdfind -onlyin $(readlink --canonicalize ~/$searchin) "kMDItemDisplayName == '$foldername' && (kMDItemKind == 'Folder')" | while IFS= read -r line; do
        folders+=("$line")
    done

    if [[ ${#folders[@]} -eq 1 ]]; then
        echo "${folders[1]}"
    else
        exit 1
    fi
fi
