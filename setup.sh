#!/bin/bash

# Roblox TypeScript React Template Setup Script
# Run this script after cloning the template to set up a new project

echo "🚀 Setting up your new Roblox TypeScript React project..."
echo ""

# Get project name from user
read -p "Enter your project name (or press Enter to use current directory name): " PROJECT_NAME

if [ -z "$PROJECT_NAME" ]; then
    PROJECT_NAME=$(basename "$PWD")
    echo "Using directory name: $PROJECT_NAME"
fi

# Validate and clean project name
PROJECT_NAME=$(echo "$PROJECT_NAME" | sed 's/[^a-zA-Z0-9-_]/-/g')
echo "Project name: $PROJECT_NAME"
echo ""

echo "📦 Updating project configuration..."

# Update package.json with new project name
if [ -f "package.json" ]; then
    sed -i.bak "s/\"name\": \"base\"/\"name\": \"$PROJECT_NAME\"/" package.json && rm package.json.bak
    echo "✅ Updated package.json"
fi

# Update project name in default.project.json if it exists
if [ -f "default.project.json" ]; then
    sed -i.bak "s/\"name\": \"base\"/\"name\": \"$PROJECT_NAME\"/" default.project.json && rm default.project.json.bak
    echo "✅ Updated default.project.json"
fi

# Update README.md
if [ -f "README.md" ]; then
    sed -i.bak "s/<your-repo-url>/https:\/\/github.com\/yourusername\/$PROJECT_NAME.git/g" README.md && rm README.md.bak
    echo "✅ Updated README.md"
fi

# Install dependencies
echo ""
echo "📥 Installing dependencies..."
if npm install; then
    echo "✅ Dependencies installed successfully"
else
    echo "❌ Failed to install dependencies. Please run 'npm install' manually."
fi

# Remove the original git history and initialize new repository
echo ""
echo "🔄 Setting up new git repository..."

if [ -d ".git" ]; then
    rm -rf .git
    echo "✅ Removed template git history"
fi

if git init && git add . && git commit -m "feat: initial project setup from template"; then
    echo "✅ Initialized new git repository"
else
    echo "⚠️  Git initialization failed. You may need to set up git manually."
fi

# Remove setup scripts
echo ""
echo "🧹 Cleaning up setup files..."
if [ -f "setup.ps1" ]; then
    rm setup.ps1
    echo "✅ Removed setup.ps1"
fi

echo ""
echo "🎉 Setup complete!"
echo ""
echo "Your new project '$PROJECT_NAME' is ready!"
echo ""
echo "Next steps:"
echo "1. Start development: npm run watch"
echo "2. Open Roblox Studio and sync with Rojo"
echo "3. Create GitHub repository: https://github.com/new"
echo "4. Add remote: git remote add origin <your-repo-url>"
echo "5. Push to GitHub: git push -u origin main"
echo ""
echo "Happy coding! 🎮✨"

# Remove this setup script
rm "$0"
