#!/bin/bash

# Roblox TypeScript React Template Setup Script
# Run this script after cloning the template to set up a new project

echo "🚀 Setting up your new Roblox TypeScript React project..."

# Get project name from user
read -p "Enter your project name: " PROJECT_NAME

if [ -z "$PROJECT_NAME" ]; then
    echo "❌ Project name cannot be empty"
    exit 1
fi

# Update package.json with new project name
echo "📦 Updating package.json..."
sed -i "s/\"name\": \"base\"/\"name\": \"$PROJECT_NAME\"/" package.json

# Update project name in default.project.json if it exists
if [ -f "default.project.json" ]; then
    echo "🔧 Updating default.project.json..."
    sed -i "s/\"name\": \"base\"/\"name\": \"$PROJECT_NAME\"/" default.project.json
fi

# Update README.md
echo "📝 Updating README.md..."
sed -i "s/<your-project-name>/$PROJECT_NAME/g" README.md

# Install dependencies
echo "📥 Installing dependencies..."
npm install

echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Initialize git repository: git init"
echo "2. Add remote origin: git remote add origin <your-repo-url>"
echo "3. Start development: npm run watch"
echo "4. Open Roblox Studio and sync with Rojo"
echo ""
echo "Happy coding! 🎮✨"
