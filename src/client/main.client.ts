import { Workspace } from "@rbxts/services";
import { Grid } from "./Grid";
import { CellLayout, CellSwizzle, Point3D } from './Grid/Types';
import { Raycaster } from "./Util/Raycaster";

const grid = new Grid({x:4,y:4,z:4},  {x:0,y:0,z:0},  CellLayout.Rectangle, CellSwizzle.XYZ);
print(grid.getCellCenterLocal({x:1,y:1,z:1}));

const rc = new Raycaster({
    length: 1000,
    filter: {
        FilterType: Enum.RaycastFilterType.Blacklist,
        FilterDescendantsInstances: [Workspace.CurrentCamera!],
    }
});

const part = new Instance("Part");
part.Size = new Vector3(4, 4, 4);
part.Position = new Vector3(0, 0, 0);
part.Anchored = true;
part.Parent = Workspace.CurrentCamera;
part.CanCollide = false;

rc.onRayFired((result: RaycastResult | undefined, origin: Vector3, direction: Vector3) => {
    if (result) {
        const pos = grid.worldToCell({x: result.Position.X, y: result.Position.Y, z: result.Position.Z});
        const cellCenter = grid.getCellCenterWorld(pos);
        
        // Offset the part to be centered and above the grid
        const offsetY = part.Size.Y / 4; // Half the part height to position it above the surface
        part.Position = new Vector3(cellCenter.x, cellCenter.y + offsetY, cellCenter.z);

        print(`Snapped to cell at: ${pos.x}, ${pos.y}, ${pos.z}`);
    }
});
rc.start();
