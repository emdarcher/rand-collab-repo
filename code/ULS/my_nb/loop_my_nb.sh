#/bin/bash
#a bash script loops a python script

#variable to set the amount of seconds to sleep between looping
SLEEP_TIME=2

#this variable takes in argument number 1, which is the stop id
STOP_ID=$1

#change this to the name of the python script to loop
PYTHON_SCRIPT="my_nb.py"

echo "now looping the $PYTHON_SCRIPT script. press CTRL+C to cancel"
while [ 1 ]; do  #an infinite while loop
    echo "------------ $(date) ------------" #prints '-'s and the date+time
    python $PYTHON_SCRIPT $STOP_ID #runs the script using 'python'
    echo "remember, press CTRL+C to stop program. :)"
    sleep $SLEEP_TIME #sleeps for a certain time in seconds
done;
