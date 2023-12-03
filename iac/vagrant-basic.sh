# Initialize Vagrantfile
vagrant init debian/bookworm64

# Manage
vagrant up
vagrant halt
vagrant destroy 

# Connect to VM
cd ~/github/welcome-vagrant/jenkins-srv
vagrant ssh

# Debug
# Error - vagrant@127.0.0.1: Permission denied (publickey).
vagrant ssh --debug
vagrant ssh -- -vvv

# Manage Boxes (OS)
vagrant box add debian/bookworm64
vagrant box list
vagrant box remove debian/bookworm64