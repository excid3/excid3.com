---
title: Changing the Ubuntu 10.04 Audio Channel Control
author: excid3
layout: post
aktt_notify_twitter:
  - yes
aktt_tweeted:
  - 1
dsq_thread_id:
  - 105997533
categories:
  - Ubuntu
tags:
  - alsa
  - pulseaudio
  - sound
  - Ubuntu
---
This has been driving me nuts for the longest time and I just haven’t had time to look up the fix until now. Luckily the [Ubuntu Forums][1] has an unbelievably great community and got me an answer within a few hours. My problem was that the volume control for the new PulseAudio system in Ubuntu 10.04 would have either an On or Off volume and absolutely nothing in between. You could go from Off to completely On and none of the other notches would change a thing. Fiddling with alsamixer, I could tell that it was modifying the Master Front channel, but this wasn’t what was needed for my HDA audio card on my Asus M4N78 motherboard. I needed it to use the PCM channel.

lidex on the forums pointed me to [this post][2] where the details were all layed out for me:
`This is being currently discussed in bug 410948.
To sum up, here's what you do:
Code:
sudo nano /etc/pulse/default.pa
Uncomment the line : #load-module module-alsa-sink
And add: control=PCM
So it reads: load-module module-alsa-sink control=PCM
Further down where it reads: load-module module-udev-detect
Add: ignore-dB=1
So it reads: load-module module-udev-detect ignore_dB=1
And save. You may need to restart for changes to take effect.
The volume control will now only adjust the PCM channel, so you may want to turn the Master and LFE to maximum in alsamixer.`

And if you're getting that crackling sound:
Code:
sudo nano /etc/modprobe.d/alsa-base.conf
Comment out the last line which reads: options snd-hda-intel power_save=10 power_save_controller=N

After applying that fix, restarting and checking with the volume controls, I was pleased to see it was controlling the PCM channel finally!! Talk about an annoying issue. You never knew if you were going to blow your eardrums out plugging in headphones or turning on the speakers. All is good! I love the linux community. 