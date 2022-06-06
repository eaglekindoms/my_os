# OS启动过程
主板上的BIOS程序 -> MBR主引导记录 -> OS加载器 -> OS内核

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

# qemu 启动系统步骤
1. 用i686-elf-gcc编译器生成os二进制文件，需要实现:
* boot.s 文件用于创建multiboot头，以便引导加载程序识别
* kernel.c 内核文件
* linker.ld链接脚本，用于链接编译好的boot文件和kernel文件，生成os二进制文件
2. 用grub-file命令验证二进制文件是否可用
```
grub-file --is-x86-multiboot myos.bin
```
3. 生成cdrom镜像文件
* grub.cfg配置内容:
```
menuentry "myos" {
	multiboot /boot/myos.bin
}
```
* 创建镜像文件生成目录：
```
mkdir -p isodir/boot/grub
cp myos.bin isodir/boot/myos.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o myos.iso isodir
```

4. 运行系统
* 从镜像文件运行：
qemu-system-i386 -cdrom myos.iso
* 从二进制内核文件运行：
qemu-system-i386 -kernel myos.bin
