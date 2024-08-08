#!/usr/bin/env bash
set -euo pipefail

TASK_VERSION="3.38.0"

function main {
    ensure-task
    sudo "$(task-path)" "$@"
}

function ensure-task {
    if [ ! -f "$(task-path)" ]; then
        sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b "$(dirname "$(task-path)")" "v${TASK_VERSION}"
    fi
}

function task-path {
    printf "%s" ".cache/task/${TASK_VERSION}/task"
}

main "$@"
