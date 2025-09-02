---
date: 2015-01-09 12:00
tags: Arduino, DCC, DCC Command Station
subtitle: Using Arduino microcontrollers to send and monitor dcc signals
---

# Thinking About a Command Station

In the discussion below to keep everything straight as to which code I am talking about: 

* Communication from a PC (in my case a Mac) to the Arduino I’ll call a ‘command’.
* Communication from the Arduino to the booster I’ll call a ‘packet’.
* A message or message packet is a ‘command’ packet as distinguished from an idle packet.

The overriding philosophy of my command station will be to keep the code in the Arduino as simple as possible and have most of the smarts in the software running on the Mac. With this in mind, probably the simplest possible command station for the Arduino would be code to accept a new command from a Mac (or PC) via the serial port, convert this command to a valid DCC packet, and then continuously send this packet to the booster. However, while this would probably work, it would be out of spec because the [NMRA standard S 9.2 (line 116)] says:

<!--more-->

* A Digital Decoder shall be able to act upon multiple packets addressed to it, provided the time between the packet end bit of the first packet and the packet start bit of the second packet are separated by at least 5 milliseconds.*

* *Care must be taken to ensure that two packets with identical addresses are not are not transmitted within 5 milliseconds of each other for addresses in the range between 112-127 as older decoders may interpret these packets as service mode packets (see RP-9.2.3)

Fortunately it turns out that an idle packet takes about 6.25ms to send, so it looks like the Arduino code would be in spec if it continuously sent a message packet followed by an idle packet. An optimisation of this would be that when when the Arduino receives a second command from the PC it alternates between sending this new message and the old message rather than always alternating between a message and idle packet. However, a complication of this optimisation is that the two messages could conflict with each other, especially if they are to the same decoder address. For instance, one message could be telling a decoder to switch on while the other message could tell it to switch off! This is because in the above simple example, the Arduino will keep sending the same message until the next command is received from the PC. If a command is sent to switch a decoder ‘on’ and no other command is sent before an ‘off’ command is sent – even if sent much later – the Arduino software will start alternating between the two messages at over a hundred times a second, something we want to avoid!

A simple way around this would be to make sure an idle command is always sent between two conflicting commands. Of course the PC software will also have to make sure that conflicting commands aren’t sent close together, even if there is an idle sent in between, as the result will be the same but just a bit slower.

So, it would appear that a simple command station could consist of an Arduino storing just two messages and alternately sending each one. When a new command arrives on the serial port the oldest message is replaced with the new one. And so on…. 

Another part of the DCC standard (in a line just before the above) says:

* Packets sent to Digital Decoders should be repeated as frequently as possible, as a packet may have been lost due to noise or poor electrical conductivity between wheels and rails.

What this means in practice I am not sure, but to me it means that the software on the PC has to either limit the pace at which new commands are sent so that the last command can be sent multiple times, or alternatively if there are lots of commands to be sent, the software remembers to re-send old commands a number of times by interleaving them with new commands.

So that is where I’ll start with my Command Station. I intend to modify the Arduino ‘transmitting’ code mentioned in the [previous post] to accept commands from my Mac and I’ll monitor the results using the DCC monitor code on my other Arduino. After I get something working I’ll post it here.

[NMRA standard S 9.2 (line 116)]: http://www.nmra.org/index-nmra-standards-and-recommended-practices
[previous post]: /2015/2015-01-02-sending-dcc-with-arduino
