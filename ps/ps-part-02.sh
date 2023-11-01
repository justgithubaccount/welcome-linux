top # список процессов, которые используют большую часть ресурсов
w # инфо о залогиненных юзерах

cat /proc/sys/kernel/pid_max # ограничение на кол-во процессов
ulimit -u # ограничение на кол-во процесов для юзера
# задать ограчение для кол-ва процессов для юзера (в файле ~/.bash_profile)
# как правило, ограничения устанавливаются в файле /etc/security/limits.conf
# либо внутри директории /etc/security/limits.d/ создаётся файл, заканчивающийся на .conf
# параметр nproc
ulimit -u 1024
cat /etc/security/limits.conf | grep nproc

nice -n 5 firefox # запустить firefox с приоритетом 5 (относится к ni – nice cpu time)
ps -el | grep firefox # посмотреть текущий приоритет
renice -n 10 991 # ppid - 991

# красивое
sudo apt install htop -y
htop