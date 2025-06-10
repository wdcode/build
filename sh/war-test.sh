war="$1.war"
name="$1"
cd $name
mvn clean package -Ptest
cd target
cp $war /home/wdcode/hosts
cd /home/wdcode/hosts
rm -rf $name.bak
mv $name $name.bak
mkdir $name
mv $war $name/$name.zip
cd $name
unzip $name.zip
rm -rf $name.zip
cd WEB-INF/classes/
/home/wdcode/tomcat/$name/bin/shutdown.sh
/home/wdcode/tomcat/$name/bin/startup.sh