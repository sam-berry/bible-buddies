# Bible Buddies

*A tool for efficiently sending Bible studies to friends*

## Overview

Bible Buddies is a command line application which utilizes AppleScript to send text messages BCC-style to a list of configurable recipients. The software will utilize the MacOS Messages app in order to send iMessage or SMS communications on behalf of the authenticated user.

## Prerequisites

Due to restrictions around mass texting, this software requires a bit of set up in order to function properly. Complete these steps before attempting to run the software.

### 1. Login to Messages on your macOS computer

Open the Messages app. If you are not already signed in with your Apple ID, get er dun and make sure that the account is enabled.

<img src="instructions-data/messages-preferences.png?raw=true" width="500">
<img src="instructions-data/messages-account-enabled.png?raw=true" width="500">

### 2. Initialize a conversation with each recipient from your computer

Apple does not allow new conversations to be programmatically initialized. In order to send a message using the Bible Buddies program, a conversation must be already present in the Messages app on your computer. If you open the Messages app and you can locate your conversation with a recipient, you are all set. If conversation history does not show up, send a new message to the recipient's number. Be sure to include an emoji.

<img src="instructions-data/initialize-message.png?raw=true" width="500">

### 3. Enable Terminal to access Messages data

By default, applications are not allowed to access text messages and other sensitive data. But, you can totally trust this random application from the internet.

Open **System Preferences** and navigate to **Security & Privacy**. Go to the **Privacy** tab and select **Full Disk Access** in the list of options on the left. Add **Terminal** to the list of applications which have full disk access.

<img src="instructions-data/security-and-privacy-tab.png?raw=true" width="500">
<img src="instructions-data/security-and-privacy-app-select.png?raw=true" width="500">
<img src="instructions-data/security-and-privacy-success.png?raw=true" width="500">

### 4. Enable text-forwarding on your phone

In order to send SMS (green) texts from a computer, text-forwarding must be enabled. To do this, on your iPhone go to **Settings** > **Messages** > **Text Message Forwarding**. This should give you the option to enable your computer.

<img src="instructions-data/enable-text-forwarding.jpeg?raw=true" width="200">

## Installing Bible Buddies

1. Open a Terminal window
2. Run `git clone git@github.com:sam-berry/bible-buddies.git`

## Adding Buddies

Recipients of your Bible study are tracked in a file called `buddies.txt`. This file should simply contain a comma-delimited list of phone numbers. There should not be extra spaces or special characters to split up the numbers. Country code is not necessary but area code is.

An example `buddies.txt` looks like:

```
7341234567,2314657234,3138283746,7346625346
```

## Setting the Bible Study to be Sent

The contents of `bible-study.txt` is what will be read and sent to each recipient. The program supports newlines and emojis, so the content in the file should be preserved as-is. Note that the entire contents of the file will be sent so try to avoid trailing empty lines.

## Blasting Out a Bible Study 🚀

To send the Bible study saved in `bible-study.txt` to all of the recipients listed in `buddies.txt`, open a Terminal and run:

```
cd bible-buddies && osascript bb.applescript
```
<br>
<img src="instructions-data/success-text.png?raw=true" width="350">
