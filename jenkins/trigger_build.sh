#!/bin/bash

SERVER_URL=$(cat JENKINS_SERVER_URL)
REPO=$(git remote -v | grep "(fetch)" | cut -f2 | cut -f1 -d' ')

curl "${SERVER_URL}/git/notifyCommit?url=${REPO}"
