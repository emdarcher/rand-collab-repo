my_nb
=====

###my_nb.py :
this script gets the latest bus top time predictions from nextbus.com
use by doing `python my_nb.py <stopId>` where stopID is the 
ID of your stop that is used by nextbus.com
links to find your stop's ID # under your local agency
can be found at the bottom of this page:
  http://www.nextbus.com/wirelessConfig/sms.jsp
for example, the ID number for SF MUNI 29 Sunset Line
 inbound at Lake Merced and Middlefield Dr. is 14838
 and outbound is 14839
to use that ID just run this command:
` python my_nb.py 14838`
and then it should show the next couple of predictions.
example output
```
(11:37 left) 29-Sunset -> Inbound to Baker Beach
(31:33 left) 29-Sunset -> Inbound to Baker Beach
(50:0 left) 29-Sunset -> Inbound to Baker Beach
(70:15 left) 29-Sunset -> Inbound to Baker Beach
```

###loop_my_nb.sh :
this is a bash shell script that loops the `my_nb.py` program
every few seconds (time delay can be set in the script by changing
the `SLEEP_TIME` variable.
use like you would the `my_nb.py` script by putting the stop id after
the program as the first argument like `bash loop_my_nb.sh <stop_id> `
An example with same stop id as above:
  `bash loop_my_nb.sh 14838`
example output
```
now looping the my_nb.py script. press CTRL+C to cancel
------------ Mon Dec  1 23:25:23 PST 2014 ------------
(13:10 left) 29-Sunset -> Inbound to Baker Beach
(32:42 left) 29-Sunset -> Inbound to Baker Beach
(51:9 left) 29-Sunset -> Inbound to Baker Beach
(71:19 left) 29-Sunset -> Inbound to Baker Beach
remember, press CTRL+C to stop program. :)
```

###loop_my_nb_adv.sh :
This is a slightly more advanced version of the `loop_my_nb.sh` script that adds the ability to set the loop delay in the command line arguments. In addition it has built in help and usage info, and extra user-error detection.
use like the `loop_my_nb.sh` script or set the amount of seconds to delay between loops of the `my_nb.py` program using the `-s` or `--sleeptime` flags, also you can get usage help by using the `-h` or `--help` flags.
usage: `bash loop_my_nb_adv.sh <stop_id> [[[-s | --sleeptime] <sleep_time>] | -h]`

example using stop id 14838 and a delay between loops of 5 seconds:
`bash loop_my_nb_adv.sh 14838 -s 5` or `bash loop_my_nb_adv.sh 14838 --sleeptime 5`
or  `./loop_my_nb_adv.sh 14838 -s 5` if using on a Unix-based system with `/bin/bash`
example output:
```
now looping the my_nb.py script with a delay of 3 seconds. 
press CTRL+C to cancel
------------ Tue Dec  2 21:43:08 PST 2014 ------------
(8:16 left) 29-Sunset -> Inbound to Baker Beach
(30:7 left) 29-Sunset -> Inbound to Baker Beach
(53:53 left) 29-Sunset -> Inbound to Baker Beach
(81:9 left) 29-Sunset -> Inbound to Baker Beach
remember, press CTRL+C to stop program. :)
```
 
