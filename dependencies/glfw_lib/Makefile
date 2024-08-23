proc=$(shell nproc)

SYSTEM=linux

ARGS=-D BUILD_SHARED_LIBS=ON -D GLFW_BUILD_EXAMPLES=OFF -D GLFW_BUILD_TESTS=OFF -D GLFW_BUILD_DOCS=OFF

SHARED_LIB_EXT=.so


ifeq ($(SYSTEM), linux-mingw64)
	ARGS:=$(ARGS) -D CMAKE_TOOLCHAIN_FILE=CMake/x86_64-w64-mingw32.cmake
	SHARED_LIB_EXT=.dll
endif

ifeq ($(SYSTEM), linux-mingw64)
	ARGS:=$(ARGS) -D GLFW_BUILD_X11=0 -D GLFW_BUILD_WAYLAND=0
	SHARED_LIB_EXT=.dll
endif


all:
	cd glfw; cmake -S . -B ../build $(ARGS)
	cd build; make -j$(nproc)
	cp -r build/src/*$(SHARED_LIB_EXT)* ../../complib/
	cp -r glfw/include/* ../../include/

clean:
	rm -rf build/*
