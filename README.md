# Bible Buddies

*A tool for efficiently sending Bible studies to friends*

## Overview

Bible Buddies is a command line application which utilizes AppleScript to send text messages BCC-style to a list of configurable recipients. The software will utilize the MacOS Messages app in order to send iMessage or SMS communications on behalf of the authenticated user.

## Requirements

Due to restrictions around mass texting, this software requires a bit of set up in order to function properly. This program is **macOS only**.

### 1. Login to Messages on your macOS computer

Open the Messages app. If you are not already signed in with your Apple ID, get er dun and make sure that the account is enabled.

### 2. Initialize a conversation with each recipient from your computer

Apple does not allow new conversations to be programmatically initialized. In order to send a message using the Bible Buddies program, a conversation must be already present in the Messages app on your computer. If you open the Messages app and you can locate your conversation with a recipient, you are all set. If conversation history does not show up, send a new message to the recipient's number. Be sure to include an emoji.

### 3. Enable Terminal to access Messages data

By default, applications are not allowed to access text messages and other sensitive data. But, you can totally trust this random application from the internet.

Open **System Preferences** and navigate to **Security & Privacy**. Go to the **Privacy** tab and select **Full Disk Access** in the list of options on the left. Add **Terminal** to the list of applications which have full disk access.
