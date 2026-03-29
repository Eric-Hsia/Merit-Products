@echo off
chcp 65001 >nul
title Sphinx i18n Translation Workflow - Interactive Menu
setlocal EnableDelayedExpansion

:: ====================================================================
:: Sphinx i18n Translation Workflow - Interactive Menu
:: ====================================================================
:: This script provides an interactive menu for managing translations
:: Run without arguments to see the menu
:: ====================================================================

set "SCRIPT_DIR=%~dp0"
set "ROOT_DIR=%SCRIPT_DIR%..\.."
set "DOCS_DIR=%ROOT_DIR%\docs"
set "LOCALES_DIR=%DOCS_DIR%\source\locales"
set "BUILD_DIR=%DOCS_DIR%\build"

:: Get clean absolute path for display
for %%f in ("%LOCALES_DIR%") do set "LOCALES_DIR_DISPLAY=%%~ff"

:menu
    cls
    echo.
    echo ╔══════════════════════════════════════════════════════════════╗
    echo ║         Sphinx i18n Translation Workflow                     ║
    echo ║         Merit-Products Documentation                         ║
    echo ╚══════════════════════════════════════════════════════════════╝
    echo.
    echo  [1] Extract translation templates    (从英文文档提取翻译模板)
    echo  [2] Update Chinese translations      (更新中文翻译文件)
    echo  [3] Compile translations             (编译翻译文件)
    echo  [4] Build Chinese documentation      (构建中文文档)
    echo  [5] Build English documentation      (构建英文文档)
    echo  [6] Build both languages             (构建双语文档)
    echo  [7] Start preview server             (启动预览服务器)
    echo  [8] Clean build files                (清理构建文件)
    echo  [9] Show translation status          (显示翻译状态)
    echo  [0] Full workflow (with prompts)     (完整工作流)
    echo  [Q] Quit                             (退出)
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo  Quick: Run 'i18n.bat extract' directly from command line
    echo ═══════════════════════════════════════════════════════════════
    echo.
    set /p choice="Enter your choice [0-9,Q]: "
    
    if /i "%choice%"=="1" goto :extract
    if /i "%choice%"=="2" goto :update
    if /i "%choice%"=="3" goto :compile
    if /i "%choice%"=="4" goto :build_zh
    if /i "%choice%"=="5" goto :build_en
    if /i "%choice%"=="6" goto :build_all
    if /i "%choice%"=="7" goto :serve
    if /i "%choice%"=="8" goto :clean
    if /i "%choice%"=="9" goto :status
    if /i "%choice%"=="0" goto :full_workflow
    if /i "%choice%"=="Q" goto :quit
    if /i "%choice%"=="q" goto :quit
    
    echo Invalid choice, please try again.
    timeout /t 2 >nul
    goto :menu

:extract
    cls
    echo.
    echo ╔══════════════════════════════════════════════════════════════╗
    echo ║  Step 1: Extract Translation Templates                       ║
    echo ╚══════════════════════════════════════════════════════════════╝
    echo.
    echo This will extract translatable text from English documents
    echo and create .pot template files.
    echo.
    pause
    
    cd /d "%DOCS_DIR%"
    python "..\tools\i18n\extract_messages.py"
    
    echo.
    echo Press any key to return to menu...
    pause >nul
    goto :menu

:update
    cls
    echo.
    echo ╔══════════════════════════════════════════════════════════════╗
    echo ║  Step 2: Update Chinese Translation Files                    ║
    echo ╚══════════════════════════════════════════════════════════════╝
    echo.
    echo This will create/update .po files for Chinese translations.
    echo.
    pause
    
    cd /d "%DOCS_DIR%"
    python "..\tools\i18n\update_translations.py"
    
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo  Next steps:
    echo  1. Edit .po files in:
    echo     %LOCALES_DIR_DISPLAY%\zh_CN\LC_MESSAGES\
    echo  2. Run 'Compile translations' when done
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Press any key to return to menu...
    pause >nul
    goto :menu

