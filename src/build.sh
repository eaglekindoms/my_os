# 编译链接内核文件
export PATH="/usr/local/cross/bin:$PATH"
echo "current path"
pwd
ls
rm -rf out
mkdir out
i686-elf-as boot/boot.s -o out/boot.o
i686-elf-gcc -c kernel/kernel.c -o out/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
i686-elf-gcc -T config/linker.ld -o out/myos.bin -ffreestanding -O2 -nostdlib out/boot.o out/kernel.o -lgcc

# 验证内核文件
if grub-file --is-x86-multiboot out/myos.bin; then
  echo multiboot confirmed
else
  echo the file is not multiboot
fi

# 生成系统镜像文件
rm -rf isodir
mkdir -p isodir/boot/grub
cp out/myos.bin isodir/boot/myos.bin
cp config/grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o myos.iso isodir

# run
qemu-system-i386 -cdrom myos.iso