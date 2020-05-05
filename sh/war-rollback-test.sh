server=$2
name=$1 
ssh root@$server "
cd /data/hosts
rm -rf $name
mv $name.bak $name
/usr/local/tomcat_$name/bin/shutdown.sh
/usr/local/tomcat_$name/bin/startup.sh
exit
"