// #include "stdio.h"
extern int printf (__const char *__restrict __format, ...);

int main(){
    int a = 0x1a;
    printf("%d", a);
    printf("hello, world!\n");
    return 0;
}