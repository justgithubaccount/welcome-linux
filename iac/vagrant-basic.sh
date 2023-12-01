vagrnt init debian/bookworm64

vagrant up
vagrant halt
vagrant destroy 

vagrant ssh

vagrant box add debian/bookworm64
vagrant box list
vagrant box remove debian/bookworm64