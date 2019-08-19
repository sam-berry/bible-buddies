#!/bin/bash

number=7342741615

number_result=$(sqlite3 ~/Library/Messages/chat.db "select rowid from message where destination_caller_id like '%$number';")

if [[ $number_result ]]; then
  number_already_exists=1
else
  number_already_exists=0
fi

echo $number_already_exists

