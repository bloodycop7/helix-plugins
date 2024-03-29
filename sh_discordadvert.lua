local PLUGIN = PLUGIN

PLUGIN.name = "Discord Reminder"
PLUGIN.description = "Discord Invite Reminder"
PLUGIN.author = "eon (bloodycop)"

--[[------------------------------------------------
                PLUGIN CONFIGURATION
----------------------------------------------------]]
PLUGIN.discord = "" -- Permanent Discord Invite Link
PLUGIN.serverName = "" -- Name of your server

ix.lang.AddTable("english", {
	optdiscordReminder = "Discord Reminder"
})

ix.config.Add("discordReminder", true, "Should the discord reminder function.", nil, {
    category = PLUGIN.name
})

if ( SERVER ) then
    util.AddNetworkString("SchemaDiscordAdvert") 

    function Schema:MakeAnnouncement(text)
        net.Start("SchemaDiscordAdvert")
            net.WriteString(text)
        net.Broadcast()
    end

    if not ( timer.Exists("SchemaDiscordAdvertTimer") ) then
        timer.Create("SchemaDiscordAdvertTimer", math.random(120, 360), 0, function()
            if ( ix.config.Get("discordReminder", false) ) then
                Schema:MakeAnnouncement("Please make sure to join our discord! " .. PLUGIN.discord)
            end
        end)
    else
        timer.Remove("SchemaDiscordAdvertTimer")
        timer.Create("SchemaDiscordAdvertTimer", math.random(120, 360), 0, function()
            if ( ix.config.Get("discordReminder", false) ) then
                Schema:MakeAnnouncement("Please make sure to join our discord! " .. PLUGIN.discord)
            end
        end)
    end
else 
    net.Receive("SchemaDiscordAdvert", function(len)
        local txt = net.ReadString() or ""

        chat.AddText(ix.config.Get("color"), PLUGIN.serverName .. " Announcement", color_white, ": " .. txt)
    end)
end
