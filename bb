#!/bin/bash

echo "Start BB: $(date -u +"%Y-%m-%dT%H:%M:%SZ")" >> log

osascript bb.applescript

echo "Finish BB: $(date -u +"%Y-%m-%dT%H:%M:%SZ")" >> log

echo -e "⚡️🔥 \033[1mSCRIPT OUTPUT\033[0m 🌊🏄"

cat log

cat log >> forever-log

rm log
