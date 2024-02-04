PLUGIN.name = "Bars"
PLUGIN.author = "eon (bloodycop)"
PLUGIN.descripton = "Adds a config to disable bars"

ix.config.Add("shouldHideBars", true, "hide bars", nil,{
  category = "Appearance"
})

function PLUGIN:ShouldHideBars()
  return ix.config.Get("shouldHideBars", false)
end
