@echo off
REM ============================================================
REM Expense Tracker - Build and Run Script (Windows)
REM ============================================================

color 0A
echo ======================================
echo Expense Tracker Build Script
echo ======================================
echo.

REM Check if Maven is installed
where mvn >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Maven is not installed!
    echo Please install Maven from: https://maven.apache.org/
    pause
    exit /b 1
)

REM Check if Java is installed
where java >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Java is not installed!
    echo Please install JDK 11 or higher
    pause
    exit /b 1
)

REM Display Java version
echo Java Version:
java -version
echo.

REM Display Maven version
echo Maven Version:
mvn -version
echo.

:menu
echo ======================================
echo What would you like to do?
echo ======================================
echo 1. Clean and build project
echo 2. Build and run application
echo 3. Just run application
echo 4. Create executable JAR only
echo 5. Run JAR file
echo 6. Exit
echo ======================================
set /p choice="Enter your choice [1-6]: "
echo.

if "%choice%"=="1" goto build
if "%choice%"=="2" goto build_and_run
if "%choice%"=="3" goto run
if "%choice%"=="4" goto jar_only
if "%choice%"=="5" goto run_jar
if "%choice%"=="6" goto end
echo Invalid choice! Please select 1-6
echo.
goto menu

:build
echo [1/4] Cleaning project...
call mvn clean
if %errorlevel% neq 0 goto error
echo [SUCCESS] Clean complete
echo.

echo [2/4] Compiling project...
call mvn compile
if %errorlevel% neq 0 goto error
echo [SUCCESS] Compilation complete
echo.

echo [3/4] Running tests...
call mvn test
echo.

echo [4/4] Packaging JAR with dependencies...
call mvn package
if %errorlevel% neq 0 goto error
echo [SUCCESS] JAR created successfully
echo.

echo Build completed successfully!
echo JAR file location: target\expense-tracker-1.0.0.jar
echo.
pause
goto menu

:build_and_run
echo [1/4] Cleaning project...
call mvn clean
if %errorlevel% neq 0 goto error

echo [2/4] Compiling project...
call mvn compile
if %errorlevel% neq 0 goto error

echo [3/4] Running tests...
call mvn test

echo [4/4] Packaging JAR...
call mvn package
if %errorlevel% neq 0 goto error

echo Build completed! Starting application...
echo.
call mvn javafx:run
pause
goto menu

:run
echo Starting Expense Tracker...
echo.
call mvn javafx:run
pause
goto menu

:jar_only
echo Creating executable JAR...
call mvn package
if %errorlevel% neq 0 goto error
echo [SUCCESS] JAR created at: target\expense-tracker-1.0.0.jar
echo.
pause
goto menu

:run_jar
if exist "target\expense-tracker-1.0.0.jar" (
    echo Running JAR file...
    java -jar target\expense-tracker-1.0.0.jar
) else (
    echo [ERROR] JAR file not found!
    echo Please build the project first (Option 1 or 4)
)
echo.
pause
goto menu

:error
echo.
echo [ERROR] Build failed!
echo Please check the error messages above
pause
goto menu

:end
echo Exiting...
exit /b 0