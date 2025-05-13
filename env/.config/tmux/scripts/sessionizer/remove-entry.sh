#!/usr/bin/env bash

PROJECT_LIST_FILE=${PROJECT_LIST_FILE:-$HOME/.config/tmux/scripts/sessionizer/project-list.txt}

mkdir -p "$(dirname "$PROJECT_LIST_FILE")"
touch "$PROJECT_LIST_FILE"

CURR_DIR=$(pwd)

if [[ $# -gt 0 ]]; then
  CURR_DIR=$1
fi

if [[ ! -d $CURR_DIR ]]; then
  echo "Warning: $CURR_DIR does not exist, but removing anyway if present in the list." >&2
fi

CURR_DIR=$(echo "$CURR_DIR" | sed -e "s/\//\\\\\//g")

sed -i.bak "/^$CURR_DIR$/d" "$PROJECT_LIST_FILE"

if [[ $? -eq 0 ]]; then
  echo "Project removed: $CURR_DIR"
else
  echo "Error: Could not remove project: $CURR_DIR" >&2
  exit 1
fi
