


SYSTEM=linux-mingw64

ifneq ($(SYSTEM), linux-mingw64)
	exit 0
endif

all:
	python getLatestMesa.py
	unxz mesa.tar.xz
	mkdir -p mesa
	tar -xvf mesa.tar -C ./mesa/
	cd mesa/*/; meson setup --cross-file win.cross builddir; cd builddir; ninja
	mv mesa/*/builddir/src/gallium/targets/libgl-gdi/opengl32.dll ../../complib
	
clean:
	rm -rf mesa*
