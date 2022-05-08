地址回绕，打开A20Gate: 
```
in al, 0x92
or al, 0000_0010B
out 0x92, al
```
进入保护模式，设置CR0寄存器的PE位：
```
mov eax, cr0
or eax, 0x00000001
mov cr0, eax
```