---
title: blockade
section: 1
author: Michael L. Schaecher
date: 2020/12/2
---

NAME
====
**blockade** manages /etc/hosts file.

SYNOPSIS
========
**blockade** \[_command_\] | **blockade** \[_command_\] \"arg...\"\ | **blockade** \[_command_\] \<option\> \"arg...\"

DESCRIPTION
===========
**blockade** functions much like a **_nanny_** program that is designed around keeping kids from the more adult related parts of the web. The main downside to thoughts programs is that they are always active and may require a plugin for the web browser to function. **blockade** does not require a plugin nor is the program contentiously active. This is done by way of editing the main **hosts** file directly using the project managed by **Steven Black**.

Arguments must be contained within quotes (\").

**Commands**
--------------
**edit** "website/url"
: Manually add website url, more then one can be added separating each one by a space. goto **Adding Websites** in **MANAGING BLOCKADE** for more info.

**interval** \-c \"daily|weekly|monthly|yearly\" | **interval** \-t \"year-month-day hour:minute\"
: Set how offend blockade updates the hosts file. This command requires an option that determines what type of date format, goto **MANAGING BLOCKADE** for more info.

**name** "hosts name" | **name** \-l
: What hosts configuration to use. If the **\-l** option is passed a list of available hosts configuration is displayed.

**pause** -m \"minutes\" | **pause** -h \"hours\"
: Set how long to reset /etc/hosts. Max limit is 12 hours or 720 minutes. if the next scheduled **blockade** _refresh_ is within the time then the timeout will be ignored. For more details see **Pausing for a Time** in **MANAGING BLOCKADE**.

**refresh**
: Manual update the hosts file.

**help**
: Show the help dialog.

**version**
: Show version info.

**Options**
-------------
**\-l**
: Give list available hosts configurations when ran with the \"_name_\" command.

**\-c**
: Use the common systemctl timer options daily, weekly, monthly or yearly. See **Setting Refresh Rate** in **MANAGING BLOCKADE** for more details.

**\-t**
: Set specific date and/time for blockade to update hosts. See **Setting Interval** in **MANAGING BLOCKADE** for more details.

**\-h**
: Pause limit in hours.

**\-m**
: Pause limit in minutes.

MANAGING BLOCKADE
=================
Configuring and managing **blockade** is easy and straight forward. Everything for how and when to refresh; pausing the blocking for a set period of time and adding websites. This program is designed so that even if you update it, you well never loss your current settings.

Each arguments must be contain between quotes (**_\"_**,) this prevents command not found errors.

**Adding Websites**
---------------------
Though the hosts files are pretty comprehensive and are updated regularly, there may need to be a reason to add additional websites to be blocked. Websites can be add one-by-one (slow), or multiple at to time (less slow).

How to add one websites.

>
**sudo blockade edit \"www.website.com\"**


Adding more the one. **Note** the space between websites.

>
**sudo blockade edit \"www.website.com www.another-website.com\"**


**Setting Refresh Rate**
--------------------------
By default **blockade** set to refresh the hosts file monthly, this can be set to daily (not recommended) and up to yearly. The date and time is determined by when the **service** if first enabled. To get around this using a set date and time can be done following the **systemd.time** date/time syntax.

The date/time follows the following format [**year-month-day hour:minute:second**]. the time format is 24 UTC, meaning
a minute after midnight would be **00:01:00** and 6pm would be **18:00:00**.

The wild \"**\***\" can be used like so.

>
**sudo blockade interval -t \"\*-\*-5 06:30\"**


**Hosts Configuration**
-------------------------
Here is a list of configurations. What each one does is pretty self explain.

>
|
:-- | :--
**unified** | **fakenews**
**gambling** | **porn**
**social** | **fakenews-gambling**
**fakenews-porn** | **fakenews-social**
**gambling-porn** | **gambling-social**
**porn-social** | **fakenews-gambling-porn**
**fakenews-gambling-social** | **fakenews-porn-social**
**gambling-porn-social** | **fakenews-gambling-porn-social**

The default is \"**unified**\", to change to \"**porn**\" configuration run the following command.

>
**sudo blockade name \"porn\"**


**NOTE**: if you have an add based subscription service like **Hulu**, you may experience problems. This is a common effect with add blocking software.

This is not a bug.

**Pausing for a Time**
----------------------
There may be a need to revert to a basic hosts file, either for streaming a movie or doing research. The pause can be is short as 1 minute or as long as 12 hours.

To pause for 1 hour run the following commands.

>
**sudo blockade -m \"60\"** | **sudo blockade -h \"1\"**

If the time limit is after the next **blockade** refresh, then the pause timeout well be ignored and the timer removed. This helps to insure the blockade is always able to be updated. Best paretics is to schedule the time that **blockade** updates or refreshes is daring a time that you are not at you computer.

LICENSES
========
Copyright (C) 2020 License GPL3: GNU GPL version 2 only. This program comes with no **WARRANTY**.