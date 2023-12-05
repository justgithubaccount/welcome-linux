# https://github.com/justgithubaccount/welcome-ansible

# run playbook
ansible-playbook install-jenkins.yml -l jenkins --check
ansible jenkins -m shell -a "cat /var/lib/jenkins/secrets/initialAdminPassword"

# inventory
ansible-inventory --list
ansible-inventory --graph

# basic
ansible-doc -l | grep web

ansible jenkins -m ping

ansible jenkins -m setup

ansible jenkins -m shell -a "cat /etc/os-release"
ansible jenkins -m shell -a "hostname && hostname -I && uptime"

ansible jenkins -m shell -a "hostnamectl set-hostname jenkins"
ansible jenkins -m shell -a "apt update -y"
ansible jenkins -m shell -a "reboot"

ansible all -m shell -a "ls /home"

ansible jenkins -m copy -a "src=install-jenkins.yml dest=/home mode=664" -b

ansible jenkins -m file -a "path=/home/install-jenkins.yml state=absent" 
ansible jenkins -m file -a "path=/home/ansible.cfg state=absent"

ansible jenkins -m get_url -a "url=https://td.telegram.org/tlinux/tsetup.4.12.2.tar.xz dest=/home"

ansible jenkins -m apt -a "name=fontconfig state=latest" -b
ansible jenkins -m apt -a "name=fontconfig state=removed" -b

ansible jenkins -m apt -a "name=httpd state=removed" -b
ansible jenkins -m service -a "name=httpd state=started enabled=yes" -b

# debug

ansible jenkins -m shell -a "cat /etc/os-release" -v
ansible jenkins -m shell -a "cat /etc/os-release" -vv
ansible jenkins -m shell -a "cat /etc/os-release" -vvv
ansible jenkins -m shell -a "cat /etc/os-release" -vvvv
ansible jenkins -m shell -a "cat /etc/os-release" -vvvvv