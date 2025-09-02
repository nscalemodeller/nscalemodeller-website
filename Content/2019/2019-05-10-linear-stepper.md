---
date: 2019-05-10 12:00
tags: Turnout Control, Linear Stepper Motors
top_post: true
subtitle: Using stepper motors to operate model rail turnouts
---

# Linear Stepper to Operate Turnouts

After being a bit disappointed with both my [muscle wire] and [servo] experiments to operate turnouts, I started doing a bit of research on linear actuators. While most were very expensive, I eventually stumbled on some at AliExpress by searching for the term ‘Miniature Slide Screw Stepper’ or 'linear stepper' and various combinations of similar words. They looked ideal so I bought some, similar to these:

<!--more-->

[img: 500, /images/2019/stepper-screw-slider.jpg]

I ended up spending quite a bit of time trying to figure out how to mount these things and attach some mechanism to the slide to move a turnout. 

[img: 350, /images/2019/stepper-experiments.jpg]

Unfortunately they were so small that they were very difficult to work with. None of the motors came with wires attached, so I had to - delicately - solder some wires to the motor and create some sort of mount to support the wires since the connection to the motor was so fine. Even soldering wires was a real problem as more than a few seconds of heat basically destroyed the motor connection points as they were attached with plastic.

Another issue was that the slide that travelled along the screw just ‘sat’ on the slide screw so it could easily jump if there was too much pressure preventing the slide from moving. This meant that it was impossible to really know exactly where the slide was on the screw unless you were very careful.

They did work though. And they were quiet and easy to control, so I decided to buy some bigger ones and eventually came across these:

[img: 350, /images/2019/stepper-screw-large.jpg]

Even though they didn’t come with a slide, I thought the groove in the screw was deep and wide enough that I could use a piece of spring wire sitting in the groove as the slider. They were pretty cheap at about USD1.50 as well. And they came with an FPC type connector for easy soldering. For reference, the diameter of the screw is about 3mm.

I ended up buying a few and after a bit of experimentation finally had something that worked well. Here is what I came up with:

[img: 100, /images/2019/mounted-stepper-side.jpg,/images/2019/mounted-stepper-bottom.jpg]

They are a bit big and clunky but I am sure with a bit of work I can come up with a better form factor.

**HOW IT WORKS** 

Using pliers, make a right angle bend in a length of thin spring wire, about 10mm from the end. Make a further 'hook' right at the end of the wire'. This hooked part fits in a hole in the turnout throw bar. 

Drill a hole through the turnout from the top, just behind the throw bar (~8mm, but measure it), so that when the spring wire is passed through the hole, the hooked part fits in the throwbar hole. Twisting this wire from below should throw the turnout.

Position and glue the motor to the bottom of the turnout so that the wire is about 10mm from the motor screw. I had to use spacers to support the motor because the motor hung a bit below the base of the slider. Bend the wire again so that it rests on top of the screw with a bit of tension, which holds the wire in place. Cut the wire to length.

Turning the stepper screw by hand should now make the turnout move. It will only require a few turns.

**IMPORTANT:** Before hooking the stepper up to some sort of motor control you should really know what you are doing, since an out of control stepper could damage the turnout. You need to be able to make it turn one step at a time in either direction.


[muscle wire]: /2018/2018-05-21-muscle-wire-update
[servo]: /2018/2018-04-15-rc-servos
