#! /bin/zsh

FILE="/home/qui3tqu3st/qui3tqu3st/programming/C++/output.txt"

if [ ! -f "$FILE" ]; then
  touch "$FILE"
fi

nvim "$FILE"
