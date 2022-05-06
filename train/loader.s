%include "boot.inc"
SECTION MBR vstart=LOADER_BASE_ADDR

mov byte [gs:0x00],'_'
mov byte [gs:0x01],0xA4 ; A 表示绿色背景闪烁，4 表示前景色为红色

mov byte [gs:0x02],'L'
mov byte [gs:0x03],0xA4

mov byte [gs:0x04],'O'
mov byte [gs:0x05],0xA4

mov byte [gs:0x06],'A'
mov byte [gs:0x07],0xA4

mov byte [gs:0x08],'D'
mov byte [gs:0x09],0xA4

jmp $