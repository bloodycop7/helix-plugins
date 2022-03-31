PLUGIN.name = "Bars"
PLUGIN.author = "Apsys"
PLUGIN.descripton = "Adds a config to disable bars"

ix.config.Add("Should Hide Bars", true, "hide bars", nil,{
  category = "HL2RP Hud"
})

function PLUGIN:ShouldHideBars()
  return ix.config.Get("Should Hide Bars")
end
