local PLUGIN = PLUGIN

PLUGIN.name = "Playsound"
PLUGIN.description = "Adds /PlaySound command"
PLUGIN.author = "Skay"

if ( SERVER ) then
   util.AddNetworkString("ixPlaysoundPlay")

   ix.command.Add("PlaySound", {
      description = "Plays a sound.",
      arguments = ix.type.string,
      OnRun = function(_, ply, sound)
         if not ( ply:IsSuperAdmin() ) then
            ply:Notify("You don't have access to this command.")
            return
         end
         
         net.Start("ixPlaysoundPlay")
            net.WriteString(tostring(sound))
         net.Broadcast()
      end
   })
else
   net.Receive("ixPlaysoundPlay", function(len)
      local snd = net.ReadString()
      
      LocalPlayer():EmitSound(tostring(snd))
   end)   
end
