#!/usr/bin/env bash

files=(
  /etc/profile.d/bash_completion.sh
  /usr/share/doc/fzf/examples/key-bindings.bash
  /usr/local/share/doc/task/scripts/bash/task.sh
)

for file in "${files[@]}"; do
  if [[ -f "$file" ]]; then
    source "$file"
  fi
done

if command -v kubectl > /dev/null; then
  source <(kubectl completion bash)

  alias k=kubecolor
  complete -o default -F __start_kubectl k
fi
