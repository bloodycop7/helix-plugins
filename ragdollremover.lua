local PLUGIN = PLUGIN

PLUGIN.name = "Ragdoll Remover"
PLUGIN.author = "Skay"
PLUGIN.description = "Removes all ragdolls found on the ground."

ix.config.Add("ragdoll_remove_time", 60, "How long to wait before removing ragdolls.", nil, {
   data = {min = 0, max = 120},
   category = self.name
})

ix.config.Add("ragdoll_remove_enabled", false, "Should ragdoll remover be enabled?", nil, {
   category = self.name
})

if ( SERVER ) then
   function PLUGIN:Tick()
      if ( ix.config.Get("ragdoll_remove_enabled") ) then
         if not ( timer.Exists("ragdollremovetimer") ) then
            timer.Create("ragdollremovetimer", ix.config.Get("ragdoll_remove_time", 60), 0, function()
               for k, v in pairs(ents.FindByClass("prop_ragdoll")) do
                  SafeRemoveEntity(v)
               end
            end)
         end
      else
         if ( timer.Exists("ragdollremovetimer") ) then
            timer.Remove("ragdollremovetimer")
         end
      end
   end
end
