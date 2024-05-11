import "CoreLibs/graphics"

local pd <const> = playdate
local gfx <const> = pd.graphics

local playerX, playerY = 200, 120
local playerRadius = 10

function pd.update()
    gfx.fillCircleAtPoint(playerX, playerY, playerRadius)
end