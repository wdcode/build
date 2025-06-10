server=$2
name=$1
ssh root@$server "
cd /data/hosts/$name
rm -rf $name.jar
mv $name.jar~ $name.jar
sh stop.sh
sh start.sh
exit
"