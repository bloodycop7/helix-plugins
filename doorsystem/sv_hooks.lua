local PLUGIN = PLUGIN

local function opendoor(ply, door)
	if ( door:GetClass() == "func_door" ) then
		local snd = "buttons/lever8.wav" -- Just incase you forgot to define sound
		for k, v in pairs(PLUGIN.doors) do
			for _, access in pairs(PLUGIN.access) do
				if ( v.access == _ ) then
					snd = access.snd
				end
			end
		end
		
		ply:SetAction("Opening...", 0.5)
		ply:DoStaredAction(door, function()
			door:Fire("open")
			door:EmitSound(snd)
		end, 0.5)
	end
end

function PLUGIN:PlayerUseDoor( ply, door )
	if ( ply:IsCombine() ) then
		--print("PlayerUseDoor")
		for k, v in pairs(PLUGIN.doors) do
			if ( door:MapCreationID() == k ) then
				--print('correct id')
				for _, access in pairs(PLUGIN.access) do
					if ( v.access == _ ) then
						--print('correct access')
						if ( access.checkAccess(ply) ) then
							--print('correct team')
							opendoor(ply, door)
						else
							if ( door:GetClass() == "func_door" ) then
								door:EmitSound("buttons/combine_button_locked.wav")
							end
							ply:ChatNotify("You are not allowed to open this door.")
							return
						end
					end
				end
			else
         	print("Door - " .. door:MapCreationID() .. " does not have a setup ID")
			end
		end
	end
end