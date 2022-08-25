blasts = {}

function spawnBlast(x, y, size, color, time)
	blast = {}
	blast.x = x
	blast.y = y
	blast.color = color
	blast.radius = 1
	blast.max_radius = size
	blast.time = time
	blast.timer = 0.25
	blast.timer2 = time + 1
	blast.dead = false
	blast.alpha = 255
	blast.state = 0

	function blast:update(dt, i)
		self.timer2 = self.timer2 - dt
		if self.timer2 < 0 then
			self.dead = true
		end

		if self.state == 0 then
			local max = self.max_radius
			flux.to(self, self.time, { radius = max })
			flux.to(self, self.time, { alpha = 0 }):ease("quadin")
			self.state = 1
		end
	end
	table.insert(blasts, blast)
end

function blasts:update(dt)
	for i,w in ipairs(blasts) do
		w:update(dt, i)
	end

	local i = table.getn(blasts)
	while i > 0 do
		if blasts[i].dead == true then
			table.remove(blasts, i)
		end
		i = i - 1
	end
end

function blasts:draw()
	for _,b in ipairs(blasts) do
		love.graphics.setColor(1, 1, 1, b.alpha/255)
		love.graphics.circle("fill", b.x, b.y, b.radius)
	end
end
