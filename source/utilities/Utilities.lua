-- Put your utilities and other helper functions here.
-- The "Utilities" table is already defined in "noble/Utilities.lua."
-- Try to avoid name collisions.

function Utilities.getZero()
	return 0
end

function Utilities.createMenuInputHandler(menu, onBButtonDown)
    local crankTick = 0
    return {
        upButtonDown = function()
            menu:selectPrevious()
        end,
        downButtonDown = function()
            menu:selectNext()
        end,
        cranked = function(change)
            crankTick = crankTick + change
            if (crankTick > 30) then
                crankTick = 0
                menu:selectNext()
            elseif (crankTick < -30) then
                crankTick = 0
                menu:selectPrevious()
            end
        end,
        AButtonDown = function()
            menu:click()
        end,
        BButtonDown = onBButtonDown
    }
end

function Utilities.setupMenuScene(scene, backgroundPath)
    scene.background = Graphics.image.new(backgroundPath)
    scene.color1 = Graphics.kColorBlack
    scene.color2 = Graphics.kColorWhite
    scene.menuX = 127
    scene.menuYFrom = -50
    scene.menuY = 120
    scene.menuYTo = 240
    
    scene.menu = Noble.Menu.new(false, Noble.Text.ALIGN_LEFT, false, scene.color2, 4, 6, 0, Noble.Text.FONT_LARGE)
end

function Utilities.updateMenuScene(scene)
    Graphics.setColor(scene.color1)
    Graphics.setDitherPattern(0.2, Graphics.image.kDitherTypeScreen)
    Graphics.fillRoundRect(scene.menuX, scene.sequence:get() or scene.menuY, 145, 75, 15)
    
    scene.menu:draw(scene.menuX + 15, scene.sequence:get() + 8 or scene.menuY + 8)
    
    Graphics.setColor(Graphics.kColorBlack)
end