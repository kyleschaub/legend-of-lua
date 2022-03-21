sprites = {}
sprites.playerSheet = love.graphics.newImage('sprites/playerSheet.png')
sprites.sword = love.graphics.newImage('sprites/sword.png')
sprites.effects = {}
sprites.effects.slice = love.graphics.newImage('sprites/effects/slice.png')
sprites.effects.explosion = love.graphics.newImage('sprites/effects/explosion.png')
sprites.effects.rock = love.graphics.newImage('sprites/effects/rock.png')
sprites.effects.fuseSmoke = love.graphics.newImage('sprites/effects/fuseSmoke.png')
sprites.effects.scorch = love.graphics.newImage('sprites/effects/scorch3.png')
sprites.environment = {}
sprites.environment.breakableRock = love.graphics.newImage('sprites/environment/breakableRock.png')
sprites.enemies = {}
sprites.enemies.eye1 = love.graphics.newImage('sprites/enemies/eye/eye1.png')
sprites.enemies.eye2 = love.graphics.newImage('sprites/enemies/eye/eye2.png')
sprites.enemies.eye3 = love.graphics.newImage('sprites/enemies/eye/eye3.png')
sprites.enemies.eyeShadow = love.graphics.newImage('sprites/enemies/eye/eyeShadow.png')
sprites.enemies.eyeDead1 = love.graphics.newImage('sprites/enemies/eye/eyeDead1.png')
sprites.enemies.eyeDead2 = love.graphics.newImage('sprites/enemies/eye/eyeDead2.png')
sprites.enemies.eyeDead3 = love.graphics.newImage('sprites/enemies/eye/eyeDead3.png')
sprites.items = {}
sprites.items.arrow = love.graphics.newImage('sprites/items/arrow.png')
sprites.items.bow1 = love.graphics.newImage('sprites/items/bow1.png')
sprites.items.bow2 = love.graphics.newImage('sprites/items/bow2.png')
sprites.items.bowIcon = love.graphics.newImage('sprites/items/bowIcon.png')
sprites.items.bomb = love.graphics.newImage('sprites/items/bomb.png')
sprites.items.bombSheet = love.graphics.newImage('sprites/items/bombSheet.png')
sprites.items.boomerang = love.graphics.newImage('sprites/items/boomerang.png')
sprites.items.heart = love.graphics.newImage('sprites/items/heart.png')
sprites.items.lootShadow = love.graphics.newImage('sprites/items/lootShadow.png')
sprites.hud = {}
sprites.hud.heart = love.graphics.newImage('sprites/ui/heart.png')
sprites.hud.halfHeart = love.graphics.newImage('sprites/ui/heart-half.png')
sprites.hud.emptyHeart = love.graphics.newImage('sprites/ui/heart-empty.png')
sprites.hud.itemBox = love.graphics.newImage('sprites/ui/itemBox.png')
sprites.hud.ammoBox = love.graphics.newImage('sprites/ui/ammoBox.png')

fonts = {}
fonts.debug = love.graphics.newFont("fonts/vt323/VT323-Regular.ttf", 15*scale)
fonts.ammo = love.graphics.newFont("fonts/kenney-pixel-square/Kenney-Pixel-Square.ttf", 4.5*scale)

sounds = {}