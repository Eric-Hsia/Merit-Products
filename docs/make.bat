@ECHO OFF

IF "%1"=="" GOTO help

IF /I "%1"=="html" GOTO html
IF /I "%1"=="en" GOTO en
IF /I "%1"=="zh_CN" GOTO zh_CN
IF /I "%1"=="clean" GOTO clean
IF /I "%1"=="help" GOTO help

GOTO help

:html
ECHO Building English documentation...
CD en
CALL make.bat html
CD ..
ECHO.
ECHO Building Chinese documentation...
CD zh_CN
CALL make.bat html
CD ..
GOTO end

:en
ECHO Building English documentation...
CD en
CALL make.bat html
CD ..
GOTO end

:zh_CN
ECHO Building Chinese documentation...
CD zh_CN
CALL make.bat html
CD ..
GOTO end

:clean
ECHO Cleaning English documentation...
CD en
CALL make.bat clean
CD ..
ECHO Cleaning Chinese documentation...
CD zh_CN
CALL make.bat clean
CD ..
GOTO end

:help
ECHO Please use `make <target>' where `<target>' is one of
ECHO   html        to make standalone HTML files for both en and zh_CN
ECHO   en          to make standalone HTML files for English only
ECHO   zh_CN       to make standalone HTML files for Chinese only
ECHO   clean       to clean build artifacts in both directories

:end
