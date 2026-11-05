#!/bin/sh
set -e

fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update'

# Tide guarda o estilo em variáveis universais do fish (ignoradas pelo chezmoi), então é reaplicado aqui
fish -c '
tide configure --auto --style=Lean --prompt_colors="True color" --show_time=No \
  --lean_prompt_height="Two lines" --prompt_connection=Disconnected \
  --prompt_spacing=Compact --icons="Many icons" --transient=No
set -U tide_left_prompt_items os pwd git newline character
'
