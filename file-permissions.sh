touch file{01..02}
stat file01
sudo chown -R world file01
chmod 777 file02
umask -S
getfacl
setfacl