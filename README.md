---
author: Michael L. Schaecher
license: GPL 3
---

# About
**Blockade** is a bash script for linux based operating systems using systemd that is designed to edit the **/etc/hosts** file. By using the the hosts file instead of application that monitors websites the system is using less resources. Though there as some apps that do the same thing and maybe simple having a GUI, most do not use the work provided by [Steven Black](https://github.com/StevenBlack/hosts), which I feel is updated more offend and is geared toward real world users.

## **_Why no GUI?_**
By having a GUI, another user can be temped (like a well teen) to try and circumvent the blocks. An app that basically saying hay I'm blocking you either by way of a third party app or browser plug is to out in the open.

It should act like a general system service in the background. Plus in my view it makes **blockade** cooler.

## **_Installing_**
Installing **blockade** is easy and can be done one of two was.

**Building Debian Package**
```
$ make package
```

**Direct Install**
```
$ sudo make install
```

## **_Definition_**

NO. | DESCRIPTION | DEFINITION
:-- | :---------: | :---------
1 | **unified** | Common web based applications that use cookies for targeted based adds.
2 | **fakenews** | Common agreed upon fakenews sites like **_InfoWars_** and the like that are full of adds and crap.
3 | **gambling** | Sites that try and steal you money. Most of which keep taking you money even after cancelling subscription.
4 | **porn** | Websites that are sexually unsatisfying.
5 | **social** | Common social media sites that have questionable content. Sadly this does not include Facebook or Twitter.

## **_Why SystemD_**
Though there are many ways to run a timer in Linux, the most common is cron. While cron is good, there is a downside. For one, if the time is missed **blockade** has to wait till the next run, but with systemd it is still ran just a little bit late. The main reason is that the service defaults to root access, unlike with cron the schedule would be to done while under root.

## **_Features_**
**Blockade** is designed to be easy to use. Everything from how updates are scheduled, to adding websites to the block list.

- Custom data/time scheduling.
- Pause blocking for up to 12 hours, useful when an unfiltered Internet is needed.
- Checks for required service's to make sure that blockade was not fully disable.
- Add additional websites to block list. More the one can be added at a time.
- Display when the late time blockade was ran and hots file updated.

