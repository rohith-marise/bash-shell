while [ true ] ; do
  echo " Make sure your using linux system " y/N
read option < /dev/tty
if [ "${option}" == "y" ] ; then
        echo "Welcome to our world of linux team"
else
        echo "Please run this in linux GNU systems only"
        exit 1
fi

read -p "Do you want to rerun the script [y/N]" ans

case "${ans}" in
        [yY]|[Yy][Ee][Ss])
                                continue
                                ;;
        [nN]|[Nn][Oo])
                                break
                                ;;
esac
done