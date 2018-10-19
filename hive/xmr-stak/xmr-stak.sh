#!/usr/bin/env bash
cd `dirname $0`

#[[ -e amd.txt ]] && rm amd.txt
#[[ -e cpu.txt ]] && rm cpu.txt
#[[ -e nvidia.txt ]] && rm nvdia.txt

fork=$1
[[ -z $fork ]] && fork="fireice-uk"

#-c config.txt --cpu cpu.txt --amd amd.txt --nvidia nvidia.txt $@
# Path to libs
export LD_LIBRARY_PATH=./$fork:/hive/lib

# Memory pool tuning
export GPU_FORCE_64BIT_PTR=1
export GPU_MAX_HEAP_SIZE=100.
export GPU_MAX_ALLOC_PERCENT=100.
export GPU_SINGLE_ALLOC_PERCENT=100

# Miner run here
./$fork/xmr-stak


#Usage: xmr-stak [OPTION]...
#
#  -h, --help            show this help
#  -v, --version         show version number
#  -V, --version-long    show long version number
#  -c, --config FILE     common miner configuration file
#  --currency NAME       currency to mine: monero or aeon
#  --noCPU               disable the CPU miner backend
#  --cpu FILE            CPU backend miner config file
#  --noAMD               disable the AMD miner backend
#  --amd FILE            AMD backend miner config file
#  --noNVIDIA            disable the NVIDIA miner backend
#  --nvidia FILE         NVIDIA backend miner config file
