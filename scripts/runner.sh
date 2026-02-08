#!/usr/bin/env zsh

INPUT_FILE="/home/qui3tqu3st/qui3tqu3st/programming/C++/input.txt"
OUTPUT_FILE="/home/qui3tqu3st/qui3tqu3st/programming/C++/output.txt"


# Ensure a file is provided
if [ -z "$1" ]; then
  # echo "Usage: run <filename>"
  exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
  echo "File not found: $FILE"
  exit 1
fi

EXT="${FILE##*.}"
NAME="${FILE%.*}"

# echo "Detected file: $FILE"
# echo "Extension: .$EXT"
# echo

case "$EXT" in
py)
  # echo "Running Python..."
  python3 "$FILE"
  ;;

js)
  # echo "Running Node.js..."
  node "$FILE"
  ;;

ts)
  # echo "Running TypeScript..."
  npx ts-node "$FILE"
  ;;

cpp)
  # echo "Compiling C++..."
  # g++ "$FILE" -o a.out && ./a.out < "$INPUT_FILE" > "$OUTPUT_FILE" && rm a.out
  g++ "$FILE" -o a.out && ./a.out && rm a.out
  ;;

c)
  # echo "Compiling C..."
  # gcc "$FILE" -o a.out && ./a.out < "$INPUT_FILE" > "$OUTPUT_FILE" && rm a.out
  gcc "$FILE" -o a.out && ./a.out && rm a.out
  ;;

java)
  # echo "Compiling Java..."
  javac "$FILE" && java "$NAME"
  ;;

rs)
  # echo "Running Rust..."
  rustc "$FILE" -o "$NAME.out" && "./$NAME.out"
  ;;

go)
  # echo "Running Go..."
  go run "$FILE"
  ;;

sh)
  # echo "Running Bash script..."
  zsh "$FILE"
  ;;

rb)
  # echo "Running Ruby..."
  ruby "$FILE"
  ;;

php)
  # echo "Running PHP..."
  php "$FILE"
  ;;

*)
  echo "Unknown file type: .$EXT"
  echo "Cannot determine how to run this file."
  exit 1
  ;;
esac
