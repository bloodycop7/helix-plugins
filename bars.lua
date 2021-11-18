PLUGIN.name = "Bars"
PLUGIN.author = "Olegle"
PLUGIN.descripton = "Adds a config to disable bars"

ix.config.Add("Should Hide Bars", true, "hide bars", nil,{
  category = "HL2RP Hud"
})

function PLUGIN:ShouldHideBars()
  if ix.config.Get("Should Hide Bars", true) then
    return true
  end
end
