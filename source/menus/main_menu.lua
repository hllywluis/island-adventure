class("MainMenu").extends(playdate.graphics.sprite)

function MainMenu:init(x, y, width, height)
    self:setBounds(x, y, width, height)
    self:moveTo(x, y)
    self:setImage(menu)
    self:add()
end

function MainMenu:draw()
    playdate.graphics.fillRect(0, 0, self.width, self.height)
    playdate.graphics.setImageDrawMode(playdate.graphics.kDrawModeFillWhite)
    font = playdate.graphics.font.new("fonts/Flak Attack")
    font:drawTextAligned("ISLAND ADVENTURE", self.width / 2, 20, kTextAlignment.center)
    font:drawTextAligned("THE BEST ADVENTURE", self.width / 2, 60, kTextAlignment.center)
end
