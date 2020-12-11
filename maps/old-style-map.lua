return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 28,
  height = 18,
  tilewidth = 96,
  tileheight = 96,
  nextlayerid = 3,
  nextobjectid = 10,
  properties = {},
  tilesets = {
    {
      name = "oldStyle",
      firstgid = 1,
      tilewidth = 96,
      tileheight = 96,
      spacing = 6,
      margin = 0,
      columns = 9,
      image = "tilesets/moutain-big.png",
      imagewidth = 912,
      imageheight = 504,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 96,
        height = 96
      },
      properties = {},
      terrains = {},
      tilecount = 45,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 28,
      height = 18,
      id = 1,
      name = "Background",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 13, 1, 1,
        1, 1, 1, 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 13, 1, 1, 1,
        1, 1, 1, 1, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 13, 1, 1, 1, 1,
        1, 1, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 1, 1, 1,
        1, 1, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 43, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 43, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 6, 6, 6, 6, 6, 6, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 43, 15, 15, 15, 15, 15, 16, 1, 43, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 43, 1, 1,
        1, 1, 1, 15, 15, 15, 15, 15, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 15, 15, 15, 15, 15, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        6, 6, 6, 15, 15, 15, 15, 15, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 43, 1, 1,
        15, 15, 15, 15, 15, 15, 15, 15, 16, 1, 1, 1, 1, 1, 2, 3, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        15, 15, 15, 15, 15, 16, 1, 1, 1, 1, 1, 2, 3, 3, 12, 12, 12, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        15, 15, 15, 15, 15, 16, 1, 1, 1, 1, 2, 12, 12, 12, 12, 12, 12, 12, 4, 1, 1, 1, 43, 1, 1, 43, 1, 1,
        15, 15, 15, 15, 15, 16, 1, 1, 1, 1, 12, 12, 12, 12, 12, 12, 12, 12, 12, 4, 1, 1, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "Water",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1632,
          y = 576,
          width = 384,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["biome"] = "field",
            ["segmentType"] = "u"
          }
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1536,
          y = 576,
          width = 96,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["biome"] = "field",
            ["segmentType"] = "ul"
          }
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2016,
          y = 576,
          width = 96,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["biome"] = "field",
            ["segmentType"] = "ur"
          }
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2016,
          y = 672,
          width = 96,
          height = 288,
          rotation = 0,
          visible = true,
          properties = {
            ["biome"] = "field",
            ["segmentType"] = "r"
          }
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2016,
          y = 960,
          width = 96,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["biome"] = "field",
            ["segmentType"] = "dr"
          }
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1632,
          y = 960,
          width = 384,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["biome"] = "field",
            ["segmentType"] = "d"
          }
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1536,
          y = 672,
          width = 96,
          height = 288,
          rotation = 0,
          visible = true,
          properties = {
            ["biome"] = "field",
            ["segmentType"] = "l"
          }
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1536,
          y = 960,
          width = 96,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["biome"] = "field",
            ["segmentType"] = "dl"
          }
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1632,
          y = 672,
          width = 384,
          height = 288,
          rotation = 0,
          visible = true,
          properties = {
            ["biome"] = "field",
            ["segmentType"] = "c"
          }
        }
      }
    }
  }
}
