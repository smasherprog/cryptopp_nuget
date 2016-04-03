SET v1=%~1
SET v2=%~2
SET var=%cd%

if exist "C:/Program Files (x86)/MSBuild/12.0/Bin/msbuild.exe" (
	set msbuild="C:/Program Files (x86)/MSBuild/12.0/Bin/msbuild.exe"
)
if exist "C:/Program Files (x86)/MSBuild/14.0/Bin/msbuild.exe" (
	set msbuild="C:/Program Files (x86)/MSBuild/14.0/Bin/msbuild.exe"
)

call powershell -ExecutionPolicy Bypass "%var%/updatedebug.ps1 '%v1%/cryptlib.vcxproj'"
call %msbuild% %v1%/cryptest.sln /t:cryptlib %v2%
exit
