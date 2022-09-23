local PLUGIN = PLUGIN

PLUGIN.name = "Character Bodygroups Saver"
PLUGIN.author = "Drobcho"

local meta = FindMetaTable("Player")

function meta:GetCharGroups()
    if ( self:GetCharacter() ) then
        return self:GetChar():GetData(self:GetCharacter():GetModel().."Bodygroups", {})
    end
end

if ( SERVER ) then
    function PLUGIN:PlayerLoadedCharacter(ply, ochar, char)
        if not ( ply:GetCharGroups() ) then
            local bg = {}

            for k, v in pairs(ply:GetBodyGroups()) do
                bg[tonumber(k) or 0] = v.id or 0
            end
            
            char:SetData(char:GetModel().."Bodygroups", bg)
        else
            local bg = {}

            for k, v in pairs(ply:GetBodyGroups()) do
                bg[tonumber(k) or 0] = v.id or 0
            end
            
            char:SetData(char:GetModel().."Bodygroups", bg)
        end

        for k, v in pairs(ply:GetCharGroups()) do
            ply:SetBodygroup(k, v)
        end
    end

    function PLUGIN:PlayerTick(ply)
        local char = ply:GetChar()

        if not ( char ) then return end

        if not ( ply:GetCharGroups() ) then
            local bg = {}

            for k, v in pairs(ply:GetBodyGroups()) do
                bg[tonumber(k) or 0] = v.id or 0
            end
            
            char:SetData(char:GetModel().."Bodygroups", bg)
        else
            local bg = {}

            for k, v in pairs(ply:GetBodyGroups()) do
                bg[tonumber(k) or 0] = v.id or 0
            end
            
            char:SetData(char:GetModel().."Bodygroups", bg)
        end

        for k, v in pairs(ply:GetCharGroups()) do
            ply:SetBodygroup(k, v)
        end
    end

    function PLUGIN:ShouldResetPlayerBodygroupsOnDeath(ply, char, bg)
        return true
    end

    function PLUGIN:PlayerDeath(ply)
        local reset = {}
        if ( hook.Run("ShouldResetPlayerBodygroupsOnDeath", ply, ply:GetCharacter(), ply:GetBodyGroups()) == true ) then
            for k, v in pairs(ply:GetBodyGroups()) do
                reset[k] = 0
                ply:GetChar():SetData(char:GetModel().."Bodygroups", reset)
                ply:SetBodygroup(k, 0)
            end
        end
    end
end