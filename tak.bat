dumpbin /exports c:\Windows\System32\comctl32.dll > exports.txt
echo LIBRARY comctl32 > comctl32.def
echo EXPORTS >> comctl32.def
for /f "skip=19 tokens=4" %A in (exports.txt) do echo %A >> comctl32.def
::The librarian can use this DEF file to generate the LIB:

lib /def:comctl32.def /out:comctl32.lib /machine:x86
pause