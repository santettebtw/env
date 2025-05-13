#!/usr/bin/env bash

PROJECT_LIST_FILE=${PROJECT_LIST_FILE:-$HOME/.config/tmux/scripts/sessionizer/project-list.txt}

mkdir -p "$(dirname "$PROJECT_LIST_FILE")"
touch "$PROJECT_LIST_FILE"

CURR_DIR=$(pwd)

if [[ $# -gt 0 ]]; then
  CURR_DIR=$1
fi

if [[ ! -d $CURR_DIR ]]; then
  echo "Error: $CURR_DIR is not a valid directory." >&2
  exit 1
fi

if ! grep -q "^$CURR_DIR$" "$PROJECT_LIST_FILE"; then
  echo "$CURR_DIR" >>"$PROJECT_LIST_FILE"
  echo "Project added: $CURR_DIR"
  sort -o "$PROJECT_LIST_FILE" "$PROJECT_LIST_FILE"
  exit 0
else
  echo "Project already exists: $CURR_DIR" >&2
  sort -o "$PROJECT_LIST_FILE" "$PROJECT_LIST_FILE"
  exit 1
fi
