
Date=$(date +%Y%m%d)
Dir=/tmp
Log_file=$Dir.$0.$Date.log
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
  echo -e "$2 -->${G}suceess${W}"
  fi
}


yum install maven -y &>>$Log_file
Validate $? "Installing maven package"

id roboshop &>>$Log_file
if [ $? -ne 0 ] ; then
useradd roboshop &>>$Log_file
Validate $? "Adding roboshop user"
fi

if [ ! -e /app ] ; then
mkdir /app &>>$Log_file
Validate $? "Creating app directory"
fi


curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip &>>$Log_file
Validate $? "Downloading shipping component content"


cd /app &>>$Log_file
unzip /tmp/shipping.zip &>>$Log_file
Validate $? "Extracting shipping component content"

mvn clean package &>>$Log_file
Validate $? "Building shipping component"

mv target/shipping-1.0.jar shipping.jar &>>$Log_file
Validate $? "Moving built shipping component"

mv /home/centos/learn-shell/shipping.service /etc/systemd/system/shipping.service &>>$Log_file
Validate $? "Creating an shipping service file"

systemctl daemon-reload &>>$Log_file
Validate $? "Reloading the serive files "

systemctl enable shipping &>>$Log_file
Validate $? "Enableing the shipping component service "

systemctl start shipping &>>$Log_file
Validate $? "start shipping component"

yum install mysql -y &>>$Log_file
Validate $? "Insatlling my sql"

mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/schema/shipping.sql &>>$Log_file
Validate $? "Loading the schema"

systemctl restart shipping &>>$Log_file
Validate $? "Restart shipping service "