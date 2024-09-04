CC=clang -v

# System dependent

SYSTEM=linux
GLEW_LIB_NAME=GLEW
GLFW_LIB_NAME=glfw
MESA_LIB_NAME=GL

#windows specific

GDI_LIB_LINK=

CXX_LIB_LINK=-lstdc++


# Dependencies flags for .h files (to make make recompile the project when .h was changed)
DEPFLAGS=-MP -MD
LFLAGS=
EFLAGS=-std=c++20 -Wall -Wextra 
CFLAGS=-I./include/ -g -O0 $(EFLAGS) $(DEPFLAGS)
SRCS=src
CODEDIRS=. $(SRCS) $(foreach D,$(SRCS), $(wildcard $(D)/*))
LIBS=$(wildcard ./dependencies/*) $(wildcard ./lib/*)
CFILES=$(foreach D,$(CODEDIRS),$(wildcard $(D)/*.cpp))
OBJECTS=$(patsubst %.cpp,%.o,$(CFILES))
DEPFILES=$(patsubst %.cpp,%.d,$(CFILES))
BINARY=bin

ifeq ($(SYSTEM), linux-mingw64)
	GLEW_LIB_NAME=glew32
	GLFW_LIB_NAME=glfw3
	MESA_LIB_NAME=opengl32
	GDI_LIB_LINK=-lgdi32
	CXX_LIB_LINK=-Wl,-Bstatic -lstdc++
	CC=x86_64-w64-mingw32-gcc
	LFLAGS:=-L./complib
else
	LFLAGS:=-Wl,-rpath,./complib,-L,./complib/ $(LFLAGS)
endif
	
LFLAGS:= $(LFLAGS) -l$(GLFW_LIB_NAME) -l$(GLEW_LIB_NAME) -l$(MESA_LIB_NAME) $(CXX_LIB_LINK) -lm $(GDI_LIB_LINK) -lerrh 

compile_commands:
	@make compile_libraries
	@bear -- make all -j12

release:
	@make compile_commands
	mkdir -p release
	cp -r $(BINARY)* res release
	zip -r release.zip release/


regular_compile:
	@make compile_libraries
	@make all -j12

compile_libraries:
	mkdir -p ./complib
	$(foreach D, $(LIBS), cd $(D) && make SYSTEM=$(SYSTEM); cd ../..;)

all:$(BINARY)

$(BINARY):$(OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@ $(LFLAGS)


-include $(DEPFILES)

%.o:%.cpp Makefile
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJECTS) $(BINARY)* $(DEPFILES) compile_commands.json .cache release*

clean_libs:
	$(foreach D, $(LIBS), cd $(D) && make clean; cd ../..;)
	rm -rf ./complib/*
	rm -rf ./include/*

full_clean:
	make clean_libs
	make clean
