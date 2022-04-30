# bochs启动步骤
1. nasm 编译汇编代码 
```
nasm -o <目标文件名> <汇编代码> 
```
2. bximage 分配img镜像

记录下生成的chs信息： 柱面/磁道/扇区
修改bochs配置文件中的ata0-master信息

3. 写入汇编编译后的二进制文件到bximage生成的镜像文件中
```
dd if=<二进制文件路径> of=<镜像文件路径> bs=<块大小> count=<块数> conv=notrunc
```
4. 运行镜像
```
bochs -f bochsconfig
```