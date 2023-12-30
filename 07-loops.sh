# Two basic loops
# For and while loops

#  Based on expression
a=10
while [ ${a} -gt 0 ] ; do
  echo hello
  a=$(( ${a} - 1 ))
  #break # This command can break the loop
done

# For loop script make sure you have a names.txt file with some names
#for i in $(cat names.txt) ; do
# echo "Hi ${i}"
#done
#
#please give this script in for loop in different forms

array=("Happie" "Bakshu" "Mothi")
for i in ${array[@]} ; do
        echo "This is agent dog $i"
        sleep 1
done

# OR

#for i in Happie Bakshu Mothi ; do
#        echo "This is agent dog $i"
#done