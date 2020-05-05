pid=`cat pid.txt`
echo $pid
kill $pid 
rm -f pid.txt
rm -rf log.log