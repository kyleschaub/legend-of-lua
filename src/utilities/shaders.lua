shaders = {}

shaders.simpleLight = love.graphics.newShader[[
    extern number playerX = 0;
    extern number playerY = 0;

    number radius = 250;
    vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ) {
        number distance = pow(pow(screen_coords.x - playerX, 2) + pow(screen_coords.y - playerY, 2), 0.5);
        if (distance < radius) {
            return vec4(0, 0, 0, 0);
        }
        else {
            return vec4(0, 0, 0, 1);
        } 
    }
]]

shaders.trueLight = love.graphics.newShader[[
    extern number playerX = 0;
    extern number playerY = 0;

    number radius = 300;
    vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ) {
        number distance = pow(pow(screen_coords.x - playerX, 2) + pow(screen_coords.y - playerY, 2), 0.5);
        number alpha = distance / radius;
        return vec4(0, 0, 0, alpha);
    }
]]

function shaders:update(dt)
    if gameMap.dark then
        local px, py = player:getPosition()
        shaders.simpleLight:send("playerX", px)
        shaders.simpleLight:send("playerY", py)
        shaders.trueLight:send("playerX", px)
        shaders.trueLight:send("playerY", py)
    end
end
