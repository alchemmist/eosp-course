#!/usr/bin/env bash
set -euo pipefail

SRC_BASE="$HOME/knowledge-base/eosp"
DST_BASE="$HOME/code/eosp"

echo "Sync curriculum.md"
rsync -av \
  "$SRC_BASE/curriculum.md" \
  "$DST_BASE/curriculum.md"

echo "Sync testing-form.md"
rsync -av \
  "$SRC_BASE/testing-form.md" \
  "$DST_BASE/testing-form.md"

echo "Sync loongreads directory"
rsync -av --delete \
  "$SRC_BASE/loongreads/" \
  "$DST_BASE/loongreads/"

