@echo off
echo 🚀 Setting up your new Roblox TypeScript React project...
echo.

set /p PROJECT_NAME="Enter your project name (or press Enter to use current directory name): "

if "%PROJECT_NAME%"=="" (
    for %%I in (.) do set PROJECT_NAME=%%~nxI
    echo Using directory name: %PROJECT_NAME%
)

echo.
echo 📦 Updating project configuration...

if exist package.json (
    powershell -Command "(Get-Content package.json) -replace '\"name\": \"base\"', '\"name\": \"%PROJECT_NAME%\"' | Set-Content package.json"
    echo ✅ Updated package.json
)

if exist default.project.json (
    powershell -Command "(Get-Content default.project.json) -replace '\"name\": \"base\"', '\"name\": \"%PROJECT_NAME%\"' | Set-Content default.project.json"
    echo ✅ Updated default.project.json
)

if exist README.md (
    powershell -Command "(Get-Content README.md) -replace '<your-repo-url>', 'https://github.com/yourusername/%PROJECT_NAME%.git' | Set-Content README.md"
    echo ✅ Updated README.md
)

echo.
echo 📥 Installing dependencies...
call npm install
if %errorlevel% equ 0 (
    echo ✅ Dependencies installed successfully
) else (
    echo ❌ Failed to install dependencies. Please run 'npm install' manually.
)

echo.
echo 🔄 Setting up new git repository...
if exist .git rmdir /s /q .git
git init
git add .
git commit -m "feat: initial project setup from template"
if %errorlevel% equ 0 (
    echo ✅ Initialized new git repository
) else (
    echo ⚠️ Git initialization failed. You may need to set up git manually.
)

echo.
echo 🧹 Cleaning up setup files...
if exist setup.sh del setup.sh
if exist setup.ps1 del setup.ps1

echo.
echo 🎉 Setup complete!
echo.
echo Your new project '%PROJECT_NAME%' is ready!
echo.
echo Next steps:
echo 1. Start development: npm run watch
echo 2. Open Roblox Studio and sync with Rojo
echo 3. Create GitHub repository: https://github.com/new
echo 4. Add remote: git remote add origin ^<your-repo-url^>
echo 5. Push to GitHub: git push -u origin main
echo.
echo Happy coding! 🎮✨

del "%~f0"
