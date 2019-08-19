# Bible Buddies

*A tool for efficiently sending Bible studies to friends*

## Overview

Bible Buddies is a command line application which utilizes AppleScript to send text messages BCC-style to a list of configurable recipients. The software will utilize the MacOS Messages app in order to send iMessage or SMS communications on behalf of the authenticated user.

## Requirements

Due to restrictions around mass texting, this software requires a bit of set up in order to function properly. This program is **macOS only**.

### 1. Login to Messages on your macOS computer

Open the Messages app. If you are not already signed in with your Apple ID, get er dun and make sure that the account is enabled.

### 2. Enable Terminal to access Messages data

By default, applications are not allowed to access text messages and other sensitive data. But, you can totally trust this random application from the internet.

Open **System Preferences** and navigate to **Security & Privacy**. Go to the **Privacy** tab and select **Full Disk Access** in the list of options on the left. Add **Terminal** to the list of applications which have full disk access.

### 3. Enable Terminal to send keystrokes

In order for Terminal to initialize new conversations with recipients it needs to have access to accessibility features.

Open **System Preferences** and navigate to **Security & Privacy**. Go to the **Privacy** tab and select **Accessibility** in the list of options on the left. Add **Terminal** to the list of applications which have ability to control the computer.

### 4. Enable text-forwarding on your phone

In order to send SMS (green) texts from a computer, text-forwarding must be enabled. To do this, on your iPhone go to **Settings** > **Messages** > **Text Message Forwarding**. This should give you the option to enable your computer.
