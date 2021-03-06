#include <terminal.h>
#include <printf.h>

/* Check if the compiler thinks you are targeting the wrong operating system. */
#if defined(__linux__)
#error "You are not using a cross-compiler, you will most certainly run into trouble"
#endif
 
/* This tutorial will only work for the 32-bit ix86 targets. */
#if !defined(__i386__)
#error "This tutorial needs to be compiled with a ix86-elf compiler"
#endif
 

void kernel_main(void) 
{
	// /* Initialize terminal interface */
	terminal_initialize();
	_putchar('h');
	printf("hello, world, %d",9527);
 
	// /* Newline support is left as an exercise. */
	// terminal_writestring("Hello, kernel World!\n");
}