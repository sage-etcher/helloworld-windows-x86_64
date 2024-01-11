
@if not exist .\build mkdir .\build
nasm -o .\build\hello.asm.o -f win64 .\hello.asm
gcc -o .\build\hello.exe .\build\hello.asm.o


