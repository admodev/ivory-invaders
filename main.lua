player = { x = 350, y = 500,
speed = 150, img = nil }

function love.load(arg)
    player.img = love.graphics.newImage('assets/ship.png')
end

function love.update(dt)

end

function love.draw(dt)
    love.graphics.draw(player.img, player.x, player. y)
end
