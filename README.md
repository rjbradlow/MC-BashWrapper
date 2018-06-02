# MC-BashWrapper
A simple * nix shell wrapper to run and kill Minecraft on a schedule.

When the minecraft launcher.jar file is executed it starts up one instance of java for itself.
When the user hits the play button, the launcher invokes another java instance for the game. 
Now there are 2 separate java instances running with their own pid (Process ID). 
You will never see a "Minecraft" process since it is a JVM.

NOTE: This script kills ALL running java apps at the end of a scheduled window of playtime.

This script does not count for Holidays and can be too easily bypassed by just entering 
java -jar ~/.minecraft/launcher.jar on the command line. No doubt most kids already know this
but I wrote this for the ones who don't (my kid) and I link it to a menu launcher with a MC icon.
By placing it in your local PATH (bin folder) it can also be run on the command line by typing mc and pressing enter.

You could duplicate, rename & modify this script for holiday schedules. Call it mch

The script is well commented and simple enough for anyone to follow. You don't need a .sh extension to execute it.
Don't forget to chmod +x it! 

Enjoy!
