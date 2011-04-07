SimpleDesktop Grabber
=====================

A basic utility that downloads images from http://simpledesktops.com to ~/Pictures/desktops/simple_desktops.

YMMV

To Use
======

1. Clone the repository
2. Fire up irb
3. require 'simple_desktop_grabber'
4. SimpleDesktopGrabber::Parser.new('http://simpledesktops.com/browse')

Bonus
=====

System Preference => Desktop => Add the simple_desktops folder => Change picture every 15 minutes => Random Order