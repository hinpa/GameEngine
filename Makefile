CC=clang -v


# Dependencies flags for .h files (to make make recompile the project when .h was changed)
DEPFLAGS=-MP -MD
LFLAGS=-Wl,-rpath,./complib,-L,./complib/ -lglfw -lGLEW -lerrh -lGL -lstdc++ -lm 
EFLAGS=-std=c++20 #-fsanitize=address -Wall -Wextra 
CFLAGS=-I./include/ -g -O0 $(EFLAGS) $(DEPFLAGS)
SRCS=src
CODEDIRS=. $(SRCS) $(foreach D,$(SRCS), $(wildcard $(D)/*))
LIBS=$(wildcard ./dependencies/*) $(wildcard ./lib/*)
CFILES=$(foreach D,$(CODEDIRS),$(wildcard $(D)/*.cpp))
OBJECTS=$(patsubst %.cpp,%.o,$(CFILES))
DEPFILES=$(patsubst %.cpp,%.d,$(CFILES))
BINARY=bin


compile_commands:
	@make compile_libraries
	@bear -- make all -j12

regular_compile:
	@make compile_libraries
	@make all -j12

compile_libraries:
	$(foreach D, $(LIBS), cd $(D) && make; cd ../..;)

all:$(BINARY)

$(BINARY):$(OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@ $(LFLAGS)


-include $(DEPFILES)

%.o:%.cpp Makefile
	$(CC) $(LFLAGS) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJECTS) $(BINARY) $(DEPFILES) compile_commands.json .cache

clean_libs:
	$(foreach D, $(LIBS), cd $(D) && make clean; cd ../..;)

full_clean:
	make clean_libs
	make clean