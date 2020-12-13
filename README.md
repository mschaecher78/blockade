---
author: Michael L. Schaecher
license: GPL 3
date: 2020/12/11
---

About
=====
**Blockade** is a bash script for linux based operating systems using systemd that is designed to edit the **/etc/hosts** file. By using the the hosts file instead of application that monitors websites the system is using less resources. Though there as some apps that do the same thing and maybe simple having a GUI, most do not use the work provided by [Steven Black](https://github.com/StevenBlack/hosts), which I feel is updated more offend and is geared toward real world users.

Why no GUI?
====================
By having a GUI, another user can be temped (like a well techie teen) to try and circumvent the blocks. An app that basically saying hay I'm blocking you, either by way of a third party app or browser plug is to out in the open.

It should act like a general system service in the background. Plus in my view it makes **blockade** cooler.

Installing & Building
=====================
Installing **blockade** is easy and can be done one of two was.

**Building Debian Package**
```
$ make package-deb
```
**Build & Install**
```
$ make build
$ sudo make install
```
**Clean**
```
$ make clean
```

Definition
==========
NO. | DESCRIPTION | DEFINITION
:-- | :---------: | :---------
1 | **unified** | Common web based applications that use cookies for targeted based adds.
2 | **fakenews** | Common agreed upon fakenews sites like **_InfoWars_** and the like that are full of adds and crap.
3 | **gambling** | Sites that try and steal you money. Most of which keep taking you money even after cancelling subscription.
4 | **porn** | Websites that are sexually unsatisfying.
5 | **social** | Common social media sites that have questionable content. Sadly this does not include Facebook or Twitter.

Why No Crontab
===========
Though there are many ways to run a timer in Linux, the most common is cron. While cron is good, there is a downside. For one, if the time is missed **blockade** has to wait till the next run, but with systemd it is still ran just a little bit late. The main reason is that the service defaults to root access, unlike with cron the schedule would be to done while under root.

_Setting the Refresh Timer_
-------------------------
The systemctl timer is quite easier easy to use in that it always for simplicity. The simple is using just one word [daily,weekly,monthly,yearly], there are more check out **systemd.time** by running ```man systemd.time```.

Features
========
**Blockade** is designed to be easy to use. Everything from how updates are scheduled, to adding websites to the block list.

- [x] Add websites that you would liked to be blocked.
- [x] Custom data/time scheduling, as well as letting **SystemD** set the time.
- [x] Set block level based on hosts configuration name.
- [x] Reset hosts file for up to 12hrs.
- [x] Hosts file now refreshes after hosts name is set or changed and when you add a website/s.
- [ ] Service check to make sure that blockade is active.
- [ ] Show **blockade** status with included info; **_hosts name_**, **_last updated_** & **_next update_** and **_paused tell_**.
- [ ] Alway for removing of unified from hosts file to alway for access to add based streaming content like **_Hulu_** and some news sites that use adds to pay for service.

Entering Arguments
==================
**Blockade** requires that each arguments be encapsulated between quotations **\"**. This insures that ```command note found``` error from accruing.

Example
-------

```
$ sudo blockade name "unified"
```
or
```
$ sudo blockade interval -t "*-*-10 00:00"
