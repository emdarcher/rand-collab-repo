#/bin/bash
#a bash script loops a python script

USAGE="to use this script:
bash loop_my_nb.sh  <stop_id> [OPTIONS]

[OPTIONS]:
    -s <sleep_time> :(optional) sets the time to sleep between loops "

function usage {
    echo "$USAGE"
    exit 0
}

if [ "$1" != "" ];then
    case $1 in 
        -h | --help) usage;;
    esac 
else 
    usage
fi 

#this variable takes in argument number 1, which is the stop id
STOP_ID=$1

#variable to set the default amount of seconds to sleep between looping 
SLEEP_TIME=5

if [ "$2" != "" ];then
    case $2 in 
        -s | --sleeptime ) shift
	    if [ "$2" != "" ];then
                SLEEP_TIME=$2
            else
	        echo "please add a sleep time value after the -s or --sleeptime argument!" 
                usage
            fi
            ;;
        -h | --help ) usage
            ;;
        * ) usage
    esac
fi


#change this to the name of the python script to loop
PYTHON_SCRIPT="my_nb.py"

echo "now looping the $PYTHON_SCRIPT script. press CTRL+C to cancel"
while [ 1 ]; do  #an infinite while loop
    echo "------------ $(date) ------------" #prints '-'s and the date+time
    python $PYTHON_SCRIPT $STOP_ID #runs the script using 'python'
    echo "remember, press CTRL+C to stop program. :)"
    sleep $SLEEP_TIME #sleeps for a certain time in seconds
done;

