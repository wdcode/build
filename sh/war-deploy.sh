servers=$2
war="$1.war"
name=$1
cd $1
mvn clean package -Pdeploy
cd target
for server in $servers
do
	scp $war root@$server:/data/hosts
	ssh root@$server "
	cd /data/hosts
	rm -rf $name.bak
	mv $name $name.bak
	mkdir $name
	mv $war $name/$name.zip
	cd $name
	unzip $name.zip
	rm -rf $name.zip
	cd WEB-INF/classes/
	/usr/local/tomcat/$name/bin/shutdown.sh
	sleep 1
	/usr/local/tomcat/$name/bin/startup.sh
	exit
	"
done