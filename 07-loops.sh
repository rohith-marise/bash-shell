# Two basic loops
# For and while loops

# Based on expression
a=10
while [ ${a} -gt 0 ] ; do
  echo hello
  a=$(( $a - 1 ))
done