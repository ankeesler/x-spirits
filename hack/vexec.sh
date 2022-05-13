#!/usr/bin/env bash

set -euo pipefail

MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PYTHON="${PYTHON:-python3}"
JINJA_VERSION=3.1.2

cd "$MY_DIR/.."

"$PYTHON" -m venv hack/venv
source hack/venv/bin/activate
trap deactivate EXIT

pip install -r requirements.txt

python "$@"
