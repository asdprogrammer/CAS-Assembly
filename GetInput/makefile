main: main.o
	ld -e _start -o main main.o -macosx_version_min 10.15 -lSystem

main.o: main.asm
	nasm main.asm -f macho64

clean:
	rm main.o main
