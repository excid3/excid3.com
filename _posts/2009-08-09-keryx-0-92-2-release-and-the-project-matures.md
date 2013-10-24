---
title: Keryx 0.92.2 Release and the Project Matures
author: excid3
layout: post
dsq_thread_id:
  - 55195810
categories:
  - Keryx
tags:
  - contributors
  - Keryx
  - maturity
---
From our official announcement on [keryxproject.org][1]:

> Although 0.92 has been left out in the rain, the development team has decided to hand it an umbrella.
One of the irritating things about earlier releases of 0.92 was that it would download the same files, though they were already in the packages folder, overwriting the old ones and wasting bandwidth. That’s behind us now, thanks to modifications made by jaseen that cause Keryx to skip files that have already been downloaded.
>
> Also, Keryx 0.92.2 downloads not only dependencies, but also pre-dependencies and recommends, ensuring that you will get all the packages you need to install your software.
>
> One less visible improvement is the inclusion of the LocalRepo-Add.py (creates local repositories) and VerifyChecksums.py (deletes corrupt package files) scripts in the doc/ directory — both thanks to jaseen.
>
> And finally, another small improvement allows Keryx to be used with any Linux distro with APT installed — not just Ubuntu and Debian.
>
> So, head on over to the Download Page and get 0.92.2. For the hacking types, the Keryx source code has been packaged for downloading. You can get it at the Launchpad 0.92 download page.

Along with this release, I’d like to talk a little bit about the contributions I’ve received and the changes Keryx is going to take. Recently I have become extremely busy with work and will certainly be just as busy with the upcoming school year fast approaching. What that basically means is I’ll no longer be acting as the Lead Developer of Keryx from now on. Instead I’ll continue managing the project and making major decisions. I have appointed [Ayuthia][2] as the Lead Developer now and have been mentoring mac9416. The release of 0.92.2 is one to tide us over until the release of 1.0 which has been thoroughly planned out and should be easily able to perform all the necessary tasks for an offline machine, including package installation. We look forward to a good next release and I want to extend out a very warm thank you to all of you who have contributed in any way. I couldn’t have gotten this far without you. ![:\)][3]

   [1]: http://keryxproject.org
   [2]: http://linuxfans.keryxproject.org/
   [3]: http://excid3.com/blog/wp-includes/images/smilies/icon_smile.gif
