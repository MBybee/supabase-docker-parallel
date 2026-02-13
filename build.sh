#!/usr/bin/bash

set -e

# image target. eg. "postgres"
target_folder="${1:-}"

for d in $(find ./images -type f -name Dockerfile); do
  dir=$(dirname "$d")
  if [[ -n "$target_folder" && "${dir##*/}" != "$target_folder" ]]; then
    continue
  fi
  ver=$(sed -n 's/^ENV[[:space:]]\+VERSION[[:space:]]*=\s*//p' "$d" || echo "latest")
  docker build -t ghcr.io/webysther/supabase-${dir##*/}:${ver:-latest} "$dir"
  docker push ghcr.io/webysther/supabase-${dir##*/}:${ver:-latest}
done

# simple --test to run a test compose
if [[ "${2}" == "--test" ]]; then
  echo "Running test compose for $target_folder"
  docker compose down -v
  sleep 1
  docker compose up "$target_folder"
fi