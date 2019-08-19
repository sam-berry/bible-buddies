set num to "7342741615"
set numResult to do shell script "sqlite3 ~/Library/Messages/chat.db \"select rowid from message where destination_caller_id like '%" & num & "';\""

if numResult is "" then
  display dialog "false"
else
  display dialog "true"
end if
