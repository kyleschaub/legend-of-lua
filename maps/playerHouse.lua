return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.5.0",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 60,
  height = 30,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 9,
  nextobjectid = 56,
  properties = {},
  tilesets = {
    {
      name = "overworld",
      firstgid = 1,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 40,
      image = "_tilesets/overworld.png",
      imagewidth = 640,
      imageheight = 592,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 1480,
      tiles = {}
    },
    {
      name = "inner",
      firstgid = 1481,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 40,
      image = "_tilesets/inner.png",
      imagewidth = 640,
      imageheight = 400,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 1000,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 60,
      height = 30,
      id = 1,
      name = "Base",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1601, 1601, 1601, 1601, 1601, 1601, 1601, 1601, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1681, 1681, 1681, 1681, 1681, 1681, 1681, 1681, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1521, 1521, 1521, 1521, 1521, 1521, 1521, 1521, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1521, 1521, 1521, 1521, 1521, 1521, 1521, 1521, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1521, 1521, 1521, 1521, 1521, 1521, 1521, 1521, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1521, 1521, 1521, 1521, 1521, 1521, 1521, 1521, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1521, 1521, 1521, 1521, 1521, 1521, 1521, 1521, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1521, 1521, 1521, 1561, 1561, 1521, 1521, 1521, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523,
        1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523, 1523
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "Walls",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "Loot",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "Enemies",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
      name = "NPC",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 8,
      name = "Transitions",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 55,
          name = "toTest7",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 248,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["destX"] = 744,
            ["destY"] = 296
          }
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 60,
      height = 30,
      id = 2,
      name = "Objects",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1660, 1661, 0, 1847, 1849, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1544, 1545, 0, 1700, 1701, 0, 1887, 1889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1584, 1585, 0, 0, 0, 0, 1927, 1929, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1624, 1625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1761, 1762, 1762, 1763, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1841, 1842, 1842, 1843, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 60,
      height = 30,
      id = 4,
      name = "Test",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}