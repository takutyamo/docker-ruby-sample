#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
# プロジェクトフォルダ名に合わせる
rm -f /sample/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"