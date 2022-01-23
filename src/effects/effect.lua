effects = {}

function effects:spawn(type, x, y, args)

    local effect = {}
    effect.x = x
    effect.y = y
    effect.rot = 0
    effect.dead = false
    effect.scaleX = 1
    effect.scaleY = 1

    if type == "slice" then
        effect.spriteSheet = sprites.effects.slice
        effect.width = 23
        effect.height = 39
        effect.grid = anim8.newGrid(23, 39, effect.spriteSheet:getWidth(), effect.spriteSheet:getHeight())
        effect.anim = anim8.newAnimation(effect.grid(1, 1), 0.12, function() effect.dead = true end)

        if player.dir == "down" then
            effect.x = effect.x + 1
            effect.y = effect.y + 13.5
            effect.rot = math.pi/2
        elseif player.dir == "up" then
            effect.x = effect.x - 1
            effect.y = effect.y - 9.5
            effect.rot = math.pi/-2
        elseif player.dir == "right" then
            effect.x = effect.x + 13.5
            effect.y = effect.y - 2
        elseif player.dir == "left" then
            effect.x = effect.x - 13.5
            effect.y = effect.y - 2
            effect.scaleX = -1
        end
    end

    if type == "explosion" then
        effect.spriteSheet = sprites.effects.explosion
        effect.width = 32
        effect.height = 32
        effect.scaleX = 1.25
        effect.scaleY = 1.25
        effect.grid = anim8.newGrid(32, 32, effect.spriteSheet:getWidth(), effect.spriteSheet:getHeight())
        effect.anim = anim8.newAnimation(effect.grid('1-6', 1), 0.08, function() effect.dead = true end)
    end

    if type == "fuseSmoke" then
        effect.rad = 1
        effect.alpha = 0.2
        effect.timer = 0.75
        effect.sprite = sprites.effects.fuseSmoke
        effect.scaleX = 0.25
        
        -- Define the path that the smoke rises
        local vec = vector(0, -1)
        local pos = math.random()
        if pos > 0.5 then pos = 1 else pos = -1 end
        local mag = math.random()/4

        effect.vec = vec:rotateInplace(mag * pos)

        function effect:update(dt)
            local speed = 15
            self.x = self.x + (speed * self.vec.x * dt)
            self.y = self.y + (speed * self.vec.y * dt)
            self.scaleX = self.scaleX + (dt)
            self.alpha = self.timer / 0.75 * 0.2
        end

        function effect:draw()
            love.graphics.setColor(1, 1, 1, self.alpha)
            love.graphics.draw(self.sprite, self.x, self.y, nil, self.scaleX, nil, self.sprite:getWidth()/2, self.sprite:getHeight()/2)
            love.graphics.setColor(1,1,1,1)
        end
    end

    table.insert(effects, effect)

end

function effects:update(dt)
    for _,e in ipairs(effects) do
        if e.anim then
            e.anim:update(dt)
        end
        if e.timer then
            e.timer = e.timer - dt
            if e.timer < 0 then
                e.dead = true
            end
        end
        if e.update then
            e:update(dt)
        end
    end

    local i = #effects
    while i > 0 do
        if effects[i].dead then
            table.remove(effects, i)
        end
        i = i - 1
    end
end

function effects:draw()
    for _,e in ipairs(effects) do
        if e.anim then
            e.anim:draw(e.spriteSheet, e.x, e.y, e.rot, e.scaleX, e.scaleY, e.width/2, e.height/2)
        end
        if e.draw then
            e:draw()
        end
    end
end
