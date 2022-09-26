return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.5.0",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 29,
  height = 22,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 11,
  nextobjectid = 106,
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
      tiles = {
        {
          id = 258,
          animation = {
            {
              tileid = 258,
              duration = 100
            },
            {
              tileid = 259,
              duration = 100
            },
            {
              tileid = 260,
              duration = 100
            }
          }
        },
        {
          id = 298,
          animation = {
            {
              tileid = 298,
              duration = 100
            },
            {
              tileid = 299,
              duration = 100
            },
            {
              tileid = 300,
              duration = 100
            }
          }
        },
        {
          id = 338,
          animation = {
            {
              tileid = 338,
              duration = 100
            },
            {
              tileid = 339,
              duration = 100
            },
            {
              tileid = 340,
              duration = 100
            }
          }
        },
        {
          id = 377,
          animation = {
            {
              tileid = 377,
              duration = 200
            },
            {
              tileid = 417,
              duration = 200
            },
            {
              tileid = 458,
              duration = 200
            }
          }
        },
        {
          id = 378,
          animation = {
            {
              tileid = 378,
              duration = 200
            },
            {
              tileid = 418,
              duration = 200
            },
            {
              tileid = 459,
              duration = 200
            }
          }
        },
        {
          id = 379,
          animation = {
            {
              tileid = 379,
              duration = 200
            },
            {
              tileid = 419,
              duration = 200
            },
            {
              tileid = 460,
              duration = 200
            }
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 29,
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
        1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1885, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1763, 1764, 1764, 1764, 1765, 1481,
        1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1885, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1763, 1764, 1764, 1764, 1765, 1481,
        1642, 1642, 1721, 1682, 1682, 1682, 1682, 1682, 1682, 1682, 1682, 1682, 1885, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1763, 1764, 1764, 1764, 1765, 1481,
        1642, 1642, 1643, 2698, 2658, 2698, 2698, 2697, 2657, 2737, 2698, 2698, 1925, 1926, 1926, 1926, 1926, 1926, 1926, 1926, 1926, 1926, 1926, 2170, 1739, 1739, 1739, 2171, 1926,
        1642, 1642, 1643, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1965, 1966, 1966, 1966, 1966, 1966, 1966, 1966, 1966, 1966, 1966, 2210, 1779, 1779, 1779, 2211, 1966,
        1642, 1642, 1761, 1602, 1603, 2658, 2657, 2698, 2698, 2698, 2698, 2698, 2005, 2006, 1928, 2006, 2006, 2006, 2006, 2006, 2006, 2006, 2006, 2250, 1779, 1779, 1779, 2251, 2006,
        1642, 1642, 1642, 1642, 1643, 2658, 2698, 2698, 1888, 1848, 2698, 2698, 2045, 2046, 1968, 2046, 2046, 2046, 2046, 2046, 2046, 2209, 2285, 2247, 1819, 1819, 1819, 2284, 2285,
        1642, 1642, 1642, 1642, 1643, 2736, 2698, 2698, 2658, 2658, 2658, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1763, 1764, 1858, 1859, 1859, 1859, 1860, 1764,
        1642, 1642, 1642, 1642, 1643, 2658, 2698, 1848, 2658, 2698, 2658, 2658, 2658, 2657, 2657, 2698, 2698, 2698, 2698, 2698, 2698, 1763, 1764, 1764, 1764, 1764, 1764, 1764, 1764,
        1642, 1642, 1642, 1642, 1643, 2658, 2698, 2698, 2658, 2658, 2658, 2777, 2698, 2698, 2698, 2698, 2698, 2698, 1888, 2817, 2698, 1763, 1764, 1764, 1764, 1764, 1764, 1764, 1764,
        1682, 1682, 1682, 1682, 1683, 2658, 2698, 2698, 1849, 1889, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1763, 1764, 1764, 1764, 1764, 1764, 1764, 1764,
        2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2736, 2775, 2698, 2698, 2698, 2698, 2698, 1763, 1764, 1764, 1764, 1764, 1764, 1764, 1764,
        2698, 2698, 2698, 2698, 1848, 2698, 2698, 2736, 2735, 2818, 2698, 2698, 1481, 2698, 2698, 2698, 2698, 1723, 1724, 1724, 1724, 1884, 1764, 1764, 1843, 1804, 1804, 1804, 1804,
        1602, 1602, 1602, 1602, 1603, 2658, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1763, 1764, 1764, 1764, 1764, 1764, 1764, 1765, 2698, 2698, 2698, 2698,
        1642, 1642, 1642, 1642, 1643, 2658, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1763, 1764, 1764, 1764, 1764, 1764, 1764, 1765, 2698, 2698, 2698, 2698,
        1642, 1642, 1642, 1642, 1643, 2658, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2817, 1848, 1763, 1764, 1764, 1843, 1804, 1804, 1804, 1805, 2698, 2698, 2698, 2698,
        1642, 1642, 1642, 1642, 1643, 2736, 0, 0, 0, 0, 0, 0, 0, 0, 2696, 2698, 2698, 1763, 1764, 1764, 1765, 1889, 2698, 2698, 2698, 2698, 2698, 2698, 2698,
        1642, 1642, 1642, 1642, 1643, 2658, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1848, 2698, 1763, 1764, 1764, 1765, 2698, 2698, 2698, 1848, 2698, 2698, 1481, 2698,
        1642, 1642, 1642, 1642, 1643, 2658, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1763, 1764, 1764, 1765, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1602,
        1642, 1642, 1642, 1642, 1761, 1602, 1602, 1602, 1603, 2696, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1763, 1764, 1764, 1765, 2698, 1481, 2698, 2698, 2698, 2698, 2698, 1642,
        1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1643, 2696, 2696, 1849, 1481, 2698, 2698, 2698, 2698, 1763, 1764, 1764, 1765, 2698, 1849, 2698, 2698, 2698, 2698, 1642, 1642,
        1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1643, 2696, 2698, 2698, 2698, 1888, 1889, 2698, 2698, 1763, 1764, 1764, 1765, 2698, 2698, 1641, 1642, 1642, 1642, 1642, 1642
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 29,
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
        2126, 2127, 2126, 2127, 2126, 2127, 2126, 2127, 2126, 2127, 2126, 2127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        2166, 2167, 2166, 2167, 2166, 2167, 2166, 2167, 2166, 2167, 2166, 2167, 0, 0, 1525, 1526, 0, 0, 0, 1689, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        2126, 2127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1565, 1566, 0, 0, 0, 0, 0, 0, 1691, 0, 0, 0, 0, 0, 0,
        2166, 2167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        2126, 2127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1924, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        2166, 2167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1924, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        2126, 2127, 2126, 2127, 0, 0, 0, 0, 0, 0, 0, 1924, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        2166, 2167, 2166, 2167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1684, 1685, 1686, 1964, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        2126, 2127, 2126, 2127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        2166, 2167, 2166, 2167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 1964, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1691, 1963, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1963, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2161,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2205,
        2126, 2127, 2126, 2127, 0, 0, 2641, 2642, 2642, 2642, 2642, 2642, 2642, 2643, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2205,
        2166, 2167, 2166, 2167, 0, 0, 2681, 2682, 2682, 2682, 2682, 2682, 2682, 2683, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1964, 1963, 2205,
        2126, 2127, 2126, 2127, 0, 0, 2681, 2682, 2682, 2682, 2682, 2682, 2682, 2683, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2205,
        2166, 2167, 2166, 2167, 0, 0, 2721, 2722, 2722, 2722, 2722, 2722, 2722, 2723, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2205,
        2126, 2127, 2126, 2127, 0, 0, 0, 1802, 1963, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1601, 1602, 1602, 1602, 1602, 2205,
        2166, 2167, 2166, 2167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1641, 1642, 1642, 1642, 1642, 2205,
        2126, 2127, 2126, 2127, 2126, 2127, 2126, 2127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1641, 1642, 1642, 1642, 1642, 2205,
        2166, 2167, 2166, 2167, 2166, 2167, 2166, 2167, 2241, 2165, 2165, 2165, 2165, 2165, 2165, 2165, 2165, 2242, 0, 0, 2241, 2165, 2165, 2165, 2165, 2165, 2165, 2165, 2204
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 29,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
      objects = {
        {
          id = 78,
          name = "",
          type = "",
          shape = "rectangle",
          x = 305.091,
          y = 181.818,
          width = 14,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 79,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 112,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 80,
          name = "",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 0,
          width = 32,
          height = 112,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 81,
          name = "",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 64,
          width = 16,
          height = 20,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 82,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 64,
          width = 224,
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
          x = 0,
          y = 96,
          width = 64,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 94,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 95,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 0,
          width = 160,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 96,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 224,
          width = 64,
          height = 128,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 97,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 320,
          width = 64,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 98,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 336,
          width = 160,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 103,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 336,
          width = 128,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 104,
          name = "",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 192,
          width = 16,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
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
          id = 56,
          name = "",
          type = "",
          shape = "rectangle",
          x = 132.25,
          y = 136.75,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 57,
          name = "",
          type = "",
          shape = "rectangle",
          x = 202.75,
          y = 166,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 61,
          name = "",
          type = "",
          shape = "rectangle",
          x = 408,
          y = 216,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 88,
          name = "",
          type = "",
          shape = "rectangle",
          x = 60,
          y = 56,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 99,
          name = "",
          type = "",
          shape = "rectangle",
          x = 236,
          y = 292,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 102,
          name = "",
          type = "",
          shape = "rectangle",
          x = 344,
          y = 272,
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
      objects = {
        {
          id = 105,
          name = "test1",
          type = "small",
          shape = "rectangle",
          x = 400,
          y = 272,
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
          id = 66,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 208,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 67,
          name = "",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 208,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 68,
          name = "",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 176,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 69,
          name = "",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 160,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 70,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 288,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 71,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 240,
          width = 32,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 72,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 208,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 73,
          name = "",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 160,
          width = 48,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 74,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 89,
          name = "",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 144,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 90,
          name = "",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 112,
          width = 20,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 91,
          name = "",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 128,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 92,
          name = "",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 128,
          width = 48,
          height = 32,
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
          id = 86,
          name = "toTest2",
          type = "left",
          shape = "rectangle",
          x = -16,
          y = 160,
          width = 16,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["destX"] = 462,
            ["destY"] = 192
          }
        },
        {
          id = 100,
          name = "toTest",
          type = "right",
          shape = "rectangle",
          x = -40,
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
          id = 101,
          name = "toTestCave",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 84,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["destX"] = 232,
            ["destY"] = 374
          }
        }
      }
    }
  }
}
