#@ echo off
for /f %%a in ('dir /B /S *.hex') do DfuFileMgr.exe %%a %%a.dfu >nul
for /f %%a in ('dir /B /S *.dfu') do DfuSeCommand.exe -c -d --fn %%a -l >nul