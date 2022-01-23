particles = {}

function spawnParticle(type, x, y, args)

    local particle = {}
    particle.type = type
    particle.args = args
    particle.tag = "" -- used for finding related particles
    
    -- Function that sets the properties of the new particle
    local init = require("src/effects/particles/" .. type)
    particle = init(particle, x, y, args)

    -- This update function is the same for all particles, regardless of type
    function particle:genericUpdate(dt)
        if self.timer > 0 then
            self.timer = self.timer - dt
        else
            self.dead = true
            self.timer = 0
        end
    end

    table.insert(particles, particle)

end

function particles:update(dt)

    -- Calls update functions on all particles
    for i,p in ipairs(self) do
        p:update(dt)
        p:genericUpdate(dt)
    end
  
    -- Iterate through all particles in reverse to remove the dead ones
    for i=#particles,1,-1 do
        if particles[i].dead then
            if particles[i].tween then
                particles[i].tween:stop()
            end
            if particles[i].physics then
                particles[i].physics:destroy()
            end
            table.remove(particles, i)
        end
    end
  
end

function particles:draw()

    -- Calls draw functions on all particles
    for i,p in ipairs(self) do
        p:draw()
    end
  
end
