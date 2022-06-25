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
local ESPManager = {
    ESP = {
        Enabled = true,
        EnabledBind = "M",
        TeamColor = false,
        TeamCheck = false,

        Boxes = {
            Enabled = true,
            Color3 = Color3.fromRGB(0, 0, 0),
            OutlineColor3 = Color3.fromRGB(255, 255, 255),
            Thickness = 2,
            OutlineThickness = 4,
            FaceCamera = false,

            Objects = setmetatable({}, {__mode = "kv"})
        },
    }
}

function ESPManager:getTeam(player)
    if player and player.Team then
        return player.Team
    end
end

function ESPManager:isTeammate(player)
    if player and (self:getTeam(player) == self:getTeam(LocalPlayer)) then
        return true
    else 
        return false
    end
end

function ESPManager:getPlayerFromCharacter(character)
    if character then
        return LocalPlayer:GetPlayerFromCharacter(character)
    end
end

function ESPManager:getColor(character, types)
    if character then
        local player = self:getPlayerFromCharacter(character)
        if player then
            if types == "Box" then
                if player.Team and self.ESP.TeamColor == true then
                    return player.Team.TeamColor.Color
                else
                    return self.ESP.Boxes.Color3, self.ESP.Boxes.OutlineColor3
                end
            end
        end 
    end
end

function ESPManager:addBox(object, options)
    
end



return ESPManager