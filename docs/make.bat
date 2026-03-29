@ECHO OFF

pushd %~dp0

REM Command file for Sphinx documentation

if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=sphinx-build
)
set SOURCEDIR_EN=source\en
set SOURCEDIR_ZH=source\zh_CN
set BUILDDIR=build

%SPHINXBUILD% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The 'sphinx-build' command was not found. Make sure you have Sphinx
	echo.installed, then set the SPHINXBUILD environment variable to point
	echo.to the full path of the 'sphinx-build' executable. Alternatively you
	echo.may add the Sphinx directory to PATH.
	echo.
	echo.If you don't have Sphinx installed, grab it from
	echo.https://www.sphinx-doc.org/
	exit /b 1
)

if "%1" == "" goto help
if "%1" == "help" goto help
if "%1" == "html" goto html
if "%1" == "html-en" goto html-en
if "%1" == "html-zh" goto html-zh
if "%1" == "clean" goto clean

goto default

:help
echo.Please use 'make ^<target^>' where ^<target^> is one of
echo.  html        to make both English and Chinese HTML files
echo.  html-en     to make English HTML files
echo.  html-zh     to make Chinese HTML files
echo.  clean       to remove all build files
goto end

:html
call :html-en
call :html-zh
echo.
echo.Build finished. Both English and Chinese HTML pages are in %BUILDDIR%/html/
goto end

:html-en
%SPHINXBUILD% -b html %SPHINXOPTS% %SOURCEDIR_EN% %BUILDDIR%/html/en
echo.
echo.Build finished. The English HTML pages are in %BUILDDIR%/html/en.
goto end

:html-zh
%SPHINXBUILD% -b html %SPHINXOPTS% %SOURCEDIR_ZH% %BUILDDIR%/html/zh_CN
echo.
echo.Build finished. The Chinese HTML pages are in %BUILDDIR%/html/zh_CN.
goto end

:clean
if exist %BUILDDIR% rmdir /S /Q %BUILDDIR%
echo.Build directory cleaned.
goto end

:default
%SPHINXBUILD% -M %1 %SOURCEDIR_EN% %BUILDDIR% %SPHINXOPTS% %O%
goto end

:end
popd
