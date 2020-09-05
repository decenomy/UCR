#!/bin/bash
echo -e "\033[0;32mHow many CPU cores do you want to be used in compiling process? (Default is 1. Press enter for default.)\033[0m"
read -e CPU_CORES
if [ -z "$CPU_CORES" ]
then
	CPU_CORES=1
fi

# Clone UCR code from UCR official Github repository
	git clone https://github.com/sappcoin-com/SAPP.git

# Entering UCR directory
	cd UCR

# Compile dependencies
	cd depends
	make -j$(echo $CPU_CORES) HOST=x86_64-apple-darwin17 
	cd ..

# Compile UCR
	./autogen.sh
	./configure --prefix=$(pwd)/depends/x86_64-apple-darwin17 --enable-cxx --enable-static --disable-shared --disable-debug --disable-tests --disable-bench
	make -j$(echo $CPU_CORES) HOST=x86_64-apple-darwin17
	make deploy
	cd ..

# Create zip file of binaries
	cp UCR/src/ucrd UCR/src/ucr-cli UCR/src/ucr-tx UCR/src/qt/ucr-qt UCR/UCR.dmg .
	zip UCR-MacOS.zip ucrd ucr-cli ucr-tx ucr-qt UCR.dmg
	rm -f ucrd ucr-cli ucr-tx ucr-qt UCR.dmg