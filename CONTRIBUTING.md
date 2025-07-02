# Contributing to Roblox TypeScript React Template

Thank you for your interest in contributing to this template! This document provides guidelines and information for contributors.

## 🎯 Goals

This template aims to provide:
- A modern, scalable foundation for Roblox game development
- Best practices for TypeScript and React in Roblox
- Clean, maintainable code architecture
- Excellent developer experience

## 🛠️ Development Setup

1. **Fork and clone the repository**
   ```bash
   git clone https://github.com/yourusername/roblox-typescript-react-template.git
   cd roblox-typescript-react-template
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start development**
   ```bash
   npm run watch
   ```

## 📝 Code Style

### TypeScript Guidelines
- Use `const` for variables that don't change
- Use `let` for variables that may change
- Avoid `var` unless absolutely necessary
- Use `typeOf()` and `typeIs()` instead of JavaScript's `typeof`
- Use `.size()` instead of `.length` for arrays
- Always define proper TypeScript interfaces and types

### React Guidelines
- Use functional components with hooks
- Prefer custom hooks for reusable logic
- Follow the component hierarchy: foundation → features → layouts → screens
- Use proper prop interfaces for all components
- Implement proper error boundaries where needed

### File Organization
- Keep related files together in feature folders
- Use index.ts files to create clean imports
- Maintain clear separation between client, server, and shared code
- Follow the established folder structure

### Naming Conventions
- Use PascalCase for components and interfaces
- Use camelCase for variables, functions, and hooks
- Use kebab-case for folder names
- Use UPPER_SNAKE_CASE for constants

## 🏗️ Architecture Principles

### Separation of Concerns
- **Client**: UI components, controllers, local state
- **Server**: Game logic, data persistence, validation
- **Shared**: Types, constants, utilities, network definitions

### Component Architecture
- **Foundation**: Basic, reusable UI components
- **Features**: Domain-specific components
- **Layouts**: Page-level structure components
- **Screens**: Full-screen view components

### State Management
- Use Reflex for global state management
- Keep local state in components when appropriate
- Use custom hooks for complex state logic

## 🔄 Making Changes

### Before You Start
1. Check existing issues and discussions
2. Create an issue for new features or significant changes
3. Fork the repository and create a feature branch

### Development Process
1. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes**
   - Write clean, documented code
   - Follow the established patterns
   - Add comments for complex logic

3. **Test your changes**
   - Ensure the project builds successfully
   - Test in Roblox Studio if applicable
   - Verify no existing functionality is broken

4. **Commit your changes**
   ```bash
   git commit -m "feat: add your feature description"
   ```

### Commit Message Format
Use conventional commits format:
- `feat:` for new features
- `fix:` for bug fixes
- `docs:` for documentation changes
- `style:` for formatting changes
- `refactor:` for code refactoring
- `test:` for adding tests
- `chore:` for maintenance tasks

## 📋 Pull Request Process

1. **Update documentation** if needed
2. **Ensure all checks pass**
3. **Write a clear PR description** explaining:
   - What changes were made
   - Why they were made
   - How to test them

4. **Request review** from maintainers
5. **Address feedback** promptly and professionally

## 🐛 Reporting Issues

When reporting issues, please include:
- Clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- Environment details (Node.js version, OS, etc.)
- Code examples if applicable

## 💡 Suggesting Features

For feature suggestions:
- Check if it aligns with the template's goals
- Explain the use case and benefits
- Consider backwards compatibility
- Provide implementation ideas if possible

## 📚 Resources

- [Roblox TypeScript Documentation](https://roblox-ts.com/)
- [React for Roblox](https://github.com/roblox-ts/react-roblox)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)
- [Roblox Developer Hub](https://developer.roblox.com/)

## ❓ Questions?

If you have questions:
1. Check existing issues and discussions
2. Create a new discussion
3. Reach out to maintainers

Thank you for contributing! 🎮✨
