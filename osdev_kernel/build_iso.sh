if grub-file --is-x86-multiboot kernel.bin; then
  echo multiboot confirmed
else
  echo the file is not multiboot
fi

mkdir -p ../temp/isodir/boot/grub
cp myos.bin ../temp/isodir/boot/kernel.bin
cp grub.cfg ../temp/isodir/boot/grub/grub.cfg
grub-mkrescue -o kernel.iso ../temp/isodir

# qemu-system-i386 -cdrom kernel.iso
# qemu-system-i386 -kernel kernel.bin