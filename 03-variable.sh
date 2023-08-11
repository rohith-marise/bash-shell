a=10
echo ${a} #This prints a value = 10
Date=$(date)
# Normal parentheses if for to execute/assign a command to variable
# Follower bracket parentheses if we want to do command substitution
# Timestamp=${Date}
echo "Today date is ${Date}"

## Arithmetic Substitution
ADD=$(( 2+2 ))
echo "ADD of 2+2 = ${ADD}"