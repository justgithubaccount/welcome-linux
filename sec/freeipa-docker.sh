docker pull freeipa/freeipa-server:almalinux-9

docker run --name freeipa/freeipa-server -ti -h in.snowsync.ru --read-only -v /var/lib/ipa-data:/data:Z freeipa-server [ opts ]