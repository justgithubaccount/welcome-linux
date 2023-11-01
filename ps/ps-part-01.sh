# basic (-e для всех пользоватлей, -f - доп. инфа)
ps 
ps -ef
ps -ef | less -S
ps -ef | grep firefox
ps -ef | grep firefox | less -S
ps -f 991 # ppid
watch "ps -ef | grep firefox"

cd /proc

cat /proc/version
cat /proc/uptime

cd /proc/991
cat cmdline
cat environ
cat status