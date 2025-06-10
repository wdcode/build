jar="$1.jar"
name="$1"
cd $name
mvn clean package -Ptest,jar
cd target
rm -rf /home/wdcode/hosts/$name/$jar
cp $jar /home/wdcode/hosts/$name
cp -r lib /home/wdcode/hosts/$name/lib1
cd /home/wdcode/hosts/$name
cp -r lib lib.bak
rm -rf lib
cp -r lib1 lib
rm -rf lib1 
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