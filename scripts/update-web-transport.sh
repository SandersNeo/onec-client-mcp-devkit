#!/usr/bin/env bash
# Updates web-transport addin from the latest GitHub release
# alkoleft/web-transport-addin -> exts/client-mcp/src/CommonTemplates/Msp_webTransport/Template.addin

set -euo pipefail

REPO="alkoleft/web-transport-addin"
ASSET_NAME="WebTransportAddIn.zip"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET="${SCRIPT_DIR}/../exts/client-mcp/src/CommonTemplates/$(ls "${SCRIPT_DIR}/../exts/client-mcp/src/CommonTemplates/" | grep -i webTransport)/Template.addin"

echo "Fetching latest release info..."
API_RESPONSE=$(curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest")
DOWNLOAD_URL=$(echo "$API_RESPONSE" | python3 -c "import sys,json; assets=json.load(sys.stdin)['assets']; print(next(a['browser_download_url'] for a in assets if a['name']=='${ASSET_NAME}'))")

if [ -z "$DOWNLOAD_URL" ]; then
  echo "ERROR: asset '${ASSET_NAME}' not found in latest release" >&2
  exit 1
fi

echo "Downloading ${DOWNLOAD_URL} ..."
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

curl -fsSL -o "${TMP}/${ASSET_NAME}" "$DOWNLOAD_URL"

cp "${TMP}/${ASSET_NAME}" "$TARGET"

echo "Done: $TARGET updated."
