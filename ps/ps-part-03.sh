kill # послать сигнал процессу 
kill 991 # по умолчанию отправляется сигнал #15 - SIGTERM (мягкое завершение)
kill -SIGKILL 991 # грубое завершение - #9 - SIGKILL

pkill -9 firefox # поиск по шаблону firefox