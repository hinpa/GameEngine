proc=$(shell nproc)
options=$(shell echo 'BUILD_SHARED_LIBS=ON')


all:
	cd glfw; cmake -S . -B ../build -D BUILD_SHARED_LIBS=ON
	cd build; make -j$(nproc)
	cp -r build/src/*.so* ../../complib/
	cp -r glfw/include/* ../../include/

clean:
	rm -rf build/*
