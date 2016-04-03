set SEVENZIP="C:\Program Files\7-Zip\7z.exe"
set foundfile=""
SET var=%cd%
for %%g in (*.gz) do set foundfile=%%~ng
set filename=%foundfile:.tar=%

call %SEVENZIP% e "%var%/%foundfile%.gz" -aoa
call %SEVENZIP% x "%var%/%foundfile%" -aoa
call del pax_global_header
call del %foundfile%

call xcopy "%var%\%filename%\*.h" "cryptopp\build\native\include\cryptopp\"

start cmd.exe /k "build_v120.bat
start cmd.exe /k "build_v140.bat
