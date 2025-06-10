war="$1.war"
name=$1
cd $name
mvn clean package -Ptest
cd target
cp $war /Users/wdcode/hosts
cd /Users/wdcode/hosts
rm -rf $name.bak
mv $name $name.bak
mkdir $name
mv $war $name/$name.zip
cd $name
unzip $name.zip
rm -rf $name.zip
cd WEB-INF/classes/
/Users/wdcode/tomcat/$name/bin/shutdown.sh
/Users/wdcode/tomcat/$name/bin/startup.sh
