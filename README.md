# Roblox TypeScript React Template

A modern, scalable template for Roblox game development using TypeScript and React. This template provides a well-organized folder structure with UI components, state management, and clean architecture patterns.

## 🚀 Features

- **TypeScript** - Full type safety with Roblox TypeScript
- **React** - Modern UI development with @rbxts/react
- **State Management** - Reflex for predictable state management
- **Component Architecture** - Organized foundation and feature components
- **Modern Patterns** - Hooks, functional components, and clean separation of concerns
- **Developer Experience** - ESLint, Prettier, and hot reloading

## 📦 Dependencies

### Core Libraries
- `@rbxts/react` - React for Roblox UI
- `@rbxts/react-roblox` - React renderer for Roblox
- `@rbxts/reflex` - State management
- `@rbxts/services` - Roblox services
- `@rbxts/net` - Networking utilities

### UI & Utilities
- `@rbxts/pretty-react-hooks` - Useful React hooks
- `@rbxts/colour-utils` - Color manipulation utilities
- `@rbxts/object-utils` - Object manipulation utilities
- `@rbxts/sift` - Immutable array operations
- `@rbxts/signal` - Event handling
- `@rbxts/ui-labs` - UI component development tools

## 🏗️ Project Structure

```
src/
├── client/                     # Client-side code
│   ├── components/            # React UI components
│   │   ├── foundation/        # Base reusable components
│   │   ├── features/          # Feature-specific components
│   │   ├── layouts/           # Layout components
│   │   └── screens/           # Full screen components
│   ├── controllers/           # Client-side game controllers
│   ├── hooks/                 # Custom React hooks
│   ├── services/              # Client-side services
│   ├── stores/                # State management
│   └── utils/                 # Client utilities
├── server/                    # Server-side code
│   ├── services/              # Server-side game logic
│   ├── controllers/           # Server controllers
│   ├── middleware/            # Server middleware
│   └── utils/                 # Server utilities
└── shared/                    # Shared code
    ├── types/                 # TypeScript type definitions
    ├── constants/             # Game constants
    ├── network/               # Network definitions
    ├── config/                # Configuration files
    ├── utils/                 # Shared utilities
    └── enums/                 # Shared enumerations
```

## 🛠️ Getting Started

### Prerequisites
- [Node.js](https://nodejs.org/) (v16 or higher)
- [Roblox Studio](https://www.roblox.com/create)

### Quick Start (One Command Setup)

**For Windows (PowerShell):**
```powershell
git clone https://github.com/ExercitusMortem/roblox-typescript-react-template.git my-new-game && cd my-new-game && .\setup.ps1
```

**For Windows (Command Prompt):**
```cmd
git clone https://github.com/ExercitusMortem/roblox-typescript-react-template.git my-new-game && cd my-new-game && setup.bat
```

**For macOS/Linux (Bash):**
```bash
git clone https://github.com/ExercitusMortem/roblox-typescript-react-template.git my-new-game && cd my-new-game && ./setup.sh
```

**What this does:**
1. ✅ Clones the template repository
2. ✅ Navigates into your new project directory  
3. ✅ Prompts for your project name
4. ✅ Updates all configuration files (package.json, default.project.json, README.md)
5. ✅ Installs all dependencies
6. ✅ Removes template git history
7. ✅ Initializes a fresh git repository
8. ✅ Makes initial commit
9. ✅ Cleans up setup files
10. ✅ Ready to start coding!

### Manual Installation

1. **Use this template on GitHub:**
   - Click "Use this template" button on GitHub
   - Create your new repository

2. **Clone your new repository:**
   ```bash
   git clone <your-repo-url>
   cd <your-project-name>
   ```

3. **Run setup:**
   ```bash
   npm install
   ```

4. **Start development:**
   ```bash
   npm run watch
   ```

### Setting up Roblox Studio

1. Open Roblox Studio
2. Create a new place or open an existing one
3. In the Explorer, create a folder structure that matches your `default.project.json`
4. Use the Rojo plugin to sync your code with Studio

## 🎨 Component Development

### Foundation Components
Build reusable UI components in `src/client/components/foundation/`:
- Buttons, inputs, modals, tooltips
- Progress bars, sliders, and other common elements

### Feature Components
Create feature-specific components in `src/client/components/features/`:
- Inventory systems, shop interfaces
- Health bars, chat systems, leaderboards

### Example Component Structure
```typescript
// src/client/components/foundation/button/button.tsx
import React from '@rbxts/react';

interface ButtonProps {
    text: string;
    onClick: () => void;
    disabled?: boolean;
}

export const Button: React.FC<ButtonProps> = ({ text, onClick, disabled = false }) => {
    return (
        <textbutton
            Text={text}
            Size={UDim2.fromOffset(100, 30)}
            BackgroundColor3={disabled ? Color3.fromRGB(128, 128, 128) : Color3.fromRGB(0, 162, 255)}
            TextColor3={Color3.fromRGB(255, 255, 255)}
            Event={{
                MouseButton1Click: disabled ? undefined : onClick,
            }}
        />
    );
};
```

## 🔧 Development Scripts

- `npm run build` - Build the project for production
- `npm run watch` - Start development with hot reloading

## 🎯 Best Practices

### TypeScript Guidelines
- Use `const` for variables that don't change
- Use `let` for variables that may change
- Avoid `var` unless necessary
- Use `typeOf()` and `typeIs()` instead of `typeof`
- Use `.size()` instead of `.length` for arrays

### React Guidelines
- Use functional components with hooks
- Follow DRY and SOLID principles
- Organize components by complexity and feature
- Use custom hooks for reusable logic

### File Organization
- Keep related files together in feature folders
- Use index files to export multiple components
- Separate concerns between client, server, and shared code

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the ISC License.

## 🔗 Useful Links

- [Roblox TypeScript Documentation](https://roblox-ts.com/)
- [React for Roblox Guide](https://github.com/roblox-ts/react-roblox)
- [Reflex State Management](https://github.com/littensy/reflex)
- [Roblox Developer Hub](https://developer.roblox.com/)

---

**Happy coding! 🎮✨**
