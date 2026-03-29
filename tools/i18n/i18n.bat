@echo off
chcp 65001 >nul
title Sphinx i18n Translation Workflow
setlocal EnableDelayedExpansion

:: ====================================================================
:: Sphinx i18n Translation Workflow - Windows Batch Script
:: ====================================================================
:: Usage: i18n.bat [command]
::   i18n.bat extract    - Extract translation templates (.pot)
::   i18n.bat update     - Update Chinese translation files (.po)
::   i18n.bat compile    - Compile translations (.mo)
::   i18n.bat build-zh   - Build Chinese documentation
::   i18n.bat build-en   - Build English documentation
::   i18n.bat build-all  - Build both languages
::   i18n.bat full       - Run full workflow (extract + update + compile + build)
::   i18n.bat serve      - Start HTTP server for preview
::   i18n.bat clean      - Clean build files
::   i18n.bat status     - Show translation status
:: ====================================================================

set "SCRIPT_DIR=%~dp0"
set "ROOT_DIR=%SCRIPT_DIR%..\.."
set "DOCS_DIR=%ROOT_DIR%\docs"
set "LOCALES_DIR=%DOCS_DIR%\source\locales"
set "BUILD_DIR=%DOCS_DIR%\build"

:: Get clean absolute path for display
for %%f in ("%LOCALES_DIR%") do set "LOCALES_DIR_DISPLAY=%%~ff"

:: Colors for output
set "GREEN=[32m"
set "YELLOW=[33m"
set "RED=[31m"
set "BLUE=[34m"
set "CYAN=[36m"
set "RESET=[0m"

goto :main

:: ====================================================================
:: Functions
:: ====================================================================

:print_header
    echo.
    echo %CYAN%============================================================%RESET%
    echo %CYAN%  Sphinx i18n Translation Workflow%RESET%
    echo %CYAN%============================================================%RESET%
    echo.
    goto :eof

:print_success
    echo %GREEN%[OK]%RESET% %~1
    goto :eof

:print_warning
    echo %YELLOW%[WARN]%RESET% %~1
    goto :eof

:print_error
    echo %RED%[ERROR]%RESET% %~1
    goto :eof

:print_info
    echo %BLUE%[INFO]%RESET% %~1
    goto :eof

:check_python
    python --version >nul 2>&1
    if errorlevel 1 (
        call :print_error "Python is not installed or not in PATH"
        exit /b 1
    )
    goto :eof

:check_sphinx
    sphinx-build --version >nul 2>&1
    if errorlevel 1 (
        call :print_error "Sphinx is not installed. Run: pip install -r docs/requirements.txt"
        exit /b 1
    )
    goto :eof

:extract
    call :print_header
    call :print_info "Step 1/4: Extracting translation templates..."
    echo.
    
    cd /d "%DOCS_DIR%"
    python "..\tools\i18n\extract_messages.py"
    
    if errorlevel 1 (
        call :print_error "Extraction failed!"
        exit /b 1
    )
    
    call :print_success "Translation templates extracted successfully!"
    echo.
    call :print_info "Template files location: %LOCALES_DIR%\*.pot"
    goto :eof

:update
    call :print_header
    call :print_info "Step 2/4: Updating Chinese translation files..."
    echo.
    
    cd /d "%DOCS_DIR%"
    python "..\tools\i18n\update_translations.py"
    
    if errorlevel 1 (
        call :print_error "Update failed!"
        exit /b 1
    )
    
    call :print_success "Chinese translation files updated!"
    echo.
    call :print_info "Translation files location: %LOCALES_DIR%\zh_CN\LC_MESSAGES\*.po"
    echo.
    call :print_info "Next: Edit .po files to add Chinese translations"
    goto :eof

:compile
    call :print_header
    call :print_info "Step 3/4: Compiling translations..."
    echo.
    
    cd /d "%DOCS_DIR%"
    python "..\tools\i18n\compile_translations.py"
    
    if errorlevel 1 (
        call :print_error "Compilation failed!"
        exit /b 1
    )
    
    call :print_success "Translations compiled successfully!"
    echo.
    call :print_info "Compiled files location: %LOCALES_DIR%\zh_CN\LC_MESSAGES\*.mo"
    goto :eof

