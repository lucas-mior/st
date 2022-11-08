# st - simple terminal
st is a simple terminal emulator for X which sucks less.

## Requirements
In order to build st you need the Xlib header files.

## Installation
Edit config.mk to match your local setup (st is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install st (if
necessary as root):
```
make clean install
```

## Running st
If you did not install st with make clean install, you must compile
the st terminfo entry with the following command:
```
tic -sx st.info
```

See the man page for additional details.

## Credits
Based on Aurélien APTEL <aurelien dot aptel at gmail dot com> bt source code.

# Changes over vanilla ST
## Patches from suckless.org:
- Boxdraw
- Scrollback
- alpha
- font2
- externalpipe and externalpipe-eternal
- delkey
- anysize

## Other changes
- Shortcuts
- Transparent colors
- Vimselect: Press `alt-esc` to enter vim mode

![ncmpcpp visualizer with transparent colors](https://github.com/lucas-mior/st/blob/master/print.webp?raw=true)
