local PLUGIN = PLUGIN

local classes = {
   ["func_door"] = true,
   ["prop_door_rotating"] = true
}

local function DrawDoorAccess(ply)
   for k, v in pairs(ents.FindInSphere(ply:GetPos(), 150)) do
       for a, b in pairs(PLUGIN.doors) do
           if ( classes[v:GetClass()] ) and ( tostring(a) == v:MapCreationID() ) then
               local pos = v.LocalToWorld(v, v:OBBCenter()):ToScreen()

               -- The position is not visible from our screen, don't draw and continue onto the next prop
               --if not ( data2D.visible ) then return end

               draw.DrawText(b.name, "BudgetLabel", pos.x, pos.y, ColorAlpha(color_white, 255), TEXT_ALIGN_CENTER)

               if ( b.access ) then
                   for c, d in pairs(PLUGIN.access) do
                       if ( b.access == c ) then
                           draw.DrawText(d.name, "BudgetLabel", pos.x, pos.y - 30, ColorAlpha(d["color"], 255), TEXT_ALIGN_CENTER)
                       end
                   end
               end
           end
       end
   end
end

function PLUGIN:HUDPaint()
   local ply = LocalPlayer()
   local char = ply:GetCharacter()

   if not ( ply or char ) then return end
   
   if not ( ply:IsCombine() ) then return end

   DrawDoorAccess(ply)
end