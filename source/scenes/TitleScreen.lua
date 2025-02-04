TitleScreen = {}
class("TitleScreen").extends(NobleScene)

local scene = TitleScreen

function scene:setValues()
    Utilities.setupMenuScene(self, "assets/images/background1")
end

function scene:init()
    scene.super.init(self)
    self:setValues()
    self:setupMenu(self.menu)
    self.music = playdate.sound.fileplayer.new("assets/sounds/neon")
    self.inputHandler = Utilities.createMenuInputHandler(self.menu)
end

function scene:enter()
    scene.super.enter(self)
    self.sequence = Sequence.new():from(self.menuYFrom):to(self.menuY, 1.5, Ease.outBounce):start()
    if not IS_MUSIC_PLAYING then
        self.music:play(0)
        IS_MUSIC_PLAYING = true
    end
end

function scene:update()
    scene.super.update(self)
    Utilities.updateMenuScene(self)
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
    __menu:addItem("Options", function()
        Noble.transition(OptionsMenu)
    end)
end
