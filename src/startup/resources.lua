sprites = {}
sprites.playerSheet = love.graphics.newImage('sprites/player/playerSheet1.png')
sprites.playerShadow = love.graphics.newImage('sprites/player/playerShadow.png')
sprites.sword = love.graphics.newImage('sprites/sword.png')
sprites.sword2 = love.graphics.newImage('sprites/sword2.png')
sprites.effects = {}
sprites.effects.slice = love.graphics.newImage('sprites/effects/slice.png')
sprites.effects.sliceAnim = love.graphics.newImage('sprites/effects/sliceAnim.png')
sprites.effects.explosion = love.graphics.newImage('sprites/effects/explosion.png')
sprites.effects.rock = love.graphics.newImage('sprites/effects/rock.png')
sprites.effects.fuseSmoke = love.graphics.newImage('sprites/effects/fuseSmoke.png')
sprites.effects.scorch = love.graphics.newImage('sprites/effects/scorch3.png')
sprites.effects.triangleScorch = love.graphics.newImage('sprites/effects/scorch/triangle.png')
sprites.effects.darkMagicB = love.graphics.newImage('sprites/effects/darkMagicB.png')
sprites.effects.darkMagicW = love.graphics.newImage('sprites/effects/darkMagicW.png')
sprites.effects.death = love.graphics.newImage('sprites/effects/death.png')
sprites.effects.arrowShadow = love.graphics.newImage('sprites/effects/shadows/arrow.png')
sprites.effects.boomerangShadow = love.graphics.newImage('sprites/effects/shadows/boomerang.png')
sprites.effects.treeShadow = love.graphics.newImage('sprites/effects/shadows/tree.png')
sprites.effects.fireball = love.graphics.newImage('sprites/effects/fireball.png')
sprites.effects.blobs = {}
sprites.effects.blobs.blob1 = love.graphics.newImage('sprites/effects/blobs/blob1.png')
sprites.effects.blobs.blob2 = love.graphics.newImage('sprites/effects/blobs/blob2.png')
sprites.effects.blobs.blob3 = love.graphics.newImage('sprites/effects/blobs/blob3.png')
sprites.effects.blobs.blob4 = love.graphics.newImage('sprites/effects/blobs/blob4.png')
sprites.environment = {}
sprites.environment.breakableRock = love.graphics.newImage('sprites/environment/breakableRock.png')
sprites.environment.breakableWall = love.graphics.newImage('sprites/environment/breakableWall.png')
sprites.environment.lockedDoor = love.graphics.newImage('sprites/environment/lockedDoor.png')
sprites.environment.tree = love.graphics.newImage('sprites/environment/tree.png')
sprites.environment.tree2 = love.graphics.newImage('sprites/environment/tree2.png')
sprites.environment.wave = love.graphics.newImage('sprites/environment/wave.png')
sprites.enemies = {}
sprites.enemies.alert = love.graphics.newImage('sprites/enemies/alert.png')
sprites.enemies.shadow = love.graphics.newImage('sprites/enemies/shadow.png')
sprites.enemies.shadowMed = love.graphics.newImage('sprites/enemies/shadowMed.png')
sprites.enemies.eye1 = love.graphics.newImage('sprites/enemies/eye/eye1.png')
sprites.enemies.eye2 = love.graphics.newImage('sprites/enemies/eye/eye2.png')
sprites.enemies.eye3 = love.graphics.newImage('sprites/enemies/eye/eye3.png')
sprites.enemies.eyeShadow = love.graphics.newImage('sprites/enemies/eye/eyeShadow.png')
sprites.enemies.eyeDead1 = love.graphics.newImage('sprites/enemies/eye/eyeDead1.png')
sprites.enemies.eyeDead2 = love.graphics.newImage('sprites/enemies/eye/eyeDead2.png')
sprites.enemies.eyeDead3 = love.graphics.newImage('sprites/enemies/eye/eyeDead3.png')
sprites.enemies.eyeBody = love.graphics.newImage('sprites/enemies/eye2/eyeBody.png')
sprites.enemies.iris1 = love.graphics.newImage('sprites/enemies/eye2/iris1.png')
sprites.enemies.bat = love.graphics.newImage('sprites/enemies/bat.png')
sprites.enemies.batDead = love.graphics.newImage('sprites/enemies/batDead.png')
sprites.enemies.skeletonKnife = love.graphics.newImage('sprites/enemies/skeleton/knife2.png')
sprites.enemies.skeletonMage = love.graphics.newImage('sprites/enemies/skeleton/mage.png')
sprites.enemies.skeletonDead = love.graphics.newImage('sprites/enemies/skeleton/skeletonStun.png')
sprites.items = {}
sprites.items.arrow = love.graphics.newImage('sprites/items/arrow.png')
sprites.items.bow1 = love.graphics.newImage('sprites/items/bow1.png')
sprites.items.bow2 = love.graphics.newImage('sprites/items/bow2.png')
sprites.items.bowIcon = love.graphics.newImage('sprites/items/bowIcon.png')
sprites.items.bomb = love.graphics.newImage('sprites/items/bomb.png')
sprites.items.bombSheet = love.graphics.newImage('sprites/items/bombSheet.png')
sprites.items.boomerang = love.graphics.newImage('sprites/items/boomerang.png')
sprites.items.fire = love.graphics.newImage('sprites/items/fire-icon.png')
sprites.items.hookshot = love.graphics.newImage('sprites/items/hookshot.png')
sprites.items.hookshotArmed = love.graphics.newImage('sprites/items/hookshot-armed.png')
sprites.items.hookshotChain = love.graphics.newImage('sprites/items/hookshot-chain.png')
sprites.items.hookshotHandle = love.graphics.newImage('sprites/items/hookshot-handle.png')
sprites.items.hookshotHead = love.graphics.newImage('sprites/items/hookshot-head.png')
sprites.items.key = love.graphics.newImage('sprites/items/key.png')
sprites.items.coin = love.graphics.newImage('sprites/items/coin.png')
sprites.items.coin1 = love.graphics.newImage('sprites/items/coin1Sheet.png')
sprites.items.coin2 = love.graphics.newImage('sprites/items/coin2Sheet.png')
sprites.items.coin3 = love.graphics.newImage('sprites/items/coin3Sheet.png')
sprites.items.heart = love.graphics.newImage('sprites/items/heart.png')
sprites.items.container = love.graphics.newImage('sprites/items/container.png')
sprites.items.quiver = love.graphics.newImage('sprites/items/quiver.png')
sprites.items.lantern = love.graphics.newImage('sprites/items/lantern.png')
sprites.items.lootShadow = love.graphics.newImage('sprites/items/lootShadow.png')
sprites.items.lootShadow2 = love.graphics.newImage('sprites/items/lootShadow2.png')
sprites.items.chestClosed = love.graphics.newImage('sprites/environment/chestClosed.png')
sprites.items.chestOpen = love.graphics.newImage('sprites/environment/chestOpen.png')
sprites.items.chestBigClosed = love.graphics.newImage('sprites/environment/chestBigClosed.png')
sprites.items.chestBigOpen = love.graphics.newImage('sprites/environment/chestBigOpen.png')
sprites.hud = {}
sprites.hud.heart = love.graphics.newImage('sprites/ui/heart.png')
sprites.hud.halfHeart = love.graphics.newImage('sprites/ui/heart-half.png')
sprites.hud.emptyHeart = love.graphics.newImage('sprites/ui/heart-empty.png')
sprites.hud.itemBox = love.graphics.newImage('sprites/ui/itemBox.png')
sprites.hud.ammoBox = love.graphics.newImage('sprites/ui/ammoBox.png')
sprites.hud.coin = love.graphics.newImage('sprites/items/coinIcon.png')
sprites.pause = {}
sprites.pause.equipBox = love.graphics.newImage('sprites/ui/pause/equipBox.png')
sprites.pause.wideBox = love.graphics.newImage('sprites/ui/pause/wideBox.png')
sprites.pause.itemPanel = love.graphics.newImage('sprites/ui/pause/itemPanel.png')
sprites.pause.itemPanelL = love.graphics.newImage('sprites/ui/pause/itemPanelL.png')
sprites.pause.itemPanelR = love.graphics.newImage('sprites/ui/pause/itemPanelR.png')
sprites.pause.itemPanelFade = love.graphics.newImage('sprites/ui/pause/itemPanelFade.png')
sprites.pause.mouse = love.graphics.newImage('sprites/ui/pause/mouse.png')
sprites.pause.cursor = love.graphics.newImage('sprites/ui/pause/cursor.png')
sprites.npc = {}
sprites.npc.merchant = love.graphics.newImage('sprites/npc/merchant.png')

fonts = {}
fonts.debug = love.graphics.newFont("fonts/vt323/VT323-Regular.ttf", 15*scale)
fonts.debug2 = love.graphics.newFont(10*scale)
fonts.debugSmall = love.graphics.newFont("fonts/vt323/VT323-Regular.ttf", 10*scale)
fonts.ammo = love.graphics.newFont("fonts/kenney-pixel-square/Kenney-Pixel-Square.ttf", 4.5*scale)
fonts.coins = love.graphics.newFont("fonts/kenney-pixel-square/Kenney-Pixel-Square.ttf", 6.5*scale)
fonts.shop = love.graphics.newFont("fonts/kenney-pixel-square/Kenney-Pixel-Square.ttf", 8)

fonts.pause1 = love.graphics.newFont("fonts/kenney_fontpackage/Fonts/Kenney Pixel.ttf", 12*scale)
fonts.pause2 = love.graphics.newFont("fonts/kenney_fontpackage/Fonts/Kenney Pixel.ttf", 9*scale)
fonts.pauseTop = love.graphics.newFont("fonts/kenney_fontpackage/Fonts/Kenney Pixel.ttf", 10*scale)

sounds = {}
sounds.enemies = {}
sounds.enemies.die = 'sounds/enemies/enemyDie.wav'
sounds.enemies.hurt = 'sounds/enemies/enemyHurt.wav'
sounds.enemies.projectile = 'sounds/enemies/projectile.wav'
sounds.items = {}
sounds.items.arrow = 'sounds/items/arrow.wav'
sounds.items.boomerang = 'sounds/items/boomerang.wav'
sounds.items.chest = 'sounds/items/chest.wav'
sounds.items.coin = 'sounds/items/coin-edit.wav'
sounds.items.explosion = 'sounds/items/explosion.wav'
sounds.items.fire = 'sounds/items/fire.wav'
sounds.items.grapple = 'sounds/items/grapple.wav'
sounds.items.set = 'sounds/items/set.wav'
sounds.items.sword = 'sounds/items/sword.wav'
sounds.player = {}
sounds.player.hurt = 'sounds/player/playerHurt.wav'
sounds.player.roll = 'sounds/player/roll.wav'
sounds.ui = {}
sounds.ui.click = 'sounds/ui/click.wav'
