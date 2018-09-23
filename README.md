# vscode-cpp-project-setup

Boilerplate setup to start developing a simple C++ application/library with VS Code.

I use the C++17 standart in this setup. utilizing the GCC compiler.

This setup has 2 build modes:

- executable (hello.exe -> Windows | ./hello -> Linux & macOS )
  - compile using `make build-exe`
- library (libhello.dll -> Windows | libhello.so -> Linux | libhello.dylib -> macOS)
  - compile using `make build-lib`
- both versions compile to a native binary for the current OS


## Prerequisites

### Windows

On Windows I prefer the MSYS2/MinGW toolchain:

- I assume you are working on a 64 bit machine
- install MSYS2 [https://github.com/orlp/dev-on-windows/wiki/Installing-GCC--&-MSYS2](https://github.com/orlp/dev-on-windows/wiki/Installing-GCC--&-MSYS2)
- for this setup I assume you installed the x86_64 version in: **C:\\msys64\\**
- start **C:\\msys64\\mingw64.exe**
- This opens a terminal were you do the following:
  - enter `pacman -Syuu` to install the initial updates
  - after the command has finished close the terminal and reopen it
  - enter `pacman -Syuu` again to install the remaining updates
  - now install MinGW (64 bit) by entering `pacman -S --needed base-devel mingw-w64-x86_64-toolchain mingw-w64-x86_64-cmake`
  - This takes a while, after the setup is complete there should be files in the previously empty folder **C:\msys64\mingw64\bin**
  - What you see here are the GNU common build tools like *g++*, *gcc*, *make* etc. ported for Windows
  - __IMPORTANT:__ add **C:\msys64\mingw64\bin** to your **PATH**
  - The setup was successfully when you open the powershell, enter `gcc` and see something like: `gcc: fatal error: no input files...`

### macOS

- todo

### Linux

- todo

## Debug

To debug your code you can set breakpoints and press F5 (CTRL+SHIFT+P -> Debug: Start Debugging)