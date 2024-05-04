wget https://download-cdn.jetbrains.com/python/pycharm-community-2024.1.1.tar.gz -P ~/downloads

tar -xf ~/downloads/pycharm-community-2024.1.1.tar.gz

mv ~/downloads/pycharm-community-2024.1.1 ~/downloads/pycharm-community-2024

mv ~/downloads/pycharm-community-2024 ~/apps 

cat > ~/.local/share/applications/jetbrains-pycharm.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm
Icon=/home/jenya/apps/pycharm-community-2024/bin/pycharm.png
Exec="/home/jenya/apps/pycharm-community-2024/bin/pycharm.sh" %f
Comment=The Drive to Develop
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-pycharm-ce
EOF

chmod +x ~/.local/share/applications/jetbrains-pycharm.desktop