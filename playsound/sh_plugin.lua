PLUGIN.name = "Playsound"
PLUGIN.description = "Adds /PlaySound command"
PLUGIN.author = "Apsys"


concommand.Add("playsound", function(ply, cmd, args)
    if (ply:IsSuperAdmin()) then
        for k, v in pairs(player.GetAll()) do
            v:EmitSound(tostring(args[1]))
        end
    else
        print("You need to be Superadmin to use this!")
    end
end)
