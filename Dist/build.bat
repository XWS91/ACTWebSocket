CALL "%VS140COMNTOOLS%vsvars32.bat"
pushd ..
devenv ActWebSocket.sln /build "Release"
mkdir Dist\temp
xcopy /hrkysd ACTWebSocket.Loader\bin\Release\ACTWebSocket*.dll Dist\temp
xcopy /hrkysd ACTWebSocket.Loader\bin\Release\websocket*.dll Dist\temp
xcopy /hrkysd ACTWebSocket.Loader\bin\Release\MimeType*.dll Dist\temp
xcopy /hrkysd ACTWebSocket.Loader\bin\Release\Newtonsoft*.dll Dist\temp

xcopy /hrkysd Sample Dist\temp\
popd
del ACTWebSocket_latest.7z
pushd temp
"c:\Program Files\7-Zip\7z.exe" a ..\ACTWebSocket_latest.7z *
popd temp
