import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"

import "../toyboxes/toyboxes.lua"
import "menus/main_menu"

MainMenu(200, 120, 400, 240)

function playdate.update()
    playdate.graphics.clear()
    playdate.graphics.sprite.update()
end