:compile
    cls
    echo.
    echo ╔══════════════════════════════════════════════════════════════╗
    echo ║  Step 3: Compile Translations                                ║
    echo ╚══════════════════════════════════════════════════════════════╝
    echo.
    echo This will compile .po files to .mo binary files.
    echo.
    pause
    
    cd /d "%DOCS_DIR%"
    python "..\tools\i18n\compile_translations.py"
    
    echo.
    echo Press any key to return to menu...
    pause >nul
    goto :menu

:build_zh
    cls
    echo.
    echo ╔══════════════════════════════════════════════════════════════╗
    echo ║  Build Chinese Documentation                                 ║
    echo ╚══════════════════════════════════════════════════════════════╝
    echo.
    pause
    
    cd /d "%DOCS_DIR%"
    make html-zh
    
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo  Output: %BUILD_DIR%\html\zh_CN\
    echo  Preview: Run 'Start preview server' from menu
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Press any key to return to menu...
    pause >nul
    goto :menu

:build_en
    cls
    echo.
    echo ╔══════════════════════════════════════════════════════════════╗
    echo ║  Build English Documentation                                 ║
    echo ╚══════════════════════════════════════════════════════════════╝
    echo.
    pause
    
    cd /d "%DOCS_DIR%"
    make html-en
    
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo  Output: %BUILD_DIR%\html\en\
    echo  Preview: Run 'Start preview server' from menu
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Press any key to return to menu...
    pause >nul
    goto :menu

:build_all
    cls
    echo.
    echo ╔══════════════════════════════════════════════════════════════╗
    echo ║  Build Both Languages                                        ║
    echo ╚══════════════════════════════════════════════════════════════╝
    echo.
    pause
    
    cd /d "%DOCS_DIR%"
    make html-en
    echo.
    make html-zh
    
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo  English: %BUILD_DIR%\html\en\
    echo  Chinese: %BUILD_DIR%\html\zh_CN\
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Press any key to return to menu...
    pause >nul
    goto :menu

:serve
    cls
    echo.
    echo ╔══════════════════════════════════════════════════════════════╗
    echo ║  Preview Server                                              ║
    echo ╚══════════════════════════════════════════════════════════════╝
    echo.
    echo Starting HTTP server at http://localhost:8080
    echo.
    echo URLs:
    echo   English:  http://localhost:8080/en/
    echo   Chinese:  http://localhost:8080/zh_CN/
    echo.
    echo Press Ctrl+C to stop the server
    echo.
    timeout /t 2 >nul
    
    cd /d "%BUILD_DIR%\html"
    
    :: Create index.html redirect if not exists
    if not exist "index.html" (
        (
            echo ^<!DOCTYPE html^>
            echo ^<html^>
            echo ^<head^>
            echo ^<meta http-equiv="refresh" content="0; url=en/index.html"^>
            echo ^<title^>Merit-Products Documentation^</title^>
            echo ^</head^>
            echo ^<body^>
            echo ^<p^>Redirecting to ^<a href="en/index.html"^>English version^</a^>...^</p^>
            echo ^</body^>
            echo ^</html^>
        ) > index.html
    )
    
    python -m http.server 8080
    
    echo.
    echo Server stopped. Press any key to return to menu...
    pause >nul
    goto :menu

:clean
    cls
    echo.
    echo ╔══════════════════════════════════════════════════════════════╗
    echo ║  Clean Build Files                                           ║
    echo ╚══════════════════════════════════════════════════════════════╝
    echo.
    echo This will remove:
    echo   - Build directory: %BUILD_DIR%
    echo   - Compiled .mo files
    echo.
    choice /C YN /M "Are you sure"
    
    if errorlevel 2 goto :menu
    
    if exist "%BUILD_DIR%" (
        rmdir /s /q "%BUILD_DIR%"
        echo [OK] Removed: %BUILD_DIR%
    )
    
    for /r "%LOCALES_DIR%" %%f in (*.mo) do (
        del "%%f" >nul 2>&1
        echo [OK] Removed: %%f
    )
    
    echo.
    echo Clean completed!
    timeout /t 2 >nul
    goto :menu

