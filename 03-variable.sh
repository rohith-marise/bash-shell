a=10
echo ${a} #This prints a value = 10
Date=$(date)
# Normal parentheses if for to execute/assign a command to variable
#Date=$(date +%F)
#echo "${Date} or $(date +%F)" both are same
# Follower bracket parentheses if we want to do command substitution
# Timestamp=${Date}
echo "Today date is ${Date}"

## Arithmetic Substitution
ADD=$(( 2+2 ))
echo "ADD of 2+2 = ${ADD}"

ts=$(date +%Y%m%d%H%M%S)

echo Timestamp = ${ts}

echo username - $USER
echo env variable abc - $abc
# For this first we have to export env variable to the system using export abc=100