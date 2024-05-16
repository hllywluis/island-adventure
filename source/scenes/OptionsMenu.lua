OptionsMenu = {}
class("OptionsMenu").extends(NobleScene)

local scene = OptionsMenu

function scene:init()
    OptionsMenu.super.init(self)
    self:setValues()

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
        end,
        BButtonDown = function()
            Noble.transition(TitleScreen)
        end
    }
end

function scene:setValues()
    self.background = Graphics.image.new("assets/images/background2")

    self.color1 = Graphics.kColorBlack
    self.color2 = Graphics.kColorWhite

    self.menu = Noble.Menu.new(false, Noble.Text.ALIGN_LEFT, false, self.color2, 4, 6, 0, Noble.Text.FONT_LARGE)

    self.menuX = 127

    self.menuYFrom = -50
    self.menuY = 120
    self.menuYTo = 240

    self.menu:addItem("Sound", function()
        -- Add your logic to toggle sound here
        print("Sound toggled")
    end)
    self.menu:addItem("Difficulty", function()
        -- Add your logic to change difficulty here
        print("Difficulty changed")
    end)
    self.menu:addItem("Back", function()
        -- Add your logic to go back to the previous scene
        Noble.transition(TitleScreen)
    end)
end

function scene:enter()
    scene.super.enter(self)
    self.sequence = Sequence.new():from(self.menuYFrom):to(self.menuY, 1.5, Ease.outBounce):start()
    self.menu:activate()
end

function scene:exit()
    scene.super.exit(self)
    self.menu:deactivate()
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
    self.background:draw(0, 0)
end
