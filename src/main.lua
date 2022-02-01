player = { x = 350, y = 500,
speed = 150, img = nil }

function love.load(arg)
    player.img = love.graphics.newImage('assets/ship.png')
end

function love.update(dt)
    -- Left and right movement
    if love.keyboard.isDown('left') then
        player.x = player.x - (player.speed *dt)
    elseif love.keyboard.isDown('right') then
        player.x = player.x + (player.speed *dt)
    end
    -- Up and down
    if love.keyboard.isDown('up') then
        player.y = player.y - (player.speed *dt)
    elseif love.keyboard.isDown('down') then
        player.y = player.y + (player.speed *dt)
    end
end

function love.draw(dt)
    love.graphics.draw(player.img, player.x, player. y)
end
