#!/bin/bash
set -e
if [[ -n "$VSCODE_SERVER_NAME" && ! -f var/lib/code-server/code_tunnel.json ]]; then
    echo "[Entrypoint] Setting VSCODE_SERVER_NAME to $VSCODE_SERVER_NAME"
    code-server rename --name $VSCODE_SERVER_NAME --accept-server-license-terms --server-data-dir var/lib/code-server
fi
exec "$@"