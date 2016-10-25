call del *.nupkg
copy cryptopp.targets cryptopp_nuget\build\native\
copy cryptopp.nuspec cryptopp_nuget\
copy config.h cryptopp_nuget\build\native\include\cryptopp\
nuget pack cryptopp_nuget\cryptopp.nuspec