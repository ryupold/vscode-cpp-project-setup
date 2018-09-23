..PHONY: all build clean
.ONESHELL:

CC = g++
CPP_VERSION = c++17
CFLAGS = -std=$(CPP_VERSION) -I. -g
OUTPUT_FOLDER = "bin"
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

build-exe: $(Executable)
build-lib: $(Library)

clean: clean-obj
	rm -R $(OUTPUT_FOLDER) || true

clean-obj:
	rm $(OUTPUT_FOLDER)/*.o || true
ifeq ($(UNAME_S),Darwin)
	rm -R $(OUTPUT_FOLDER)/*.dSYM || true
endif

%.o: %.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(Library): $(OBJ)
	$(CC) $(CFLAGS_LIB) -o $@ $^ $(CFLAGS)
	mkdir -p $(OUTPUT_FOLDER) || true
ifeq ($(UNAME_S),Darwin)
	dsymutil $(Library)
	mv $(Library).dSYM $(OUTPUT_FOLDER)/$(Library).dSYM
endif
	mv *.o $(OUTPUT_FOLDER)/
	mv $(Library) $(OUTPUT_FOLDER)/$(Library)

$(Executable): $(OBJ) main.o
	$(CC) -o $@ $^ $(CFLAGS)
	mkdir -p $(OUTPUT_FOLDER) || true
ifeq ($(UNAME_S),Darwin)
	dsymutil $(Executable)
	mv $(Executable).dSYM $(OUTPUT_FOLDER)/$(Executable).dSYM
endif
	mv *.o $(OUTPUT_FOLDER)/
	mv $(Executable) $(OUTPUT_FOLDER)/$(Executable)