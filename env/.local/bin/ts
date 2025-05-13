#!/usr/bin/env bash

PROJECT_LIST_FILE=${PROJECT_LIST_FILE:-$HOME/.config/tmux/scripts/sessionizer/project-list.txt}

mkdir -p "$(dirname "$PROJECT_LIST_FILE")"
touch "$PROJECT_LIST_FILE"

if [[ $# -gt 0 ]]; then
  command=$1
  shift

  if [[ $command == "add" ]]; then
    "$HOME/.config/tmux/scripts/sessionizer/add-entry.sh" "$@"
    exit $?
  elif [[ $command == "remove" ]]; then
    "$HOME/.config/tmux/scripts/sessionizer/remove-entry.sh" "$@"
    exit $?
  else
    selected=$command
  fi
else
  selected=$(cat "$PROJECT_LIST_FILE" | fzf --preview "ls -1 {}" --preview-window=bottom:10 --preview-window=sharp)
fi

if [[ -z $selected ]]; then
  echo "No project selected. Exiting." >&2
  exit 1
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s "$selected_name" -c "$selected"
fi

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
  tmux new-session -ds "$selected_name" -c "$selected"
fi

if [[ -z $TMUX ]]; then
  tmux attach-session -t "$selected_name"
else
  tmux switch-client -t "$selected_name"
fi
