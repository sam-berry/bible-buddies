set bibleStudy to "God so loved the world that He gave Jesus"

set num to "7342741615"

set allBuddies to do shell script "cat buddies.txt | xargs"

set buddyList to splitText(allBuddies, ",")

repeat with bud in buddyList
  activate application "Messages"
    tell application "System Events" to tell process "Messages"
    key code 45 using command down           -- press Command + N to start a new window
    keystroke num                            -- input the phone number
    key code 36                              -- press Enter to focus on the message area
    keystroke bibleStudy                     -- type some message
    key code 36                              -- press Enter to send
  end tell
  log "Sent study to " & bud
  delay 1
end repeat


on splitText(theText, theDelimiter)
    set AppleScript's text item delimiters to theDelimiter
    set theTextItems to every text item of theText
    set AppleScript's text item delimiters to ""
    return theTextItems
end splitText
