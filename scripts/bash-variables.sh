getDate=date
$getDate
echo $getDate

getText="Hello World"
echo $getText

files="file1 file2 file3"
myFiles="My files are $files"
echo $myFiles

getPasswdUsers=$(tail -5 /etc/passwd | head -10)
echo $getPasswdUsers

# environment variables
env
env | grep LANG
LANG=ru_RU.UTF-8
echo $HOME
echo $HOSTNAME
echo $USERNAME
env | grep PATH