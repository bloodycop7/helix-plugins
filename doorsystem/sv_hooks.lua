local function opendoor(ply, door)
	local snd = "buttons/lever8.wav" -- Just incase you forgot to define sound
	for k, v in pairs(PLUGIN.doors) do
		for _, access in pairs(PLUGIN.access) do
			if ( v["access"] == _ ) then
				snd = access["sound"]
			end
		end
	end
	ply:SetAction("Opening...", 0.5)
	ply:DoStaredAction(door, function()
		door:Fire("open")
		door:EmitSound(snd)
	end, 0.5)
end

function PLUGIN:PlayerUseDoor( ply, door )
	if ( ply:IsCombine() ) then
		--print("PlayerUseDoor")
		for k, v in pairs(PLUGIN.doors) do
			if ( door:MapCreationID() == k ) then
				--print('correct id')
				for _, access in pairs(PLUGIN.access) do
					if ( v["access"] == _ ) then
						--print('correct access')
						if ( table.HasValue(access["factions"], ply:Team()) ) then
							--print('correct team')
							opendoor(ply, door)
						else
							door:EmitSound("buttons/combine_button_locked.wav")
							ply:Notify("Access Denied")
						end
					end
				end
			else
         	print("Door - " .. door:MapCreationID() .. " does not have a setup ID")
			end
		end
	end
end