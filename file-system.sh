cat /sys/class/block/sdc/queue/physical_block_size
cat /sys/class/block/sdc/queue/logical_block_size
iostat 
modinfo ext4 | head