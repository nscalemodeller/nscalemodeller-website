---
date: 2018-05-20 12:00
tags: Turnout Control, Muscle Wire
subtitle: Using muscle wire to operate turnouts - updated from my old blog
---

# Muscle Wire to Operate Turnouts

Well I know I haven't posted much in a while, but rest assured there have been exciting developments going on over here on a number of fronts.

The first thing is, I am gradually becoming convinced that I may have 'cracked' the holy grail of finding a cheap turnout actuator for my layout. My last couple of posts have looked at using servos, and they show a lot of promise, however I have been experimenting with something better - muscle wire.

Now, truth to tell, I have thought of using muscle wire - Nitinol wire - for a long while now. I bought a wire sample kit and book nearly 10 years ago and have off and on (mainly off) tried to actuate turnouts using various mechanisms. I have a small drawer of 'experiments' gone wrong as you can see here (note the fried resister in the experiment at the top):

<!--more-->

[img: 350, /images/2018/muscle-wire-experiments.jpg]

So don't say I haven't tried!

Anyway, a couple of months ago I started experimenting again, as a final test to see if it could be done. Comments like in [this long thread] and particularly from near the bottom of the second page onwards, made me start to think that maybe it couldn't, at least not easily. However in a bit of desperation I created this final proof of concept using the last of my wire:

[img: 250, /images/2018/crank.jpg]

This is just using a spring to act as tension on the wire - and a lot more wire. I made doubly sure there was no excess strain on the wire by first hanging some weights (coins) off the spring. The force required to stretch the spring was well below the wires limit, even though the spring was quite strong.

Well it worked perfectly for the several months of the experiment. Every day I flipped the on/off switch on my power supply and 'actuated' the wire at least two dozen times. Probably a lot more. The wire was then left 'on', ie under strain, for the rest of the day. I honestly didn't see any of the 'weakening' of the wire after an hour or so. It pulled just as strongly on the last day of the test as the first. I often checked the 'throw' with a steel ruler and it stayed at 3.5 mm or so (about 3%) which is about right for the length of wire I used.

**UPDATE: 2018** Again these days I would just use and Arduino to continuously activate and release the wire, followed by long holding periods.

I started thinking about where I had gone wrong before and why all my muscle wire experiments had failed and I have concluded - with no proof of course - that is was likely a combination of:

 1. Not using enough wire. The kit comes with a 5 short lengths of wire. So I naturally  used as little as possible, using lever action to extend the travel distance.

 2. Excess strain. Strain above the wires' limit will kill it. Even once. It may appear to work but its basically stuffed. As you can see, the way I had been using the wire in 1. was probably causing this.

This strain failure can be quite hard to see. I had one recent design where the muscle wire pulled the turnout closed and it seemed to be promising. But after a while it didn't really work quite as well as it did at first. What probably happened - again no proof - is that the wire pulled the turnout closed alright, but then kept pulling against the closed turnout and the strain went way up. A simple spring at one end may have prevented that, but now you have to make sure the springs tension is greater than required to close the point, so the spring only takes up the extra strain. Not hard but not that obvious either.

I'm the first to admit that things could still go wrong so I'm doing a lot more testing. The comments in that forum talk of failure after a few thousand cycles and loss of strength after an hour or so. I have seen no loss of strength, and with the design I will show in my next post, a failure after a few thousand cycles (how long is that in 'real' operating time?) would be easy to fix anyway.

[this long thread]: http://www.model-railroad-hobbyist.com/node/295
