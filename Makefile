.PHONY: all

all:
	# Assemble the example source (Mach-O).
	nasm -fmacho64 -g -O0 twofer.asm
	# Link the output with the system library.
	clang \
		-g -O0 \
		--target=x86_64-apple-darwin \
		-nostdlib \
		-dynamiclib \
		-lSystem \
		-o libtwofer.dylib \
		twofer.o 
	# Compile & link it with the C source. 
	clang \
		-g -O0 \
		--target=x86_64-apple-darwin \
		-o output \
		libtwofer.dylib main.c 
	# Run the final binary.
	./output
