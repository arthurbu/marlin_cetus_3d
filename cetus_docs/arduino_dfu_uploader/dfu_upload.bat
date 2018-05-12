set driverLetter=%~dp0

rem: ------------- abc
%driverLetter%DfuSe\DfuFileMgr.exe %2 %2.dfu >nul
%driverLetter%DfuSe\DfuSeCommand.exe -c -d --fn %2.dfu -l 

rem for /f %%a in ('dir /B /S *.hex') do DfuFileMgr.exe %%a %%a.dfu >nul
rem for /f %%a in ('dir /B /S *.dfu') do DfuSeCommand.exe -c -d --fn %%a -l >nul