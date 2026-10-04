#!/bin/sh
# Reports GitHub repositories linked from the given Markdown files that are
# archived, renamed, unreachable, or have had no push in the last 12 months.
# Repositories listed in .github/staleness-allowlist.txt are skipped; use it
# for canonical reference implementations of papers that are finished work.
# Set GITHUB_TOKEN to avoid the 60 requests per hour unauthenticated limit.
# Requires curl and jq.
# Exit 0 = nothing to report. Exit 1 = at least one repository needs attention.
# Usage: sh scripts/check-staleness.sh [file.md ...]   (default: README.md)
set -eu

[ "$#" -eq 0 ] && set -- README.md

ALLOWLIST=".github/staleness-allowlist.txt"
NOW=$(date +%s)
MAX_AGE=$((365 * 24 * 60 * 60))
FOUND=0

to_epoch() {
  date -j -u -f '%Y-%m-%dT%H:%M:%SZ' "$1" '+%s' 2>/dev/null || date -u -d "$1" '+%s'
}

fetch() {
  if [ -n "${GITHUB_TOKEN:-}" ]; then
    curl -sSfL -H 'Accept: application/vnd.github+json' -H "Authorization: Bearer ${GITHUB_TOKEN}" "$1"
  else
    curl -sSfL -H 'Accept: application/vnd.github+json' "$1"
  fi
}

flag() {
  printf '%s\t%s\t%s\n' "$1" "$2" "$3"
  FOUND=1
}

slugs=$(grep -ohE 'https://github\.com/[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+' "$@" \
  | sed -e 's|^https://github\.com/||' -e 's|\.git$||' \
  | sort -uf)

printf 'repo\tstatus\tdetail\n'

for slug in $slugs; do
  if [ -f "$ALLOWLIST" ] && grep -qixF "$slug" "$ALLOWLIST"; then
    continue
  fi

  if ! response=$(fetch "https://api.github.com/repos/${slug}" 2>/dev/null); then
    flag "$slug" "unreachable" "GitHub API request failed"
    continue
  fi

  full_name=$(printf '%s' "$response" | jq -r '.full_name')
  archived=$(printf '%s' "$response" | jq -r '.archived')
  pushed_at=$(printf '%s' "$response" | jq -r '.pushed_at')

  if [ "$archived" = "true" ]; then
    flag "$slug" "archived" "$pushed_at"
  elif [ $((NOW - $(to_epoch "$pushed_at"))) -gt "$MAX_AGE" ]; then
    flag "$slug" "inactive" "last push $pushed_at"
  fi

  if [ "$(printf '%s' "$full_name" | tr '[:upper:]' '[:lower:]')" != "$(printf '%s' "$slug" | tr '[:upper:]' '[:lower:]')" ]; then
    flag "$slug" "renamed" "now $full_name"
  fi
done

exit "$FOUND"
