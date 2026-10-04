#!/bin/sh
# Validates list entries against the style rules in CONTRIBUTING.md.
# Checks each "- [" line outside the Contents list for:
#   - the "- [Name](url) - Description." shape,
#   - a description that starts with an uppercase letter or digit and ends with a period,
#   - at most 20 words in the description,
#   - no em-dashes and no marketing vocabulary,
#   - no nested bullets.
# Exit 0 = all clear. Exit 1 = violations found.
# Usage: sh scripts/check-entry-format.sh [file.md ...]   (default: README.md)
set -eu

[ "$#" -eq 0 ] && set -- README.md

MAX_WORDS=20
BANNED='leverag|robust|delve|comprehensive|powerful|amazing|game-chang|seamless|cutting-edge|state-of-the-art|best-in-class|revolutionary|blazing'
ERRORS=0

report() {
  printf '%s:%d: %s\n' "$1" "$2" "$3"
  ERRORS=$((ERRORS + 1))
}

for file in "$@"; do
  lineno=0
  while IFS= read -r line || [ -n "$line" ]; do
    lineno=$((lineno + 1))

    case "$line" in
      '- ['*)
        # Skip Contents links, which point at in-page anchors.
        if printf '%s' "$line" | grep -qE '^- \[[^]]+\]\(#'; then
          continue
        fi
        if ! printf '%s' "$line" | grep -qE '^- \[[^]]+\]\([^)]+\) - [A-Z0-9].*\.$'; then
          report "$file" "$lineno" "bad entry format"
          continue
        fi
        description=$(printf '%s' "$line" | sed -E 's/^- \[[^]]+\]\([^)]+\) - //')
        words=$(printf '%s' "$description" | wc -w | tr -d ' ')
        if [ "$words" -gt "$MAX_WORDS" ]; then
          report "$file" "$lineno" "description has $words words (max $MAX_WORDS)"
        fi
        if printf '%s' "$description" | grep -q '—'; then
          report "$file" "$lineno" "description contains an em-dash"
        fi
        if printf '%s' "$description" | grep -qiE "$BANNED"; then
          report "$file" "$lineno" "description uses marketing vocabulary"
        fi
        ;;
    esac

    if printf '%s' "$line" | grep -qE '^ +[-*+] '; then
      report "$file" "$lineno" "nested bullet"
    fi
  done < "$file"
done

if [ "$ERRORS" -gt 0 ]; then
  printf '\n%d violation(s) found.\n' "$ERRORS"
  exit 1
fi

printf 'Entry format OK.\n'
