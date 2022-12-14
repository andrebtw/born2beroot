wall $'#Architecture : '`uname -a`\
$'\n#CPU physical : '`cat /proc/cpuinfo | grep "physical id" | sort | uniq | wc -l`\
$'\n#vCPU : '`lscpu | grep 'CPU(s):                ' | sed 's/CPU(s):                          //g'`\
$'\n'`free -m | awk 'NR==2{printf "#Memory Usage: %sMiB/%sMiB (%.2f%%)", $3,$2,$3*100/$2 }'`\
$'\n'`df -BM --total | grep 'total' | awk '{printf "#Disk Usage : %dMB/%dMB (%s)", $3, $2, $5}'`\
$'\n'`top -bn1 | grep '%Cpu(s):' | sed 's/ni,//g' | awk '{printf "#CPU Load : %.1f%%", 100-$7}'`\
$'\n#Last boot : '`who -b | sed 's/         system boot  //g'`\
$'\n#LVM use : '`lsblk | grep lvm | awk '{if ($1) {print "yes";exit;} else {print "no"} }'`\
$'\n#TCP Connections : '`netstat | grep 'ESTABLISHED' | wc -l`\
$' ESTABLISHED\n#User log : '`who | wc -l`\
$'\n#Network : IP '`hostname -I``ip a | grep 'link/ether' | awk '{printf " (%s)", $2}'`\
$'\n#Sudo cmds ran : '`cat /var/log/auth.log | grep 'sudo' | wc -l | awk '{printf "%d", $1/3}'`
