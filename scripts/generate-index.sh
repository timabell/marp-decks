#!/bin/bash

# Generate index.md for decks directory

DECKS_DIR="decks"
INDEX_FILE="$DECKS_DIR/index.md"

echo "# Decks" > "$INDEX_FILE"
echo "" >> "$INDEX_FILE"

for deck in `ls "$DECKS_DIR"/*.md`; do
    basename_no_ext=$(basename "$deck" .md)
    if [ "$basename_no_ext" != "index" ]; then
        echo $deck
        echo "- [$basename_no_ext]($basename_no_ext)" >> "$INDEX_FILE"
    fi
done

echo "" >> "$INDEX_FILE"
