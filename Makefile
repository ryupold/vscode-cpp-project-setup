.PHONY: all build clean
.ONESHELL:

CC = g++
CPP_VERSION = c++17
CFLAGS = -std=$(CPP_VERSION) -I. -g 
BASE_NAME = hello
DEPS = hello.h
OBJ = hello.o

ifeq ($(OS), Windows_NT)
Library = $(BASE_NAME).dll
Executable = $(BASE_NAME).exe
CFLAGS_LIB = -shared
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        Library = $(BASE_NAME).so
		Executable = $(BASE_NAME)
		CFLAGS_LIB = -shared
    endif
    ifeq ($(UNAME_S),Darwin)
        Library = $(BASE_NAME).dylib
		Executable = $(BASE_NAME)
		CFLAGS_LIB = -dynamiclib
    endif
endif

build-exe: $(Executable) clean-obj
build-lib: $(Library) clean-obj

clean: clean-obj
	rm $(Library) || true
	rm $(Executable) || true

clean-obj:
	rm *.o || true

%.o: %.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(Library): $(OBJ)
	$(CC) $(CFLAGS_LIB) -o $@ $^ $(CFLAGS)

$(Executable): $(OBJ) main.o
	$(CC) -o $@ $^ $(CFLAGS)