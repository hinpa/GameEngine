proc=$(shell nproc)
SYSTEM=linux
LIB_EXT=.so

ifeq ($(SYSTEM), linux-mingw64)
	LIB_EXT=.a
endif


all:
	cd glew; make extensions -j $(proc) SYSTEM=$(SYSTEM); make glew.lib -j $(proc) SYSTEM=$(SYSTEM)
	cp -r glew/lib/*$(LIB_EXT)* ../../complib/
	cp -r glew/include/* ../../include/

clean:
	cd glew/auto; make clean
	cd glew; make clean
