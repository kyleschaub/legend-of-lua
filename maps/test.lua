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
  nextobjectid = 88,
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
        1642, 1642, 1642, 1643, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1885, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481,
        1642, 1642, 1642, 1643, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1885, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481,
        1642, 1642, 1642, 1643, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1885, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481, 1481,
        1642, 1642, 1642, 1643, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2657, 1925, 1926, 1926, 1926, 1926, 1926, 1926, 1926, 1926, 1926, 1926, 1926, 1926, 1926, 1926, 1926, 1926,
        1642, 1642, 1642, 1643, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2657, 1965, 1966, 1966, 1966, 1966, 1966, 1966, 1966, 1966, 1966, 1966, 1966, 1966, 1966, 1966, 1966, 1966,
        1642, 1642, 1642, 1761, 1602, 1602, 1603, 2698, 2698, 2698, 2698, 2698, 2698, 2005, 2006, 1928, 2006, 2006, 2006, 2006, 2006, 2006, 2006, 2006, 2006, 2006, 2006, 2006, 2006, 2006,
        1642, 1642, 1642, 1642, 1642, 1642, 1643, 2698, 2698, 1888, 1848, 2698, 2698, 2045, 2046, 1968, 2046, 2046, 2046, 2046, 2046, 2046, 2046, 2046, 2046, 2046, 2046, 2046, 2046, 2046,
        1642, 1642, 1642, 1642, 1642, 1642, 1643, 2698, 2698, 2658, 2658, 2658, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2657, 2698, 2698, 2698,
        1642, 1642, 1642, 1642, 1642, 1642, 1643, 2698, 1848, 2658, 2698, 2658, 2658, 2658, 2657, 2657, 2698, 2698, 2698, 2698, 2698, 2698, 1481, 1848, 2698, 2698, 2698, 2698, 2698, 2698,
        1642, 1642, 1642, 1642, 1642, 1642, 1643, 2698, 2698, 2658, 2658, 2658, 2777, 2698, 2698, 2698, 2698, 2698, 2698, 1888, 2817, 2698, 1723, 1724, 1724, 1724, 1724, 1724, 1724, 1724,
        1682, 1682, 1682, 1682, 1682, 1682, 1683, 2698, 2698, 1849, 1889, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1763, 1764, 1764, 1764, 1764, 1764, 1764, 1764,
        2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2736, 2775, 2698, 2698, 2698, 2698, 2698, 1763, 1764, 1764, 1764, 1764, 1764, 1764, 1764,
        2698, 2698, 2698, 2698, 2698, 1848, 2698, 2698, 2736, 2735, 2818, 2698, 2698, 1481, 2698, 2698, 2698, 2698, 1723, 1724, 1724, 1724, 1884, 1764, 1764, 1843, 1804, 1804, 1804, 1804,
        1602, 1602, 1602, 1602, 1602, 1602, 1603, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1763, 1764, 1764, 1764, 1764, 1764, 1764, 1765, 2698, 2698, 2698, 2698,
        1642, 1642, 1642, 1642, 1642, 1642, 1643, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1763, 1764, 1764, 1764, 1764, 1764, 1764, 1765, 2698, 2698, 2698, 2698,
        1642, 1642, 1642, 1642, 1642, 1642, 1643, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2817, 1848, 1763, 1764, 1764, 1843, 1804, 1804, 1804, 1805, 2698, 2698, 2698, 2698,
        1642, 1642, 1642, 1642, 1642, 1642, 1643, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1763, 1764, 1764, 1765, 1889, 2698, 2698, 2698, 2698, 2698, 2698, 2698,
        1642, 1642, 1642, 1642, 1642, 1642, 1643, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1848, 2698, 1763, 1764, 1764, 1765, 2698, 2698, 2698, 1848, 2698, 2698, 1481, 2698,
        1642, 1642, 1642, 1642, 1642, 1642, 1761, 1602, 1602, 1602, 1603, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1763, 1764, 1764, 1765, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698,
        1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1643, 2698, 1849, 1481, 2698, 2698, 2698, 2698, 1763, 1764, 1764, 1765, 2698, 1481, 2698, 2698, 2698, 2698, 2698, 2698,
        1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1643, 2698, 2698, 2698, 1888, 1889, 2698, 2698, 1763, 1764, 1764, 1765, 2698, 1849, 2698, 2698, 2698, 2698, 2698, 2698,
        1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1642, 1643, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 1763, 1764, 1764, 1765, 2698, 2698, 2698, 2698, 2698, 2698, 2698, 2698
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
        0, 0, 0, 0, 1487, 1488, 1489, 1490, 1491, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1525, 1526, 0,
        0, 0, 0, 0, 1527, 1528, 1529, 1530, 1531, 0, 0, 0, 0, 0, 0, 1525, 1526, 0, 0, 0, 1689, 0, 0, 0, 0, 0, 0, 1565, 1566, 0,
        0, 0, 0, 0, 1567, 1568, 1569, 1570, 1571, 1924, 1924, 0, 0, 0, 0, 1565, 1566, 0, 0, 0, 0, 0, 0, 0, 0, 1691, 0, 0, 0, 0,
        0, 0, 0, 0, 1607, 1608, 1609, 1610, 1611, 1924, 1924, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 1647, 1648, 1649, 1650, 1651, 1924, 1924, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1684, 1685, 1686, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 1964, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1691, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 1963, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 2641, 2642, 2642, 2642, 2642, 2642, 2642, 2643, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1964, 1963, 0,
        0, 0, 0, 0, 0, 0, 0, 2681, 2682, 2682, 2682, 2682, 2682, 2682, 2683, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 2681, 2682, 2682, 2682, 2682, 2682, 2682, 2683, 0, 0, 0, 1729, 1730, 1730, 1731, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 2721, 2722, 2722, 2722, 2722, 2722, 2722, 2723, 0, 0, 0, 1769, 1770, 1770, 1771, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1809, 1810, 1810, 1811, 0, 0, 1601, 1602, 1602, 1602, 1602, 1602,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1641, 1642, 1642, 1642, 1642, 1642,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1641, 1642, 1642, 1642, 1642, 1642,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1641, 1642, 1642, 1642, 1642, 1642
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
      objects = {
        {
          id = 78,
          name = "",
          type = "",
          shape = "rectangle",
          x = 321.091,
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
          x = 272,
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
          x = 208,
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
          x = 240,
          y = 64,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 82,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 64,
          width = 224,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 83,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 0,
          width = 32,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 85,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 0,
          width = 32,
          height = 80,
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
          x = 157,
          y = 124.75,
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
          x = 218.75,
          y = 166,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 60,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 288,
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
          x = 433.273,
          y = 258.909,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 64,
          name = "",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 76,
          name = "",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 208,
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
          id = 75,
          name = "skeleton",
          type = "",
          shape = "point",
          x = 144,
          y = 176,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["form"] = 2
          }
        },
        {
          id = 77,
          name = "eye",
          type = "",
          shape = "point",
          x = 320,
          y = 160,
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
          id = 66,
          name = "",
          type = "",
          shape = "rectangle",
          x = 304,
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
          x = 368,
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
          x = 368,
          y = 160,
          width = 32,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 69,
          name = "",
          type = "",
          shape = "rectangle",
          x = 400,
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
          x = 304,
          y = 290,
          width = 32,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 71,
          name = "",
          type = "",
          shape = "rectangle",
          x = 304,
          y = 240,
          width = 32,
          height = 26,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 72,
          name = "",
          type = "",
          shape = "rectangle",
          x = 336,
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
          x = 432,
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
          x = 304,
          y = 320,
          width = 32,
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
          id = 84,
          name = "toPlayerHouse",
          type = "",
          shape = "rectangle",
          x = 96.1818,
          y = 44.1818,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["destX"] = 408,
            ["destY"] = 390
          }
        },
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
        }
      }
    }
  }
}
