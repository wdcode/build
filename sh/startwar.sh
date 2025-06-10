jar=$1.war
nohup java -server -Xms2048m -Xmx4096m -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:MaxGCPauseMillis=50 -XX:+UseBiasedLocking -XX:+UseCompressedOops -jar $jar > log.log 2>&1 &
echo $!>pid.txt
