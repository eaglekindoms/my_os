; 引导程序
SECTION MBR vstart=0x7c00
mov ax,cs
mov ds,ax
mov es,ax
mov ss,ax
mov fs,ax
mov sp,0x7c00
mov ax,0xb800 ; 显存地址基址
mov gs,ax

; 清屏
mov ax, 0x600
mov bx, 0x700
mov cx, 0       ; 左上角: (0, 0)
mov dx, 0x184f  ; 右下角: (80,25),
                ; VGA 文本模式中,一行只能容纳80个字符,共25行｡
                ; 下标从0 开始,所以0x18=24,0x4f=79
int 0x10        ; int 0x10

; 输出背景色绿色，前景色红色，并且跳动的字符串"1 MBR"
; 以gs为基址，后接偏移量，byte表示操作数的字节位宽
mov byte [gs:0x00],'1'
mov byte [gs:0x01],0xA4 ; A 表示绿色背景闪烁，4 表示前景色为红色

mov byte [gs:0x02],' '
mov byte [gs:0x03],0xA4

mov byte [gs:0x04],'M'
mov byte [gs:0x05],0xA4

mov byte [gs:0x06],'B'
mov byte [gs:0x07],0xA4

mov byte [gs:0x08],'R'
mov byte [gs:0x09],0xA4

jmp $ ; 通过死循环使程序悬停在此

times 510-($-$$) db 0
db 0x55,0xaa