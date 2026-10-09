#!/bin/bash

set -e

# HUNK
if ! command -v hunk >/dev/null 2>&1; then
  npm install -g hunkdiff
fi
