TitleScreen = {}
class("TitleScreen").extends(NobleScene)

local scene = TitleScreen

function scene:setValues()
    self.background = Graphics.image.new("assets/images/background1")

    self.color1 = Graphics.kColorBlack
    self.color2 = Graphics.kColorWhite

    self.menu = nil
    self.sequence = nil

    self.menuX = 127

    self.menuYFrom = -50
    self.menuY = 120
    self.menuYTo = 240
end

function scene:init()
    scene.super.init(self)

    self:setValues()

    self.menu = Noble.Menu.new(false, Noble.Text.ALIGN_LEFT, false, self.color2, 4, 6, 0, Noble.Text.FONT_LARGE)

    self:setupMenu(self.menu)

    self.music = playdate.sound.fileplayer.new("assets/sounds/neon")

    local crankTick = 0

    self.inputHandler = {
        upButtonDown = function()
            self.menu:selectPrevious()
        end,
        downButtonDown = function()
            self.menu:selectNext()
        end,
        cranked = function(change)
            crankTick = crankTick + change
            if (crankTick > 30) then
                crankTick = 0
                self.menu:selectNext()
            elseif (crankTick < -30) then
                crankTick = 0
                self.menu:selectPrevious()
            end
        end,
        AButtonDown = function()
            self.menu:click()
        end
    }
end

function scene:enter()
    scene.super.enter(self)
    self.sequence = Sequence.new():from(self.menuYFrom):to(self.menuY, 1.5, Ease.outBounce):start()

    self.music:play(0)
end

function scene:update()
    scene.super.update(self)

    Graphics.setColor(self.color1)
    Graphics.setDitherPattern(0.2, Graphics.image.kDitherTypeScreen)
    Graphics.fillRoundRect(self.menuX, self.sequence:get() or self.menuY, 145, 75, 15)
    self.menu:draw(self.menuX + 15, self.sequence:get() + 8 or self.menuY + 8)

    Graphics.setColor(Graphics.kColorBlack)
end

function scene:drawBackground()
    scene.super.drawBackground(self)
    self.background:draw(0, 0)
end

function scene:start()
    scene.super.start(self)
    self.menu:activate()
end

function scene:setupMenu(__menu)
    __menu:addItem("Continue")
    __menu:addItem("New Game")
    __menu:addItem("Options")
end
