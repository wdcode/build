JAVA_HOME=/usr/local/java
JRE_HOME=$JAVA_HOME
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
export JAVA_HOME JRE_HOME CLASSPATH PATH
jar=$1.jar
nohup java -server -Xms2048m -Xmx4096m -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:MaxGCPauseMillis=50 -XX:+UseBiasedLocking -XX:+UseCompressedOops -jar $jar > log.log 2>&1 &
echo $!>pid.txt