property logFile: "/Users/berrysa/Documents/projects/bible-buddies/log"
property bibleStudyMini: do shell script "head -c 30 /Users/berrysa/Documents/projects/bible-buddies/bible-study.txt"

set bibleStudyRaw to readFile("/Users/berrysa/Documents/projects/bible-buddies/bible-study.txt")

set saveTID to text item delimiters
set text item delimiters to "\n"
set bibleStudy to bibleStudyRaw as text
set text item delimiters to saveTID

set allBuddiesIMessage to do shell script "cat buddies-imessage.txt | xargs"
set allBuddiesSms to do shell script "cat buddies-sms.txt | xargs"

set buddyListIMessage to splitText(allBuddiesIMessage, ",")
set buddyListSms to splitText(allBuddiesSms, ",")

repeat with bud in buddyListIMessage
  try
    tell application "Messages"
        set targetService to 1st service whose service type = iMessage
        set targetBuddy to buddy bud of targetService
        send bibleStudy to targetBuddy
    end tell
    writeLog("Attempt to send iMessage study to " & bud)
  on error the errorMessage number the errorNumber
    writeLog("Error: " & errorNumber & " : " & errorMessage)
  end try
end repeat

repeat with bud in buddyListSms
  try
    tell application "Messages"
        set targetService to id of service "SMS"
        set targetBuddy to buddy bud of service id targetService
        send bibleStudy to targetBuddy
    end tell
    writeLog("Attempt to send SMS study to " & bud)
  on error the errorMessage number the errorNumber
    writeLog("Error: " & errorNumber & " : " & errorMessage)
  end try
end repeat

writeLog(" ")

repeat with bud in buddyListIMessage
  try
    verifyStudyIsSent(bud)
  on error the errorMessage number the errorNumber
    writeLog("Error: " & errorNumber & " : " & errorMessage)
  end try
end repeat

repeat with bud in buddyListSms
  try
    verifyStudyIsSent(bud)
  on error the errorMessage number the errorNumber
    writeLog("Error: " & errorNumber & " : " & errorMessage)
  end try
end repeat

on verifyStudyIsSent(phoneNumber)
  set matchingText to trim(findMatchingText(phoneNumber))
  if matchingText is "" then
    writeLog("🚨 Failed to send to " & phoneNumber)
  else
    writeLog("✅ Study sent to " & phoneNumber)
  end if
end verifyStudyIsSent

on findMatchingText(phoneNumber)
  return do shell script "sqlite3 /Users/berrysa/Library/Messages/chat.db \"select ROWID from message where handle_id in (select ROWID from handle where id like '%" & phoneNumber & "') and text like '%" & bibleStudyMini  & "%' limit 1;\""
end findMatchingText

on writeLog(logMessage)
  do shell script "echo " & quoted form of logMessage & " >> " & quoted form of logFile
end splitText

on trim(theText)
  return (do shell script "echo \"" & theText & "\" | xargs")
end trim

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
