call del *.nupkg
copy cryptopp.targets cryptopp\build\native\
copy cryptopp.nuspec cryptopp\
copy config.h cryptopp\build\native\include\cryptopp\
nuget pack cryptopp\cryptopp.nuspec
for /r . %%g in (*.nupkg) do nuget push %%g -Timeout 2147483