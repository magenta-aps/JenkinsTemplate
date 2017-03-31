#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SERVER_URL=$(cat "$DIR/JENKINS_SERVER_URL")
REPO=$(git remote -v | grep "(fetch)" | cut -f2 | cut -f1 -d' ')

curl "${SERVER_URL}/git/notifyCommit?url=${REPO}"
