# Spatial Finder for macOS
This project contains scripts that once installed, make the macOS Finder remember every folder's size and position on the screen and restores it when you revisit said folder. Only folders inside the Documents folder are affected.

This is inspired by the following article:  https://arstechnica.com/gadgets/2003/04/finder/ .

## Requirements
[yabai](https://github.com/koekeishiya/yabai)

## Installation
Link all 5 scripts to a place in the path and execute `install.sh` to install the `yabai` rules.

For example:
```sudo ln -s /Users/...full-path-here.../spatialfinder_loadallstates.sh /usr/local/bin/```

## How does it work
Every time a Finder window is resized or moved, its new size and position are stored in a `.framedata.json` file in that folder. When a folder is opened, this file is used to restore its state.

## Known issues
When two folders of the same name exist, the state is not saved or restored.
