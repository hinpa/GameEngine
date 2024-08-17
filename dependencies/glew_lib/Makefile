proc=$(shell nproc)

all:
	cd glew; make extensions -j $(proc); make -j $(proc)
	cp -r glew/lib/*.so* ../../complib/
	cp -r glew/include/* ../../include/

clean:
	cd glew/auto; make clean
	cd glew; make clean