:buildzh
    call :print_header
    call :print_info "Building Chinese documentation..."
    echo.
    
    cd /d "%DOCS_DIR%"
    make html-zh
    
    if errorlevel 1 (
        call :print_error "Build failed!"
        exit /b 1
    )
    
    call :print_success "Chinese documentation built successfully!"
    echo.
    call :print_info "Output: %BUILD_DIR%\html\zh_CN\"
    goto :eof

:builden
    call :print_header
    call :print_info "Building English documentation..."
    echo.
    
    cd /d "%DOCS_DIR%"
    make html-en
    
    if errorlevel 1 (
        call :print_error "Build failed!"
        exit /b 1
    )
    
    call :print_success "English documentation built successfully!"
    echo.
    call :print_info "Output: %BUILD_DIR%\html\en\"
    goto :eof

:buildall
    call :print_header
    call :print_info "Building English documentation..."
    echo.
    
    cd /d "%DOCS_DIR%"
    call make html-en
    
    if errorlevel 1 (
        call :print_error "English build failed!"
        exit /b 1
    )
    
    call :print_success "English documentation built successfully!"
    echo.
    call :print_info "Output: %BUILD_DIR%\html\en\"
    
    echo.
    call :print_info "Building Chinese documentation..."
    echo.
    
    cd /d "%DOCS_DIR%"
    call make html-zh
    
    if errorlevel 1 (
        call :print_error "Chinese build failed!"
        exit /b 1
    )
    
    call :print_success "Chinese documentation built successfully!"
    echo.
    call :print_info "Output: %BUILD_DIR%\html\zh_CN\"
    goto :eof

:full_workflow
    call :print_header
    call :print_info "Running FULL translation workflow..."
    echo.
    
    call :extract
    if errorlevel 1 exit /b 1
    
    echo.
    pause
    
    call :update
    if errorlevel 1 exit /b 1
    
    echo.
    call :print_info "========================================"
    call :print_info "Please edit .po files before continuing!"
    call :print_info "Files to edit: %LOCALES_DIR%\zh_CN\LC_MESSAGES\*.po"
    call :print_info "========================================"
    echo.
    choice /C YN /M "Have you finished editing the .po files"
    
    if errorlevel 2 (
        call :print_info "Workflow paused. Run 'i18n.bat compile' after editing."
        exit /b 0
    )
    
    call :compile
    if errorlevel 1 exit /b 1
    
    call :print_info "Building English documentation..."
    echo.
    
    cd /d "%DOCS_DIR%"
    call make html-en
    
    if errorlevel 1 (
        call :print_error "English build failed!"
        exit /b 1
    )
    
    call :print_success "English documentation built successfully!"
    echo.
    call :print_info "Output: %BUILD_DIR%\html\en\"
    
    echo.
    call :print_info "Building Chinese documentation..."
    echo.
    
    cd /d "%DOCS_DIR%"
    call make html-zh
    
    if errorlevel 1 (
        call :print_error "Chinese build failed!"
        exit /b 1
    )
    
    call :print_success "Chinese documentation built successfully!"
    echo.
    call :print_info "Output: %BUILD_DIR%\html\zh_CN\"
    
    echo.
    call :print_success "Full workflow completed!"
    echo.
    call :print_info "English docs: %BUILD_DIR%\html\en\index.html"
    call :print_info "Chinese docs: %BUILD_DIR%\html\zh_CN\index.html"
    goto :eof

:serve
    call :print_header
    call :print_info "Starting HTTP server for preview..."
    call :print_info "URL: http://localhost:8080"
    echo.
    
    cd /d "%BUILD_DIR%\html"
    
    if not exist "index.html" (
        call :print_warning "No index.html found. Building default redirect page..."
        (
            echo ^<!DOCTYPE html^>
            echo ^<html^>
            echo ^<head^>
            echo ^<meta http-equiv="refresh" content="0; url=en/index.html"^>
            echo ^</head^>
            echo ^<body^>
            echo ^<p^>Redirecting to ^<a href="en/index.html"^>English version^</a^>...^</p^>
            echo ^</body^>
            echo ^</html^>
        ) > index.html
    )
    
    call :print_info "Press Ctrl+C to stop the server"
    echo.
    python -m http.server 8080
    goto :eof

