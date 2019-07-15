#!/bin/bash

readonly FILE32=https://dl.espressif.com/dl/xtensa-lx106-elf-linux32-1.22.0-88-gde0bdc1-4.8.5.tar.gz
readonly FILE64=https://dl.espressif.com/dl/xtensa-lx106-elf-linux64-1.22.0-88-gde0bdc1-4.8.5.tar.gz
readonly BIN=xtensa-lx106-elf/bin

if [ $(getconf WORD_BIT) = '32' ] && [ $(getconf LONG_BIT) = '64' ] ; then
  FILE=$FILE64
else
  FILE=$FILE32
fi

FILENAME=`basename $FILE`

# 安装依赖包
sudo apt install gcc git wget make libncurses5 flex bison gperf python python-pip python-setuptools python-serial python-cryptography python-future

echo -e

# 安装编译工具
if [ ! -d "./esp8266_toolchain" ]; then
  mkdir ./esp8266_toolchain
fi
cd ./esp8266_toolchain

wget -c $FILE -O $FILENAME

echo Unzipping...
tar -xf $FILENAME

echo Generating mkenv.sh...
PROJ_DIR=`pwd`
CONTENT="#!/bin/bash\nexport PATH=$PROJ_DIR/esp8266_toolchain/$BIN:"'$PATH'"\nexport IDF_PATH=$PROJ_DIR/ESP8266_RTOS_SDK"
echo -e $CONTENT > ../mkenv.sh

echo Done!