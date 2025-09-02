---
date: 2015-01-02 12:00
tags: Arduino, DCC
subtitle: Using Arduino microcontrollers to send and monitor dcc signals
---

# Sending DCC With An Arduino

In my last post I mentioned that I now have 2 Arduino controller boards for experimenting with creating my own DCC command station, booster and DCC decoder. However, one of the problems with developing your own software and hardware that works together is that when something doesn’t work it can be difficult to figure out just where the problem is.

To help get around this I figured that it should be possible to simplify things by hooking two Arduinos directly together and send DCC commands from one to the other. This would at least ensure that the software was working before even having to think about the electronics.

So that’s what I did, and it worked!

<!--more-->

In my research on Arduinos and DCC I came across two sites which helped me get started. 
The first, [OScale.net] \(**UPDATE:** The OScale link is broken - see below\), has code and circuitry for a very simple DCC command station and booster, and the other, [MynaBay] \(**UPDATE:** This link is also broken - see below\), has code and circuitry for a DCC monitor. Even though I have all the parts for the electronics for both circuits, I decided at first to simply hook my two Arduinos together and see if I could detect a DCC signal from the ‘command’ Arduino using the other Arduino as a monitor.

The set up is really simple. I first loaded the monitor software into an Arduino and ran it. The serial window within the Arduino IDE, as expected, showed no DCC. I then loaded the transmitting code into another Arduino and connected the Arduinos together using two wires, one connecting ground together and the other connecting pin 4 of the transmitter to pin 2 of the receiver. I don’t think there is anything special about these pins, but if you look at the code this is what the original authors have defined as DCC_Out and DCC_In respectively.

Sure enough, the monitor started showing 'idle' DCC packets being received!

**UPDATE:** I have a copy of both the OScale and MynaBay software at my [GitHub Repository].

**UPDATE:** Here is a picture of the setup.

[img: 250, /images/2015/two-arduinos.jpg]

[OScale.net]: http://www.oscale.net/en/simpledcc
[MynaBay]: http://www.mynabay.com/dcc_monitor/
[GitHub Repository]: https://github.com/nscalemodeller

[two-arduinos-small]:/assets/2015/two-arduinos-small.jpg 
[two-arduinos]: /assets/2015/two-arduinos.jpg "Click to Enlarge"