:clean
    call :print_header
    call :print_info "Cleaning build files..."
    
    if exist "%BUILD_DIR%" (
        rmdir /s /q "%BUILD_DIR%"
        call :print_success "Removed: %BUILD_DIR%"
    )
    
    :: Clean .mo files
    for /r "%LOCALES_DIR%" %%f in (*.mo) do (
        del "%%f" >nul 2>&1
        call :print_success "Removed: %%f"
    )
    
    echo.
    call :print_success "Clean completed!"
    goto :eof

:status
    call :print_header
    call :print_info "Translation Status"
    echo.
    
    :: Count .pot files
    set "pot_count=0"
    for /r "%LOCALES_DIR%" %%f in (*.pot) do set /a pot_count+=1
    
    :: Count .po files
    set "po_count=0"
    for /r "%LOCALES_DIR%\zh_CN" %%f in (*.po) do set /a po_count+=1
    
    :: Count .mo files
    set "mo_count=0"
    for /r "%LOCALES_DIR%\zh_CN" %%f in (*.mo) do set /a mo_count+=1
    
    echo %CYAN%Translation Files:%RESET%
    echo   Template files (.pot): %pot_count%
    echo   Chinese translations (.po): %po_count%
    echo   Compiled translations (.mo): %mo_count%
    echo.
    
    :: Check build status
    if exist "%BUILD_DIR%\html\en\index.html" (
        call :print_success "English docs built: YES"
    ) else (
        call :print_warning "English docs built: NO"
    )
    
    if exist "%BUILD_DIR%\html\zh_CN\index.html" (
        call :print_success "Chinese docs built: YES"
    ) else (
        call :print_warning "Chinese docs built: NO"
    )
    
    echo.
    call :print_info "To view details, check: %LOCALES_DIR_DISPLAY%\zh_CN\LC_MESSAGES\"
    goto :eof

:show_help
    call :print_header
    echo %CYAN%Usage:%RESET% i18n.bat [command]
    echo.
    echo %CYAN%Available Commands:%RESET%
    echo   extract    Extract translation templates from English docs
    echo   update     Create/update Chinese .po translation files
    echo   compile    Compile .po files to .mo binary files
    echo   build-zh   Build Chinese HTML documentation
    echo   build-en   Build English HTML documentation
    echo   build-all  Build both English and Chinese documentation
    echo   full       Run complete workflow with prompts
    echo   serve      Start HTTP server for preview (localhost:8080)
    echo   clean      Remove all build files and compiled translations
    echo   status     Show translation status summary
    echo   help       Show this help message
    echo.
    echo %CYAN%Quick Start:%RESET%
    echo   1. i18n.bat extract  ^(extract templates^)
    echo   2. i18n.bat update   ^(create .po files^)
    echo   3. Edit .po files in %LOCALES_DIR_DISPLAY%\zh_CN\LC_MESSAGES\
    echo   4. i18n.bat compile  ^(compile translations^)
    echo   5. i18n.bat build-zh ^(build Chinese docs^)
    echo   6. i18n.bat serve    ^(preview at localhost:8080^)
    echo.
    echo %CYAN%Or run full workflow:%RESET%
    echo   i18n.bat full
    goto :eof

:: ====================================================================
:: Main Entry Point
:: ====================================================================

:main
    call :check_python
    if errorlevel 1 exit /b 1

    if "%~1"=="" goto :show_help
    if /i "%~1"=="help" goto :show_help
    if /i "%~1"=="/?" goto :show_help
    if /i "%~1"=="extract" goto :extract
    if /i "%~1"=="update" goto :update
    if /i "%~1"=="compile" goto :compile
    if /i "%~1"=="build-zh" goto :buildzh
    if /i "%~1"=="build-en" goto :builden
    if /i "%~1"=="build-all" goto :buildall
    if /i "%~1"=="full" goto :full_workflow
    if /i "%~1"=="serve" goto :serve
    if /i "%~1"=="clean" goto :clean
    if /i "%~1"=="status" goto :status
    
    call :print_error "Unknown command: %~1"
    echo.
    goto :show_help

endlocal
