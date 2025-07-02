# Roblox TypeScript React Template Setup Script (PowerShell)
# Run this script after cloning the template to set up a new project

Write-Host "🚀 Setting up your new Roblox TypeScript React project..." -ForegroundColor Green
Write-Host ""

# Get project name from user
$PROJECT_NAME = Read-Host "Enter your project name (or press Enter to use current directory name)"

if ([string]::IsNullOrWhiteSpace($PROJECT_NAME)) {
    $PROJECT_NAME = Split-Path -Leaf (Get-Location)
    Write-Host "Using directory name: $PROJECT_NAME" -ForegroundColor Yellow
}

# Validate project name
if ($PROJECT_NAME -match '[^a-zA-Z0-9-_]') {
    Write-Host "⚠️  Project name contains special characters. Converting to safe format..." -ForegroundColor Yellow
    $PROJECT_NAME = $PROJECT_NAME -replace '[^a-zA-Z0-9-_]', '-'
    Write-Host "New project name: $PROJECT_NAME" -ForegroundColor Green
}

Write-Host ""
Write-Host "📦 Updating project configuration..." -ForegroundColor Yellow

# Update package.json with new project name
if (Test-Path "package.json") {
    (Get-Content package.json) -replace '"name": "base"', "`"name`": `"$PROJECT_NAME`"" | Set-Content package.json
    Write-Host "✅ Updated package.json" -ForegroundColor Green
}

# Update project name in default.project.json if it exists
if (Test-Path "default.project.json") {
    (Get-Content default.project.json) -replace '"name": "base"', "`"name`": `"$PROJECT_NAME`"" | Set-Content default.project.json
    Write-Host "✅ Updated default.project.json" -ForegroundColor Green
}

# Update README.md
if (Test-Path "README.md") {
    (Get-Content README.md) -replace '<your-repo-url>', "https://github.com/yourusername/$PROJECT_NAME.git" | Set-Content README.md
    Write-Host "✅ Updated README.md" -ForegroundColor Green
}

# Install dependencies
Write-Host ""
Write-Host "📥 Installing dependencies..." -ForegroundColor Yellow
try {
    npm install
    Write-Host "✅ Dependencies installed successfully" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to install dependencies. Please run 'npm install' manually." -ForegroundColor Red
}

# Remove the original git history and initialize new repository
Write-Host ""
Write-Host "🔄 Setting up new git repository..." -ForegroundColor Yellow

if (Test-Path ".git") {
    Remove-Item -Recurse -Force ".git"
    Write-Host "✅ Removed template git history" -ForegroundColor Green
}

try {
    git init
    git add .
    git commit -m "feat: initial project setup from template"
    Write-Host "✅ Initialized new git repository" -ForegroundColor Green
} catch {
    Write-Host "⚠️  Git initialization failed. You may need to set up git manually." -ForegroundColor Yellow
}

# Remove setup scripts
Write-Host ""
Write-Host "🧹 Cleaning up setup files..." -ForegroundColor Yellow
if (Test-Path "setup.sh") {
    Remove-Item "setup.sh"
    Write-Host "✅ Removed setup.sh" -ForegroundColor Green
}
if (Test-Path "setup.ps1") {
    Write-Host "Note: setup.ps1 will be removed after this script completes" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "🎉 Setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Your new project '$PROJECT_NAME' is ready!" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Start development: " -NoNewline -ForegroundColor White
Write-Host "npm run watch" -ForegroundColor Yellow
Write-Host "2. Open Roblox Studio and sync with Rojo" -ForegroundColor White
Write-Host "3. Create GitHub repository: " -NoNewline -ForegroundColor White
Write-Host "https://github.com/new" -ForegroundColor Blue
Write-Host "4. Add remote: " -NoNewline -ForegroundColor White
Write-Host "git remote add origin <your-repo-url>" -ForegroundColor Yellow
Write-Host "5. Push to GitHub: " -NoNewline -ForegroundColor White
Write-Host "git push -u origin main" -ForegroundColor Yellow
Write-Host ""
Write-Host "Happy coding! 🎮✨" -ForegroundColor Magenta

# Remove this setup script
Remove-Item $MyInvocation.MyCommand.Path
