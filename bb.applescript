property logFile: "/Users/berrysa/Documents/projects/bible-buddies/log"

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
    writeLog("Sent iMessage study to " & bud)
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
    writeLog("Sent SMS study to " & bud)
  on error the errorMessage number the errorNumber
    writeLog("Error: " & errorNumber & " : " & errorMessage)
  end try
end repeat

on writeLog(logMessage)
  do shell script "echo " & quoted form of logMessage & " >> " & quoted form of logFile
end splitText

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
