SET var=%cd%
for %%g in (*.gz) do set foundfile=%%~ng
set filename=%foundfile:.tar=%

if exist "C:/Program Files (x86)/MSBuild/12.0/Bin/msbuild.exe" (
	call xcopy "%var%\%filename%" "%var%\cryptopp-src-64-VS2015\" /E /H /K /y
	call xcopy "%var%\%filename%" "%var%\cryptopp-src-32-VS2015\" /E /H /K /y
	copy cryptest.sln cryptopp-src-64-VS2015\
	copy cryptest.sln cryptopp-src-32-VS2015\
	copy cryptlib.vcproj cryptopp-src-64-VS2015\
	copy cryptlib.vcproj cryptopp-src-32-VS2015\
	copy cryptlib.vcxproj cryptopp-src-64-VS2015\
	copy cryptlib.vcxproj cryptopp-src-32-VS2015\
	
	start /wait cmd.exe /k "windows_build_each.bat "cryptopp-src-32-VS2015" "/p:OutDir=../cryptopp/lib/native/v140/windesktop/msvcstl/Win32/Debug/md/ /p:Configuration=Debug /p:Platform=Win32 /p:PlatformToolset=v140 /p:RuntimeLibrary=MultiThreadedDebugDLL /p:DebugSymbols=true /p:DebugType=pdbonly""
	start /wait cmd.exe /k "windows_build_each.bat "cryptopp-src-32-VS2015" "/p:OutDir=../cryptopp/lib/native/v140/windesktop/msvcstl/Win32/Debug/mt/ /p:Configuration=Debug /p:Platform=Win32 /p:PlatformToolset=v140 /p:RuntimeLibrary=MultiThreadedDebug /p:DebugSymbols=true /p:DebugType=pdbonly""
	start /wait cmd.exe /k "windows_build_each.bat "cryptopp-src-32-VS2015" "/p:OutDir=../cryptopp/lib/native/v140/windesktop/msvcstl/Win32/Release/md/ /p:Configuration=Release /p:Platform=Win32 /p:PlatformToolset=v140 /p:RuntimeLibrary=MultiThreadedDLL /p:DebugSymbols=false /p:DebugType=none""
	start /wait cmd.exe /k "windows_build_each.bat "cryptopp-src-32-VS2015" "/p:OutDir=../cryptopp/lib/native/v140/windesktop/msvcstl/Win32/Release/mt/ /p:Configuration=Release /p:Platform=Win32 /p:PlatformToolset=v140 /p:RuntimeLibrary=MultiThreaded /p:DebugSymbols=false /p:DebugType=none""
	start /wait cmd.exe /k "windows_build_each.bat "cryptopp-src-64-VS2015" "/p:OutDir=../cryptopp/lib/native/v140/windesktop/msvcstl/x64/Debug/md/ /p:Configuration=Debug /p:Platform=x64 /p:PlatformToolset=v140 /p:RuntimeLibrary=MultiThreadedDebugDLL /p:DebugSymbols=true /p:DebugType=pdbonly""
	start /wait cmd.exe /k "windows_build_each.bat "cryptopp-src-64-VS2015" "/p:OutDir=../cryptopp/lib/native/v140/windesktop/msvcstl/x64/Debug/mt/ /p:Configuration=Debug /p:Platform=x64 /p:PlatformToolset=v140 /p:RuntimeLibrary=MultiThreadedDebug /p:DebugSymbols=true /p:DebugType=pdbonly""
	start /wait cmd.exe /k "windows_build_each.bat "cryptopp-src-64-VS2015" "/p:OutDir=../cryptopp/lib/native/v140/windesktop/msvcstl/x64/Release/md/ /p:Configuration=Release /p:Platform=x64 /p:PlatformToolset=v140 /p:RuntimeLibrary=MultiThreadedDLL /p:DebugSymbols=false /p:DebugType=none""
	start /wait cmd.exe /k "windows_build_each.bat "cryptopp-src-64-VS2015" "/p:OutDir=../cryptopp/lib/native/v140/windesktop/msvcstl/x64/Release/mt/ /p:Configuration=Release /p:Platform=x64 /p:PlatformToolset=v140 /p:RuntimeLibrary=MultiThreaded /p:DebugSymbols=false /p:DebugType=none""
	echo Deleteing win32 folder
	call rd /s /q "%var%\cryptopp-src-64-VS2015\"
	echo Deleteing win64 folder
	call rd /s /q "%var%\cryptopp-src-32-VS2015\"
)
exit