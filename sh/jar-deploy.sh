servers=$2
jar="$1.jar"
name=$2
cd $1
mvn clean package -Pdeploy,jar
cd target
for server in $servers
do
	scp $jar root@$server:/data/hosts/$name 
	scp -r lib root@$server:/data/hosts/$name/lib1
	ssh root@$server "
	cd /data/hosts/$name
	cp -r lib lib.bak
	rm -rf lib
	cp -r lib1 lib
	rm -rf lib1
	mv -b $jar $name.jar
	rm -rf db*
	mkdir 1
	cp $name.jar 1
	cd 1
	unzip $name.jar 
	cp -r db ../ 
	cp config.properties ../
	cd ..
	rm -rf 1
	sh stop.sh
	sleep 1
	sh start.sh
	exit
	"
done