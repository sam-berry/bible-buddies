set num to "7342741615"
set numResult to do shell script "sqlite3 ~/Library/Messages/chat.db \"select rowid from message where destination_caller_id like '%" & num & "';\""

if numResult is "" then
  activate application "Messages"
     tell application "System Events" to tell process "Messages"
     key code 45 using command down           -- press Command + N to start a new window
     keystroke num                            -- input the phone number
     key code 36                              -- press Enter to focus on the message area
     keystroke "<replace with message>"       -- type some message
     key code 36                              -- press Enter to send
  end tell
else
  display dialog "true"
end if
