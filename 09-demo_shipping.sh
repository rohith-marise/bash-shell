#DATE=$(date +%F)
#LOGSDIR=/tmp
## /home/centos/shellscript-logs/script-name-date.log
#SCRIPT_NAME=$0
#LOGFILE=$LOGSDIR/$0-$DATE.log
Date=$(date +%Y%m%d)
Dir=/tmp
LOGFILE=$Dir/$0-$Date.log
User_id=$(id -u)
R="\e[31m"
G="\e[32m"
W="\e[0m"
M="\e[35m"

if [ ${User_id} -ne 0 ] ; then
echo "Please run the script using root access"
exit 1
fi

Validate() {
  if [ $1 -ne 0 ] ; then
  echo -e "$2 -->${R}Failure${W}"
  else
  echo -e "$2 -->${G}success${W}"
  fi
}


yum install maven -y &>>$LOGFILE
Validate $? "Installing maven package"

id roboshop &>>$LOGFILE
if [ $? -ne 0 ] ; then
useradd roboshop &>>$LOGFILE
Validate $? "Adding roboshop user"
fi

if [ ! -e /app ] ; then
mkdir /app &>>$LOGFILE
Validate $? "Creating app directory"
fi


curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip &>>$LOGFILE
Validate $? "Downloading shipping component content"


cd /app &>>$LOGFILE
unzip /tmp/shipping.zip &>>$LOGFILE
Validate $? "Extracting shipping component content"

mvn clean package &>>$LOGFILE
Validate $? "Building shipping component"

mv target/shipping-1.0.jar shipping.jar &>>$LOGFILE
Validate $? "Moving built shipping component"

cp /home/centos/learn-shell/shipping.service /etc/systemd/system/shipping.service &>>$LOGFILE
Validate $? "Creating an shipping service file"

systemctl daemon-reload &>>$LOGFILE
Validate $? "Reloading the serive files "

systemctl enable shipping &>>$LOGFILE
Validate $? "Enableing the shipping component service "

systemctl start shipping &>>$LOGFILE
Validate $? "start shipping component"

yum install mysql -y &>>$LOGFILE
Validate $? "Insatlling my sql"

mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/schema/shipping.sql &>>$LOGFILE
Validate $? "Loading the schema"

systemctl restart shipping &>>$LOGFILE
Validate $? "Restart shipping service "