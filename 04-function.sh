# Variable and Functions are similar
# If we assign a name to certain data then it is called variable
# If we assign a name to certain commands then it is called function

welcom() {
  echo "Hi"
#  exit 1
# return 10
   echo "Hello good day !"
  # We can give exit status to a function like here exit 1
  # If we give return it wont exit from the script, it just exit from that function
}
# We have to declare function first before using it
welcom
echo function Exit Status  = $?