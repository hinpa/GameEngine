CC=clang

SYSTEM=linux

ifeq ($(SYSTEM), linux-mingw64)
	CC=x86_64-w64-mingw32-gcc -v
endif

# Dependencies flags for .h files (to make make recompile the project when .h was changed)
DEPFLAGS=-MP -MD
LFLAGS=-I../../include
EFLAGS=-Wall -Wextra -std=c++20
CFLAGS=-fPIC $(EFLAGS) $(DEPFLAGS) 
CODEDIRS=. $(LIBS) $(foreach D,$(LIBS), $(wildcard $(D)/*))
CFILES=$(foreach D,$(CODEDIRS),$(wildcard $(D)/*.cpp))
OBJECTS=$(patsubst %.cpp,%.o,$(CFILES))
DEPFILES=$(patsubst %.cpp,%.d,$(CFILES))
STATIC_OBJ=../../complib/liberrh.a

all:$(STATIC_OBJ)

$(STATIC_OBJ):$(OBJECTS)
	ar cr $(STATIC_OBJ) $(OBJECTS)

%.o:%.cpp Makefile
	$(CC) $(LFLAGS) -c $(CFLAGS) $< -o $@

-include $(DEPFILES)

#%.o:%.cpp Makefile
#	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJECTS) $(STATIC_OBJ) $(DEPFILES)