:status
    cls
    echo.
    echo ╔══════════════════════════════════════════════════════════════╗
    echo ║  Translation Status                                          ║
    echo ╚══════════════════════════════════════════════════════════════╝
    echo.
    
    :: Count files
    set "pot_count=0"
    for /r "%LOCALES_DIR%" %%f in (*.pot) do set /a pot_count+=1
    
    set "po_count=0"
    for /r "%LOCALES_DIR%\zh_CN" %%f in (*.po) do set /a po_count+=1
    
    set "mo_count=0"
    for /r "%LOCALES_DIR%\zh_CN" %%f in (*.mo) do set /a mo_count+=1
    
    echo Translation Files:
    echo   Template files (.pot):     %pot_count%
    echo   Chinese translations (.po): %po_count%
    echo   Compiled translations (.mo): %mo_count%
    echo.
    
    if exist "%BUILD_DIR%\html\en\index.html" (
        echo [OK] English docs built: YES
    ) else (
        echo [ ] English docs built: NO
    )
    
    if exist "%BUILD_DIR%\html\zh_CN\index.html" (
        echo [OK] Chinese docs built: YES
    ) else (
        echo [ ] Chinese docs built: NO
    )
    
    echo.
    echo Translation files location:
    echo   %LOCALES_DIR_DISPLAY%\zh_CN\LC_MESSAGES\
    echo.
    echo Press any key to return to menu...
    pause >nul
    goto :menu

:full_workflow
    cls
    echo.
    echo ╔══════════════════════════════════════════════════════════════╗
    echo ║  Full Translation Workflow                                   ║
    echo ╚══════════════════════════════════════════════════════════════╝
    echo.
    echo This will run the complete workflow:
    echo   1. Extract templates
    echo   2. Update Chinese translations
    echo   3. [PAUSE] Edit .po files manually
    echo   4. Compile translations
    echo   5. Build Chinese documentation
    echo.
    pause
    
    :: Step 1
    cls
    echo Step 1/5: Extracting templates...
    cd /d "%DOCS_DIR%"
    python "..\tools\i18n\extract_messages.py"
    if errorlevel 1 goto :menu
    
    :: Step 2
    cls
    echo Step 2/5: Updating Chinese translations...
    python "..\tools\i18n\update_translations.py"
    if errorlevel 1 goto :menu
    
    :: Pause for editing
    cls
    echo ═══════════════════════════════════════════════════════════════
    echo  Step 3/5: MANUAL EDITING REQUIRED
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Please edit the .po files to add Chinese translations:
    echo   %LOCALES_DIR_DISPLAY%\zh_CN\LC_MESSAGES\
    echo.
    echo Format:
    echo   msgid "English text"
    echo   msgstr "中文翻译"
    echo.
    pause
    
    choice /C YN /M "Have you finished editing the .po files"
    if errorlevel 2 (
        echo.
        echo Workflow paused. Run 'Compile translations' later.
        pause
        goto :menu
    )
    
    :: Step 4
    cls
    echo Step 4/5: Compiling translations...
    python "..\tools\i18n\compile_translations.py"
    if errorlevel 1 goto :menu
    
    :: Step 5
    cls
    echo Step 5/5: Building Chinese documentation...
    make html-zh
    if errorlevel 1 goto :menu
    
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo  Full workflow completed successfully!
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Output: %BUILD_DIR%\html\zh_CN\
    echo.
    echo Press any key to return to menu...
    pause >nul
    goto :menu

:quit
    echo.
    echo Goodbye!
    timeout /t 1 >nul
    exit /b 0
