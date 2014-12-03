#/bin/bash
#a bash script that loops a python script with a delay
#also takes in an argument that goes to the python script

#the usage text
USAGE="to use this script:
bash loop_my_nb.sh  <stop_id> [OPTIONS]

[OPTIONS]:
    -s <sleep_time> :(optional) sets the time to sleep between loops "

function usage {
    echo "$USAGE" #print out the usage stuff
    exit 0 #exit and quit the script
}

#checks first argument ( $1 ) for things. if it isn't a help thing
#then it just continues, and STOP_ID=$1 , if it is blank than it 
#calls the 'usage' function defined above.
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

#checks the second argument ( $2 )
#if it isn't blank it continues to check for flags,
#else it continues and SLEEP_TIME keeps it's default value
if [ "$2" != "" ];then 
    case $2 in             #checks different cases in arg $2
        -s | --sleeptime )     #check for sleep time arg
	    shift                  #shift args so what was $3 is now $2
            if [ "$2" != "" ];then #checks that there is something entered after -s
                SLEEP_TIME=$2      #if there is, set SLEEP_TIME to equal that value
            else    #else tell the user they did it wrong and call 'usage' function
	        echo "please add a sleep time value after the -s or --sleeptime argument!" 
                usage
            fi  ;;
        -h | --help ) usage ;;  #check for help flags, give them 'usage'
        * ) usage ;;  #if they entered some random nonsense (* wildcard), give 'usage'
    esac #end case statement
fi #end if statement


#change this to the name of the python script to loop
PYTHON_SCRIPT="my_nb.py"

echo "now looping the $PYTHON_SCRIPT script. press CTRL+C to cancel"
while [ 1 ]; do  #an infinite while loop
    echo "------------ $(date) ------------" #prints '-'s and the date+time
    python $PYTHON_SCRIPT $STOP_ID #runs the script using 'python'
    echo "remember, press CTRL+C to stop program. :)"
    sleep $SLEEP_TIME #sleeps for a certain time in seconds
done;

