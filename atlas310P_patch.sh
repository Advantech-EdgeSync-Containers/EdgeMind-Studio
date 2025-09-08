#!/bin/bash
mkdir -p -m 750 /var/driver /var/dmp /usr/slog
mkdir -p -m 750 /home/drv/hdc_ppc /var/log/npu/slog
export LD_LIBRARY_PATH=/usr/local/Ascend/driver/lib64:/usr/lib64:$LD_LIBRARY_PATH
(
	# ldconfig
	ln -sf /lib /lib64
	id ubuntu &>/dev/null && userdel -r ubuntu
	groupadd -g 1000 HwHiAiUser && useradd -u 1000 -g HwHiAiUser -d /home/HwHiAiUser -m HwHiAiUser
	groupadd -g 1101 HwDmUser && useradd -u 1101 -g HwDmUser -d /home/HwDmUser -m HwDmUser
	chown HwDmUser:HwDmUser /var/dmp
	chown HwHiAiUser:HwHiAiUser /var/driver
	chown HwHiAiUser:HwHiAiUser /usr/slog
	chown HwHiAiUser:HwHiAiUser /home/drv/hdc_ppc
	chown HwHiAiUser:HwHiAiUser /var/log/npu/slog
	LD_LIBRARY_PATH=/usr/local/Ascend/driver/lib64:/usr/lib64 nohup /lib/ld-linux-aarch64.so.1 /var/slogd -d >/dev/null 2>&1 &
	LD_LIBRARY_PATH=/usr/local/Ascend/driver/lib64:/usr/lib64 nohup /lib/ld-linux-aarch64.so.1 /var/dmp_daemon -I -M -U 8087 >/dev/null 2>&1 &
)
PATH_DIR="/opt"
WORK_DIR="${PATH_DIR}/EdgeMindStudio"
PYTHON_SCRIPT="$WORK_DIR/studio-python/run.py"  # 目标 Python 脚本
source /usr/local/Ascend/nnrt/set_env.sh
export LD_LIBRARY_PATH=/usr/lib64:/usr/local/Ascend/nnrt/latest/acllib/lib64:/usr/local/Ascend/driver/lib64:$LD_LIBRARY_PATH
export THIRDPART_PATH=/usr/local/Ascend/thirdpart/aarch64
export PYTHONPATH=/usr/local/Ascend/nnrt/python/site-packages:/usr/local/Ascend/thirdpart/aarch64/acllite:$PYTHONPATH
export INSTALL_DIR=/usr/local/Ascend/nnrt/latest
mkdir /dev/shm/dmp
sleep 1
nohup /var/dmp_daemon -I -M -U 8087 >&/dev/null &
sleep 2
/var/slogd -d
sleep 2

# 1. 检查 Python 版本
if ! command -v python3 &> /dev/null; then
    echo "Python3 未安装，请先安装 Python3。"
    exit 1
fi

# 3. 运行 Python 脚本
if [ -f "$PYTHON_SCRIPT" ]; then
    #echo "运行 Python 脚本：$PYTHON_SCRIPT"
    cd $WORK_DIR/studio-python
    #which python
    python3 $PYTHON_SCRIPT &
else
    echo "error: not exit $PYTHON_SCRIPT"
fi

cd "$WORK_DIR/studio-go"
./EdgeMind-Studio-ARM64

