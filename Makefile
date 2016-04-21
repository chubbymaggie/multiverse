
all: teeny steeny nolibc eip mem lookup simplest ssimplest

teeny: 
	nasm -f elf teeny.asm
	gcc -o teeny -Wall -m32 -s -nostartfiles teeny.o

steeny: 
	nasm -f elf teeny.asm
	gcc -o steeny -static -Wall -m32 -s -nostartfiles teeny.o

nolibc:
	nasm -f elf nolibc.asm
	gcc -o nolibc -Wall -m32 -s -nostdlib nolibc.o

eip:
	nasm -f elf eip.asm
	gcc -o eip -Wall -m32 -s -nostartfiles eip.o

mem:
	nasm -f elf mem.asm
	gcc -o mem -Wall -m32 -s -nostartfiles mem.o

lookup:
	nasm -f elf lookup.asm
	gcc -o lookup -Wall -m32 -s -nostartfiles lookup.o

simplest.o:
	gcc -c -m32 simplest.c

simplest: simplest.o
	gcc -o simplest -Wall -m32 simplest.o

ssimplest: simplest.o
	gcc -o ssimplest -Wall -m32 -static simplest.o

clean:
	rm -f teeny.o teeny steeny nolibc.o nolibc eip.o eip mem.o mem lookup.o lookup simplest.o simplest ssimplest
