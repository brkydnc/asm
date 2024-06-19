.PHONY: all

all:
	# Assemble the example source (Mach-O).
	nasm -fmacho64 twofer.asm
	# Link the output with the system library.
	clang \
		--target=x86_64-apple-darwin \
		-nostdlib \
		-dynamiclib \
		-lSystem \
		-o libTwofer.dylib \
		twofer.o 
	# Compile & link it with the C source. 
	clang \
		--target=x86_64-apple-darwin \
		-o output \
		libTwofer.dylib main.c 
	# Run the final binary.
	./output
