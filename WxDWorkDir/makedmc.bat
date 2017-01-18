if not exist DinrusWX.lib (implib /system DinrusWX.lib .\lib\DinrusWX.dll)
del *.rsp
::ls2 -d .\wx\*.d>>d_Files.rsp
cd .\wx
dmmake all test
pause