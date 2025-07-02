# Roblox TypeScript React Template Setup Script (PowerShell)
# Run this script after cloning the template to set up a new project

Write-Host "🚀 Setting up your new Roblox TypeScript React project..." -ForegroundColor Green

# Get project name from user
$PROJECT_NAME = Read-Host "Enter your project name"

if ([string]::IsNullOrWhiteSpace($PROJECT_NAME)) {
    Write-Host "❌ Project name cannot be empty" -ForegroundColor Red
    exit 1
}

# Update package.json with new project name
Write-Host "📦 Updating package.json..." -ForegroundColor Yellow
(Get-Content package.json) -replace '"name": "base"', "`"name`": `"$PROJECT_NAME`"" | Set-Content package.json

# Update project name in default.project.json if it exists
if (Test-Path "default.project.json") {
    Write-Host "🔧 Updating default.project.json..." -ForegroundColor Yellow
    (Get-Content default.project.json) -replace '"name": "base"', "`"name`": `"$PROJECT_NAME`"" | Set-Content default.project.json
}

# Update README.md
Write-Host "📝 Updating README.md..." -ForegroundColor Yellow
(Get-Content README.md) -replace '<your-project-name>', $PROJECT_NAME | Set-Content README.md

# Install dependencies
Write-Host "📥 Installing dependencies..." -ForegroundColor Yellow
npm install

Write-Host "✅ Setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Initialize git repository: git init" -ForegroundColor White
Write-Host "2. Add remote origin: git remote add origin <your-repo-url>" -ForegroundColor White
Write-Host "3. Start development: npm run watch" -ForegroundColor White
Write-Host "4. Open Roblox Studio and sync with Rojo" -ForegroundColor White
Write-Host ""
Write-Host "Happy coding! 🎮✨" -ForegroundColor Magenta
