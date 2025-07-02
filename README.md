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

### Installation

1. **Clone this repository:**
   ```bash
   git clone <your-repo-url>
   cd <your-project-name>
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Start development with hot reloading:**
   ```bash
   npm run watch
   ```

4. **Build for production:**
   ```bash
   npm run build
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
3. **CollisionDetector** - Checks for placement validity
4. **BuilderController** - Client-side input handling and integration
5. **Grid Integration** - Works seamlessly with the Grid system

### Key Classes

#### `Builder`
The main builder class that handles:
- Building mode state
- Preview model management
- Prefab placement logic
- Rotation functionality
- Settings management

#### `PrefabManager`
Manages the collection of available prefabs:
```typescript
const prefabManager = builder.getPrefabManager();
prefabManager.registerPrefab(prefab);
prefabManager.selectPrefab("prefab_id");
```

#### `CollisionDetector`
Handles collision detection for placement validation:
- Checks for overlapping parts
- Supports ignore lists
- Provides detailed collision information

#### `BuilderController`
Client-side controller that integrates everything:
- Mouse input handling
- Grid integration
- User input processing
- Preview updates

## Usage

### Basic Setup

```typescript
import { BuilderController } from "./Builder/BuilderController";
import { Grid } from "./Grid";
import { Prefab } from "../shared/Builder";

// Create grid
const grid = new Grid(
    { x: 4, y: 4, z: 4 }, // Cell size
    { x: 0, y: 0, z: 0 }, // Cell gap
    CellLayout.Rectangle,
    CellSwizzle.XYZ
);

// Create builder controller
const builderController = new BuilderController({
    snapToGrid: true,
    allowRotation: true,
    showPreview: true,
    previewTransparency: 0.7,
    validColor: new Color3(0, 1, 0),
    invalidColor: new Color3(1, 0, 0),
    collisionDetection: true
});

// Set grid and enable
builderController.setGrid(grid);
builderController.enable();
```

### Creating Prefabs

```typescript
function createWallPrefab(): Prefab {
    const model = new Instance("Model");
    model.Name = "Wall";
    
    const part = new Instance("Part");
    part.Size = new Vector3(4, 8, 1);
    part.Material = Enum.Material.Brick;
    part.Color = new Color3(0.7, 0.7, 0.7);
    part.Anchored = true;
    part.Parent = model;
    
    model.PrimaryPart = part;
    
    return {
        id: "wall",
        name: "Wall",
        model: model,
        size: { x: 4, y: 8, z: 1 },
        offset: { x: 0, y: 0, z: 0 }
    };
}

// Register the prefab
const wallPrefab = createWallPrefab();
builderController.registerPrefab(wallPrefab);
builderController.selectPrefab("wall");
```

### Controls

- **B Key**: Toggle building mode on/off
- **R Key**: Rotate prefab (90 degrees clockwise)
- **Left Click**: Place prefab at cursor position
- **Mouse Movement**: Update preview position

### Settings

The builder supports various customizable settings:

```typescript
interface BuilderSettings {
    snapToGrid: boolean;           // Enable grid snapping
    allowRotation: boolean;        // Allow prefab rotation
    showPreview: boolean;          // Show preview model
    previewTransparency: number;   // Preview transparency (0-1)
    validColor: Color3;           // Color for valid placement
    invalidColor: Color3;         // Color for invalid placement
    gridAlignMode: "Center" | "Corner"; // Grid alignment method
    collisionDetection: boolean;  // Enable collision checking
}
```

## Integration with Grid System

The builder seamlessly integrates with the Grid system:

```typescript
// The grid handles coordinate conversion
const gridPos = grid.worldToCell(worldPosition);
const worldPos = grid.getCellCenterWorld(gridPos);

// Builder uses this for snapping
builderController.setGrid(grid);
```

## Advanced Features

### Custom Collision Detection

```typescript
const collisionDetector = builder.getCollisionDetector();

// Add objects to ignore
collisionDetector.addIgnoredInstance(previewModel);

// Check specific collision
const collision = collisionDetector.checkCollision(position, size, rotation);
if (collision.isColliding) {
    console.log("Cannot place here:", collision.reason);
}
```

### Programmatic Placement

```typescript
// Place directly without user input
const result = builder.placePrefab(position, gridPosition);
if (result.success) {
    console.log("Placed successfully at:", result.position);
} else {
    console.log("Placement failed:", result.reason);
}
```

### Managing Building State

```typescript
// Check if in building mode
if (builder.isInBuildingMode()) {
    // Update preview manually
    builder.updatePreview(mousePosition, gridPosition);
}

// Get current rotation
const rotation = builder.getCurrentRotation(); // Returns degrees

// Rotate programmatically
builder.rotatePrefab(45); // Rotate by 45 degrees
```

## Event Handling

The system provides several ways to handle events:

```typescript
// Monitor placement results
const result = builder.placePrefab(position);
if (result.success) {
    // Handle successful placement
    onPrefabPlaced(result);
}

// Check placement validity before placing
const state = builder.getPlacementState(position, prefab);
if (state === PlacementState.Valid) {
    // Safe to place
}
```

## Best Practices

1. **Always set a PrimaryPart** for prefab models
2. **Use appropriate cell sizes** that match your prefab dimensions
3. **Enable collision detection** for realistic building behavior
4. **Register prefabs early** in your initialization code
5. **Handle errors gracefully** when placement fails
6. **Clean up** builder controllers when no longer needed

## Cleanup

Always clean up resources when done:

```typescript
// Disable and destroy the builder controller
builderController.disable();
builderController.destroy();
```

## Example Implementation

See `BuilderExample.client.ts` for a complete working example with multiple prefabs, ground plane, and interactive controls.
