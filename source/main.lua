import 'libraries/noble/Noble'

import 'utilities/Utilities'

import 'scenes/ExampleScene'
import 'scenes/ExampleScene2'
import "scenes/TitleScreen"

Noble.Settings.setup({
	Difficulty = "Medium",
	Music = true
})

Noble.GameData.setup({
	Score = 0
})

Noble.showFPS = true

Noble.new(TitleScreen)
