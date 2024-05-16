import 'libraries/noble/Noble'

import 'utilities/Utilities'

import 'scenes/ExampleScene'
import 'scenes/ExampleScene2'
import "scenes/TitleScreen"
import "scenes/OptionsMenu"

IS_MUSIC_PLAYING = false

Noble.Settings.setup({
	Difficulty = "Medium",
	Music = true
})

Noble.GameData.setup({
	Score = 0
})

Noble.showFPS = false

Noble.new(TitleScreen)
