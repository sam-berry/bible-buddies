#!/bin/bash

echo "Start: $(date -u +"%Y-%m-%dT%H:%M:%SZ")" >> log
echo " " >> log

osascript bb.applescript

echo " " >> log
echo "Finish: $(date -u +"%Y-%m-%dT%H:%M:%SZ")" >> log

echo "------------------------"
echo -e "⚡️🔥 \033[1mSCRIPT OUTPUT\033[0m 🌊🏄"
echo "------------------------"
echo " "

cat log

echo " "

cat log >> forever-log

rm log
