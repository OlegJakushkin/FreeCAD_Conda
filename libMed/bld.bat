mkdir build -p
cd build

cmake -G "Ninja" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_PREFIX_PATH:FILEPATH=%PREFIX% ^
      -D CMAKE_INSTALL_PREFIX:FILEPATH=%LIBRARY_PREFIX% ^
      -D HDF5_LIBRARIES:FILEPATH=%LIBRARY_PREFIX%\lib\libhdf5.lib;%LIBRARY_PREFIX%\lib\zlib.lib ^
      -D HDF5_ROOT_DIR:FILEPATH=%LIBRARY_PREFIX% ^
      -D MEDFILE_INSTALL_DOC=OFF ^
      ..

rem MEDFILE_BUILD_PYTHON -> swig, maybe this is a nice option

if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1

move %LIBRARY_PREFIX%\lib\medC.dll %LIBRARY_PREFIX%\bin
move %LIBRARY_PREFIX%\lib\medimport.dll %LIBRARY_PREFIX%\bin
