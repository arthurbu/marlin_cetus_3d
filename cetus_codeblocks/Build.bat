SET arduino_path="C:\Program Files (x86)\Arduino\"
SET packages_path="C:\Users\a\AppData\Local\Arduino15\packages"
SET hardware_path="C:\Users\a\Documents\Arduino\hardware";
SET mypath=%~dp0

echo %mypath%

"C:\Program Files (x86)\Arduino\arduino-builder" -dump-prefs -logger=machine -hardware "C:\Program Files (x86)\Arduino\hardware" -hardware C:\Users\a\AppData\Local\Arduino15\packages -hardware C:\Users\a\Documents\Arduino\hardware -tools "C:\Program Files (x86)\Arduino\tools-builder" -tools "C:\Program Files (x86)\Arduino\hardware\tools\avr" -tools C:\Users\a\AppData\Local\Arduino15\packages -built-in-libraries "C:\Program Files (x86)\Arduino\libraries" -libraries C:\Users\a\Documents\Arduino\libraries -fqbn=Arduino_STM32:STM32F1:mapleMini:bootloader_version=bootloader20,cpu_speed=speed_72mhz,opt=osstd -vid-pid=0X1EAF_0X0004 -ide-version=10805 -build-path %mypath%build -warnings=default -build-cache %mypath%cache -prefs=build.warn_data_percentage=75 -verbose %mypath%..\Marlin\Marlin.ino

IF %ERRORLEVEL% NEQ 0 (
  rem error 1
  pause
  exit /b 1
)

"C:\Program Files (x86)\Arduino\arduino-builder" -compile -logger=machine -hardware "C:\Program Files (x86)\Arduino\hardware" -hardware C:\Users\a\AppData\Local\Arduino15\packages -hardware C:\Users\a\Documents\Arduino\hardware -tools "C:\Program Files (x86)\Arduino\tools-builder" -tools "C:\Program Files (x86)\Arduino\hardware\tools\avr" -tools C:\Users\a\AppData\Local\Arduino15\packages -built-in-libraries "C:\Program Files (x86)\Arduino\libraries" -libraries C:\Users\a\Documents\Arduino\libraries -fqbn=Arduino_STM32:STM32F1:mapleMini:bootloader_version=bootloader20,cpu_speed=speed_72mhz,opt=osstd -vid-pid=0X1EAF_0X0004 -ide-version=10805 -build-path %mypath%build -warnings=default -build-cache %mypath%cache -prefs=build.warn_data_percentage=75 -verbose %mypath%..\Marlin\Marlin.ino

IF %ERRORLEVEL% NEQ 0 (
  rem error 2
  pause
  exit /b 1
)

%mypath%maple_loader/maple_upload.bat COM35 2 1EAF:0003 %mypath%build/Marlin.ino.bin 