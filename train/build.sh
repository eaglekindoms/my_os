#  bximage -hd -mode="flat" -size=512 -q c.img
nasm -I ./ -o ../temp/mbr.bin mbr_disk.s
dd if=../temp/mbr.bin of=c.img bs=512 count=1 conv=notrunc
nasm -I ./ -o ../temp/loader.bin loader.s
dd if=../temp/loader.bin of=c.img bs=512 count=4 seek=2 conv=notrunc
bochs -f bochsconfig