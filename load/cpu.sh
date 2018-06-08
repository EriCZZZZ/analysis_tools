#!/bin/bash

# cpu core number
cpu_core=0

# cal cpu core number
tmp=`cat /proc/cpuinfo | grep processor`

OLD_IFS="$IFS"
IFS=":"
arr=( $tmp )
IFS="$OLD_IFS"
for s in ${arr[@]}
do
	((cpu_core=$cpu_core+1))
done

((cpu_core=cpu_core/2))

echo "核数"$cpu_core

echo "=========="

# vmstat
eval "vmstat 1 2 | awk 'END {printf(\"等待运行的进程数 %d\n\
被阻塞的进程数 %d\n\
每秒中断数 %d\n\
每秒上下文切换数 %d\n\
用户cpu %d%%\n\
系统cpu %d%%\n\
空闲cpu %d%%\n\
等待IOcpu %d%%\n\
VM偷取cpu %d%%\n\
\", \$1, \$2, \$11, \$12, \$13, \$14, \$15, \$16, \$17)}'"
echo "=========="
