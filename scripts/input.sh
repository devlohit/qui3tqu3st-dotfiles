#! /bin/zsh

FILE="/home/qui3tqu3st/qui3tqu3st/programming/C++/input.txt"

if [ -f "$FILE" ]; then
  truncate -s 0 "$FILE"
else
  touch "$FILE"
fi

nvim "$FILE"
