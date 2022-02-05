PLUGIN.name = "Playsound"
PLUGIN.description = "Adds /PlaySound command"
PLUGIN.author = "Apsys"


ix.command.Add("PlaySound",{
	description = "Play a sound to all users.",
	adminOnly = true,
	OnRun = function(ply, cmd, args)
		if (ply:IsSuperAdmin()) then
			for k, v in pairs(player.GetAll()) do
				v:ConCommand("stopsound")
				v:ConCommand("play "..tostring(args[1]))
			end
		else
			ply:Notify("You need to be Superadmin to use this!")
		end
	end
})
