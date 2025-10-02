#!/bin/zsh

yabai -m signal --add event=window_moved app="Finder" action="spatialfinder_savestate.sh \$YABAI_WINDOW_ID"

yabai -m signal --add event=window_resized app="Finder" action="spatialfinder_savestate.sh \$YABAI_WINDOW_ID"

yabai -m signal --add event=window_created app="Finder" action="spatialfinder_loadstate.sh \$YABAI_WINDOW_ID"

yabai -m signal --add event=window_title_changed app="Finder" action="spatialfinder_loadstate.sh \$YABAI_WINDOW_ID"

echo "Installed 4 rules!"

echo "See 'yabai -m signal --list'"

echo "To uninstall, see 'yabai -m signal --remove'"
