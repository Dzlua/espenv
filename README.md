https://www.cnblogs.com/dzlua/p/11194343.html

# 本节为 ESP-8266 RTOS 的环境搭建
只适合Linux环境，推荐Ubuntu。本例以Ubuntu16.04-x64为例

## 安装 git
```
[dzlua@ubuntu: ~]$ sudo apt install git
```

## 克隆 代码
github: https://github.com/Dzlua/espenv.git
gitee : https://gitee.com/dzlua/espenv.git

```
[dzlua@ubuntu:~]$ git clone --recursive https://gitee.com/dzlua/espenv.git
[dzlua@ubuntu:~]$ cd espenv/
```

## 切换到相应版本
```
[dzlua@ubuntu:~/espenv]$ git checkout v3.2
[dzlua@ubuntu:~/espenv]$ git submodule update
```

## 安装 环境
```
[dzlua@ubuntu:~/espenv]$ ./install.sh
...
...
...
Unzipping...
Generating mkenv.sh...
Done!
Use "source mkenv.sh" to export PATH and IDF_PATH.
[dzlua@ubuntu:~/espenv]$ 
```
安装成功如上

## 测试
```
[dzlua@ubuntu:~/espenv]$ source mkenv.sh
[dzlua@ubuntu:~/espenv]$ cd examples/get-started/project_template/
[dzlua@ubuntu:~/espenv/examples/get-started/project_template]$ ls
CMakeLists.txt  components  main  Makefile  readme.txt
[dzlua@ubuntu:~/espenv/examples/get-started/project_template]$ make menuconfig
# 配置设备
[dzlua@ubuntu:~/espenv/examples/get-started/project_template]$ make -j2
...
...
...
esptool.py v2.4.0
To flash all build output, run 'make flash' or:
python /home/dzlua/dzlua/espenv/ESP8266_RTOS_SDK/components/esptool_py/esptool/esptool.py --chip esp8266 --port /dev/ttyUSB0 --baud 115200 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 40m --flash_size 1MB 0xd000 /home/dzlua/dzlua/espenv/examples/get-started/project_template/build/ota_data_initial.bin 0x0000 /home/dzlua/dzlua/espenv/examples/get-started/project_template/build/bootloader/bootloader.bin 0x10000 /home/dzlua/dzlua/espenv/examples/get-started/project_template/build/project_template.bin 0x8000 /home/dzlua/dzlua/espenv/examples/get-started/project_template/build/partitions_two_ota.1MB.bin
[dzlua@ubuntu:~/espenv/examples/get-started/project_template]$ cd build/
[dzlua@ubuntu:~/espenv/examples/get-started/project_template/build]$ ls -l
...
...
-rw-rw-r-- 1 dzlua dzlua    8192 7月  15 22:19 ota_data_initial.bin
-rw-rw-r-- 1 dzlua dzlua    3072 7月  15 22:19 partitions_two_ota.1MB.bin
-rw-rw-r-- 1 dzlua dzlua  222944 7月  15 22:19 project_template.bin
-rwxrwxr-x 1 dzlua dzlua 1327388 7月  15 22:19 project_template.elf
-rw-rw-r-- 1 dzlua dzlua 1406199 7月  15 22:19 project_template.map
...
...
```
如上，表示make成功

## 后续使用
后续在使用时，只需要在新终端中执行 `source mkenv.sh`

### 打开新终端
```
[dzlua@ubuntu:~]$ 
```

### cd 到espenv项目所在目录
```
[dzlua@ubuntu:~]$ cd dzlua/espenv/
```

### 执行 `source mkenv.sh`
```
[dzlua@ubuntu:~/dzlua/espenv]$ source mkenv.sh
```

### cd 到项目目录
```
[dzlua@ubuntu:~/dzlua/espenv]$ cd ../examples/get-started/project_template/
```

### 编译
```
[dzlua@ubuntu:~/dzlua/examples/get-started/project_template]$ make menuconfig
[dzlua@ubuntu:~/dzlua/examples/get-started/project_template]$ make -j2
```
