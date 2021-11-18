PLUGIN.name = "Bars"
PLUGIN.author = "Olegle"
PLUGIN.descripton = "Adds custom hud and disables bars"

ix.config.Add("Should Display Bars", true, "hide bars", nil,{
  category = "HL2RP Hud"
})

function PLUGIN:ShouldHideBars()
  if ix.config.Get("Should Display Bars", false) then
    return true
  end
end
