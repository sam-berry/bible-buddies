set bibleStudyRaw to readFile("/Users/berrysa/Documents/projects/bible-buddies/bible-study.txt")

set saveTID to text item delimiters
set text item delimiters to "\n"
set bibleStudy to bibleStudyRaw as text
set text item delimiters to saveTID

set allBuddies to do shell script "cat buddies.txt | xargs"

set buddyList to splitText(allBuddies, ",")

repeat with bud in buddyList
  tell application "Messages"
      set targetService to id of service "SMS"
      set targetBuddy to buddy bud of service id targetService
      send bibleStudy to targetBuddy
  end tell
  log "Sent study to " & bud
end repeat

on splitText(theText, theDelimiter)
    set AppleScript's text item delimiters to theDelimiter
    set theTextItems to every text item of theText
    set AppleScript's text item delimiters to ""
    return theTextItems
end splitText

on readFile(unixPath)
    set foo to (open for access (POSIX file unixPath))
    set txt to paragraphs of (read foo as «class utf8»)
    close access foo
    return txt
end readFile
