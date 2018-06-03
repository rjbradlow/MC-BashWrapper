# MC-BashWrapper
A simple * nix shell script meant to be a used as a Parental control of when Minecraft is allowed to run on a Linux PC.
It acts as an intermediary between the user and the Minecraft launcher to only allow starting the game after a certain time on certain days and to kill the game at a certain time. 
It is Most useful for Homeschoolers who have MC on the same machine they learn on to make sure children are not sneaking in gametime when left unattended, as it will show / inform the user that the game is not currently allowed to be run and when it will be allowed. 

When allowed, it sets an expiration time of when the game will be forcibly killed, starts the official minecraft launcher and a time watchdog function. 

This script does not account for Holidays.
While this script can be easily bypassed on the command line as most older kids already know,
I wrote this for the ones who don't (my kid) and I link it to a menu launcher with a MC icon that runs it in the terminal.
The script must be placed it in your local PATH (bin folder) so it can be run on the command line either by typing mc and pressing enter or using a menu launcher to call it.

When the minecraft launcher.jar file is executed it starts up one instance of java for itself.
When the user clicks the play button, the launcher invokes another java instance for the game. 
Now there are 2 separate java instances running with their own Process ID's (PID). 
Both instances must be killed in order for the game to sanely stop.
You will never see a 'Minecraft' process on a Linux machine since the only version of Minecraft that runs on Linux are the Java versions and thus run as 'java' in the process list.

kill $(pgrep java)

NOTE: According to your schedule this script kills ALL running java process' at the end of a scheduled window of playtime since this script currently has no way to isolate which which java processes belong directly to Minecraft as mentioned above.

The script is well commented and should be simple enough for anyone to follow. 
You don't need a .sh extension to execute it provided that you don't forget to place it in your ~./bin folder and chmod +x it! 

Enjoy!
