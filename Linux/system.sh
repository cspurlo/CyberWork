#! /bin/bash
#Print the amount of free memory
free -h > ~/backups/freemem/free_mem.txt
#Print disk usage
du -h > ~/backups/diskuse/disk_usage.txt
#List all open files
lsof > ~/backups/openlist/open_list.txt
#Print file system disk space statistics
df -h --total > ~/backups/freedisk/free_disk.txt

