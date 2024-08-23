proc=$(shell nproc)
SYSTEM=linux
SHARED_LIB_EXT=.so

ifeq ($(SYSTEM), linux-mingw64)
	SHARED_LIB_EXT=.dll
endif

ifeq ($(SYSTEM), windows)
	SHARED_LIB_EXT=.dll
	SYSTEM=msys
endif

all:
	cd glew; make extensions -j $(proc) SYSTEM=$(SYSTEM); make -j $(proc) SYSTEM=$(SYSTEM)
	cp -r glew/lib/*$(SHARED_LIB_EXT)* ../../complib/
	cp -r glew/include/* ../../include/

clean:
	cd glew/auto; make clean
	cd glew; make clean
