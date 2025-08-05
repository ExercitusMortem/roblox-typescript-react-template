
import React from "@rbxts/react";

import { createRoot } from "@rbxts/react-roblox";
import { Players } from "@rbxts/services";


const sg = Players.LocalPlayer.WaitForChild("PlayerGui").FindFirstChild("ScreenGui") ?? new Instance("ScreenGui");
sg.Parent = Players.LocalPlayer.WaitForChild("PlayerGui")
const root = createRoot(sg);
root.render(<frame Size={new UDim2(1,0,1,0)} />);
