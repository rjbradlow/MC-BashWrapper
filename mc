#!/bin/bash

# dow = Day Of Week (w=0-6 / Sun=0 - Sat=6) and hod = Hour of day (H=0-24 Hour)
# Ref the date manual page for an explanation of the variables used here. (man date)
# KILL Minecraft on schedule: kill $(pgrep java) ... pulls and kills all java PIDs.
# NOTE: This script kills ALL java apps at the end of your schedule (heresJohhny).
# 
# If your kids play on their own PC, You can change the usrname to your child's name, otherwise if
# you have more than one child fighting over game time on the same PC, you'll just have to be creative
# here or leave it as is.

usrname="Minecraftian"
dow=$(date +%w)
hod=$(date +%-H)
clocaltime=$(date +%r)
clhour=$(date +%l)
clmin=$(date +%M)
clap=$(date +%p)
cdayname=$(date +%A)
cmonth=$(date +%B)
cday=$(date +%e)
cyear=$(date +%Y)

# mchammer is an internal system time checking function that Kills MC according to heresJohhny
# instead of running a cron job or some other nonsense. It is set to check the time every 10 seconds
# because I didn't want it running crazy and I didn't want to wait any longer to kill MC.
# You can change the value of sleep, but it's just gonna take Johnny that much longer to kill Herobrine
# After the time runs out. i.e.; There will be a Delay before the game actually ends. He's not punctual
# and the higher you set the sleep value the later he will sleep in... So I do not reccomend changing this.

mchammer ()
{
  clh=$(date +%H)
  until [ $clh -eq $heresJohhny ]
  do
  clh=$(date +%H)
  sleep 10s
 jpid=$(pgrep java)
 if [ -z "$jpid" ]
  then 
  exit
 fi  
  
done
kill $(pgrep java)
}

# dow: 0=Sun 1=Mon 2=Tue 3=Wed 4=Thu (-le=less than or equal to) &&=And
# hod: -ge=Greaterthan or Equal to 1500 (3pm) -lt=LessThan 2100 (9pm)
# IF it is Sunday-Thursday AND between 3-9pm, the game will launch & then end at 9pm. 
# NOTE: The single space and amperstand at the end of the jar jar binks command is mandatory
# to 'Background' the java process' out so that the mchammer function will engage and call Johnny.

if [ $dow -le 4 ] && [ $hod -ge 15 -a $hod -lt 21 ]
then
heresJohhny=21
java -jar ~/.minecraft/launcher.jar &
mchammer
exit

# here we have friday still begins at 3pm but now ends at midnight
# and Saturday begins at 8 am and ends at midnight... and so does MC.
elif [ $dow -eq 5 ] && [ $hod -ge 15 ] || [ $dow -eq 6 ] && [ $hod -ge 8 ]
then
heresJohhny=00
java -jar ~/.minecraft/launcher.jar &
mchammer
exit 

else

clear
# Here's the message displayed in the terminal only when Minecraft is NOT alllowed to be run.
echo
echo
echo -e "\033[1m Hello ${usrname}!\e[0m"
echo "It is curently ${clhour}:${clmin} ${clap}, on ${cdayname} ${cmonth}, ${cday} ${cyear}."
echo
echo -e "\033[41m Minecraft will only run between 3-9pm on school nights M-Th & Sun., 3pm-midnight on Fri., and from 8am to midnight on Sat.\e[0m"
echo

fi

exit
