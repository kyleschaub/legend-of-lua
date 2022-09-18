return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.5.0",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 30,
  height = 22,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 11,
  nextobjectid = 110,
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
      tiles = {
        {
          id = 40,
          animation = {
            {
              tileid = 40,
              duration = 100
            },
            {
              tileid = 41,
              duration = 100
            },
            {
              tileid = 42,
              duration = 100
            },
            {
              tileid = 43,
              duration = 100
            },
            {
              tileid = 80,
              duration = 100
            },
            {
              tileid = 81,
              duration = 100
            },
            {
              tileid = 82,
              duration = 100
            },
            {
              tileid = 83,
              duration = 100
            }
          }
        },
        {
          id = 1440,
          animation = {
            {
              tileid = 1440,
              duration = 400
            },
            {
              tileid = 1441,
              duration = 400
            },
            {
              tileid = 1442,
              duration = 400
            },
            {
              tileid = 1443,
              duration = 400
            }
          }
        },
        {
          id = 1441,
          animation = {
            {
              tileid = 1441,
              duration = 400
            },
            {
              tileid = 1442,
              duration = 400
            },
            {
              tileid = 1443,
              duration = 400
            },
            {
              tileid = 1440,
              duration = 400
            }
          }
        },
        {
          id = 1442,
          animation = {
            {
              tileid = 1442,
              duration = 400
            },
            {
              tileid = 1443,
              duration = 400
            },
            {
              tileid = 1440,
              duration = 400
            },
            {
              tileid = 1441,
              duration = 400
            }
          }
        },
        {
          id = 1443,
          animation = {
            {
              tileid = 1443,
              duration = 400
            },
            {
              tileid = 1440,
              duration = 400
            },
            {
              tileid = 1441,
              duration = 400
            },
            {
              tileid = 1442,
              duration = 400
            }
          }
        }
      }
    },
    {
      name = "overworld-edit",
      firstgid = 1481,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 40,
      image = "_tilesets/Overworld-edit.png",
      imagewidth = 640,
      imageheight = 576,
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
      tilecount = 1440,
      tiles = {}
    },
    {
      name = "overworld-edit2",
      firstgid = 2921,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 40,
      image = "_tilesets/Overworld-edit2.png",
      imagewidth = 640,
      imageheight = 576,
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
      tilecount = 1440,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 22,
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
        4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4216, 4136, 3289, 4136, 4136, 4136, 4136, 3203, 3204, 3204, 3204, 3205, 4136, 4136, 3081, 3082, 3082, 3082,
        4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4137, 4136, 4136, 4136, 4176, 4176, 3321, 3203, 3204, 3204, 3204, 3205, 4136, 4136, 3081, 3082, 3082, 3082,
        4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 3163, 3164, 3164, 3164, 3324, 3204, 3204, 3204, 3205, 4136, 4136, 3081, 3082, 3082, 3082,
        4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 3203, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3205, 4136, 4136, 3081, 3082, 3082, 3082,
        4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 3328, 4136, 3203, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3205, 4136, 4136, 3081, 3082, 3082, 3082,
        4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 3368, 4136, 4136, 4136, 4136, 4136, 3203, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3205, 4136, 4136, 3081, 3082, 3082, 3082,
        4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 3203, 3204, 3204, 3204, 3283, 3244, 3244, 3244, 3245, 4136, 4136, 3081, 3082, 3082, 3082,
        4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 3321, 3322, 4136, 3203, 3204, 3204, 3204, 3205, 4136, 4136, 4136, 4136, 4136, 4136, 3081, 3082, 3082, 3082,
        4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 3328, 4136, 4136, 4136, 4136, 4136, 4136, 3203, 3204, 3204, 3204, 3205, 4136, 4136, 4136, 4051, 3321, 3329, 3081, 3082, 3082, 3082,
        4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 3203, 3204, 3204, 3204, 3205, 4136, 4136, 4136, 4259, 3281, 3289, 3081, 3082, 3082, 3082,
        4136, 4136, 4136, 3289, 4175, 3286, 4175, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 3203, 3204, 3204, 3204, 3205, 4136, 4096, 4097, 4136, 4011, 3282, 3121, 3122, 3122, 3122,
        4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 3326, 3289, 4136, 4136, 4136, 4136, 3203, 3204, 3204, 3204, 3205, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136,
        4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 3203, 3204, 3204, 3204, 3205, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136,
        4136, 4136, 4136, 4136, 3286, 3328, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 3203, 3204, 3204, 3204, 3205, 4136, 4217, 4136, 4136, 4136, 4136, 3041, 3042, 3042, 3042,
        3164, 3164, 3164, 3164, 3164, 3164, 3164, 3164, 3164, 3164, 3164, 3164, 3164, 3164, 3164, 3324, 3204, 3204, 3204, 3205, 4136, 4136, 4136, 4136, 4136, 3286, 3081, 3082, 3082, 3082,
        3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3205, 4136, 4136, 4136, 4136, 4136, 4136, 3081, 3082, 3082, 3082,
        3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3205, 4136, 3289, 3328, 3329, 4136, 4136, 3081, 3082, 3082, 3082,
        3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3204, 3205, 4136, 4136, 4136, 4136, 4136, 4136, 3081, 3082, 3082, 3082,
        3244, 3244, 3244, 3244, 3244, 3244, 3244, 3244, 3244, 3244, 3244, 3244, 3244, 3244, 3244, 3244, 3244, 3244, 3244, 3245, 4136, 4136, 4136, 4136, 3328, 4136, 3081, 3082, 3082, 3082,
        4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 3081, 3082, 3082, 3082,
        4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 3081, 3082, 3082, 3082,
        4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 4136, 3081, 3082, 3082, 3082
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 22,
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
        0, 0, 0, 0, 0, 0, 0, 3325, 0, 0, 0, 3327, 3488, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 3325, 0, 0, 3131, 3327, 3488, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 3325, 3128, 0, 0, 3327, 3488, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 3329, 3328, 0, 0, 3365, 3366, 3366, 3366, 3367, 3488, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 3445, 3406, 3406, 3406, 3447, 3488, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 3289, 0, 3445, 3446, 3446, 3446, 3447, 3488, 0, 3127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 3282, 3322, 0, 0, 4136, 3485, 3486, 3369, 3486, 3487, 3488, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3169, 3170, 3170, 3170, 3171, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3209, 3210, 3210, 3210, 3211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3249, 3250, 3250, 3250, 3251, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 22,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
      id = 9,
      name = "Trees",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 101,
          name = "",
          type = "2",
          shape = "rectangle",
          x = 343.75,
          y = 109,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 102,
          name = "",
          type = "2",
          shape = "rectangle",
          x = 212,
          y = 164,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 103,
          name = "",
          type = "2",
          shape = "rectangle",
          x = 116,
          y = 196,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 104,
          name = "",
          type = "2",
          shape = "rectangle",
          x = 72,
          y = 124,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 8,
      name = "Chests",
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
      objects = {
        {
          id = 105,
          name = "eye",
          type = "",
          shape = "point",
          x = 336,
          y = 232,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["form"] = 1
          }
        },
        {
          id = 106,
          name = "eye",
          type = "",
          shape = "point",
          x = 376,
          y = 216,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["form"] = 1
          }
        },
        {
          id = 107,
          name = "eye",
          type = "",
          shape = "point",
          x = 408,
          y = 256,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["form"] = 1
          }
        },
        {
          id = 108,
          name = "eye",
          type = "",
          shape = "point",
          x = 352,
          y = 276,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["form"] = 1
          }
        },
        {
          id = 109,
          name = "eye",
          type = "",
          shape = "point",
          x = 452,
          y = 296,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["form"] = 1
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 10,
      name = "Water",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 89,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 0,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 90,
          name = "",
          type = "",
          shape = "rectangle",
          x = 304,
          y = 48,
          width = 64,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 91,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 48,
          width = 48,
          height = 76,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 92,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 144,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 93,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 192,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 94,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 240,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 95,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 240,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 96,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 240,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 97,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 240,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 98,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 240,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 99,
          name = "",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 240,
          width = 64,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
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
          id = 87,
          name = "toTest",
          type = "right",
          shape = "rectangle",
          x = 480,
          y = 160,
          width = 16,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["destX"] = 16,
            ["destY"] = 192
          }
        },
        {
          id = 88,
          name = "toTest3",
          type = "down",
          shape = "rectangle",
          x = 320,
          y = 352,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["destX"] = 352,
            ["destY"] = 16
          }
        }
      }
    }
  }
}
