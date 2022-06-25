-- Services:
local Players = game:GetService("Players")


-- Constants:
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local CurrentCamera = game:GetService("Workspace").CurrentCamera
local WorldToViewportPoint = CurrentCamera.WorldToViewportPoint


-- Functions:
local function draw(object, properties)
    if (Drawing) then
        local newDrawing = Drawing.new(object)

        properties = properties or {}
        for property, value in pairs(properties) do
            newDrawing[property] = value
        end

        return newDrawing
    end
end


-- Module:
