trees = {}

function spawnTree(x, y, type, id)
    local tree = {}
    tree.x = x
    tree.y = y
    tree.type = type
    tree.id = id
    tree.width = 12
    tree.height = 10
    tree.sprite = sprites.environment.tree
    tree.layer = 1

    if type then
        tree.sprite = sprites.environment['tree' .. type]
    end

    tree.x = tree.x + (16-tree.width)/2
    tree.y = tree.y + 2

    -- Wall spawned overtop of the tree, passed tree as parent
    spawnWall(tree.x, tree.y, tree.width, tree.height, nil, nil, tree)

    function tree:interact()

    end
    
    table.insert(trees, tree)
end

function trees:update(dt)
    for _,t in ipairs(trees) do
        if t.y + 2 < player:getY() then
            --t.layer = -1
            t.layer = 1
        else
            t.layer = 1
        end
    end
end

function trees:draw(layer)
    for _,t in ipairs(trees) do
        if t.layer == layer then
            love.graphics.draw(t.sprite, t.x + t.width/2, t.y, nil, nil, nil, t.sprite:getWidth()/2, t.sprite:getHeight()*0.75)
        end
    end
end
