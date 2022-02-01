player = { x = 350, y = 500,
speed = 150, img = nil }

canShoot = true
delay = 0.2
shootDelay = delay

projectileImg = nil
projectile = {}

function love.load(arg)
    player.img = love.graphics.newImage('assets/ship.png')
    projectileImg = love.graphics.newImage('assets/projectile.png')
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

    -- Shoot delay timer
    shootDelay = shootDelay - (1*dt)
    if shootDelay < 0 then
        canShoot = true
    end

    if love.keyboard.isDown('space') and canShoot then
        newProjectile = { x = player.x + (player.img:getWidth()/2), y = player.y, img = projectileImg  }
        table.insert(projectile, newProjectile)
        canShoot = false
        shootDelay = delay
    end

    for i, bullet in ipairs(projectile) do
        bullet.y = bullet.y - (250 *dt)

        if bullet.y < 0 then
            table.remove(projectile, i)
        end
    end
end

function love.draw(dt)
    love.graphics.draw(player.img, player.x, player. y)

    for i, bullet in ipairs(projectile) do
        love.graphics.draw(bullet.img, bullet.x, bullet.y)
    end
end
