servers=$2
name=$1
for server in $servers
do
	ssh root@$server "
	cd /data/hosts
	rm -rf $name
	mv $name.bak $name
	/usr/local/tomcat_$name/bin/shutdown.sh
	/usr/local/tomcat_$name/bin/startup.sh
	exit
	"
done