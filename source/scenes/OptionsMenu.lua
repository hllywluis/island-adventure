OptionsMenu = {}
class("OptionsMenu").extends(NobleScene)

local scene = OptionsMenu

function scene:init()
    OptionsMenu.super.init(self)
    self:setValues()
    self.inputHandler = Utilities.createMenuInputHandler(self.menu, function()
        Noble.transition(TitleScreen)
    end)
end

function scene:setValues()
    Utilities.setupMenuScene(self, "assets/images/background2")
    
    self.menu:addItem("Sound", function()
        -- Add your logic to toggle sound here
        print("Sound toggled")
    end)
    self.menu:addItem("Difficulty", function()
        -- Add your logic to change difficulty here
        print("Difficulty changed")
    end)
    self.menu:addItem("Back", function()
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
    Utilities.updateMenuScene(self)
end

function scene:drawBackground()
    self.background:draw(0, 0)
end
