######################################
# Example startup script.
#
# Activate space 1, and open iTerm2.
# Tell Kwm to restore bsp-layout used for development.
#
# Start rtorrent in the focused iTerm window, and
# open 4new iTerm windows and have them run some
# application.
#
# Switch to space 2 and open Firefox.
# Switch to space 3 and start Skype.

# /usr/local/bin/kwmc display -f id 7048
#
# sleep 0.5
# open -na /Applications/Google\ Chrome.app
#
# sleep 1

# /usr/local/bin/kwmc space -f id 1
# sleep 0.5

# /usr/local/bin/kwmc press prefix-return
open -na /Applications/iTerm.app
sleep 0.5
# /usr/local/bin/kwmc tree restore dev3
/usr/local/bin/kwmc write weechat
# /usr/local/bin/kwmc write rainbowstream
/usr/local/bin/kwmc press -return

sleep 1
/usr/local/bin/kwmc press cmd-n
/usr/local/bin/kwmc write mutt
/usr/local/bin/kwmc press -return

sleep 0.5
/usr/local/bin/kwmc press cmd-n

sleep 0.5
/usr/local/bin/kwmc press ctrl-h
/usr/local/bin/kwmc press cmd-n
/usr/local/bin/kwmc write sncli
/usr/local/bin/kwmc press -return

sleep 0.5
/usr/local/bin/kwmc press cmd-n
/usr/local/bin/kwmc write rtv
/usr/local/bin/kwmc press -return

sleep 0.5
/usr/local/bin/kwmc press ctrl-tab

sleep 0.5
/usr/local/bin/kwmc press ctrl-k
/usr/local/bin/kwmc press ctrl-k

sleep 0.5
/usr/local/bin/kwmc press cmd-n
/usr/local/bin/kwmc write ranger
/usr/local/bin/kwmc press -return

sleep 0.5
/usr/local/bin/kwmc press ctrl-tab

sleep 0.5
/usr/local/bin/kwmc press ctrl-l

sleep 0.5
/usr/local/bin/kwmc press cmd-n
/usr/local/bin/kwmc write rainbowstream
/usr/local/bin/kwmc press -return

sleep 0.5
/usr/local/bin/kwmc press ctrl-tab

sleep 0.5
/usr/local/bin/kwmc press ctrl-j

# sleep 1
# # /usr/local/bin/kwmc press ctrl-2
#
# /usr/local/bin/kwmc space -s id 2
#
# sleep 0.5
# open -na /Applications/Google\ Chrome.app

# sleep 1
# /usr/local/bin/kwmc space -s id 3
# open -na /Applications/Microsoft Excel.app
