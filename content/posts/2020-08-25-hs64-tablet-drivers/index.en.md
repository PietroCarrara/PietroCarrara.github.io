---
date: "2020-08-25T00:00:00Z"
title: Huion HS64 Drivers
tags:
  - huion
  - tech
  - linux
---

Due to the ongoing COVID-19 pandemic, I found myself with too much free time; so much that I decided to try a new
hobby: Drawing. I don't plan to take it seriously, I just wanted to scribble something while I don't have anything
better to do.

So I decided to borrow a pen-tablet from a friend who has a Wacom. It was a pretty neat device.
Simply plug it in and everything worked out of the box. I even managed to get some playtime in osu! with it.

I returned it after 2~3 weeks, and decided I should buy one. I did some research, and Huion devices
had lower prices; since I won't take drawing seriously, I chose their HS64 model.

When it got here, the device wasn't plug-n-play, but installing the [digimend](https://github.com/DIGImend/digimend-kernel-drivers) drivers fixed this. At least partially.

Two things didn't work:

- The Wacom tools didn't recognize the device, so things like configuring the active area weren't possible (at least not in a simple way).
- Even though I could use the pen and its buttons, the 4 buttons present on the tablet weren't recognized.

That was when I remembered this [video](https://www.youtube.com/watch?v=juGNPLdjLH4), sort of "little tip" on how to get started with kernel hacking through driver development. I think I have an idea!

Of course, the next thing I did was clone the digimend repository and try to understand it.

My journey wouldn't last so long, however.

The project's README is very useful, so much that I was able to fix all of my problems just by reading it.
There, they tell you how to configure Xorg to use the Wacom input driver; when I did, everything worked: I could use the Wacom tools and the buttons on the tablet were responding.

I then discovered that the real culprit was the [aur package](https://aur.archlinux.org/packages/digimend-kernel-drivers-dkms-git/) I was using did not configure this. So, instead of getting my hands dirty in driver code, I settled just writing a [new package](https://aur.archlinux.org/packages/digimend-drivers-git-dkms/).

Next time, maybe I'll be lucky enough to get a device with a broken driver...
