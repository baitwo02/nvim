local palettes = {
  all = {
    red = "#ff0000",
  },
  nightfox = {
    red = "#c94f6d",
  },
  dayfox = {
    blue = { base = "#4d688e", bright = "#4e75aa", dim = "#485e7d" },
  },
  nordfox = {
    bg1 = "#2e3440",
    sel0 = "#3e4a5b", -- Popup bg, visual selection bg
    sel1 = "#4f6074", -- Popup sel bg, search bg
    comment = "#60728a",
  },
}

local specs = {
  all = {
    syntax = {
      keyword = "magenta",
      conditional = "magenta.bright",
      number = "orange.dim",
    },
    git = {
      changed = "#f4a261",
    },
  },
  nightfox = {
    syntax = {
      operator = "orange",
    },
  },
}

local groups = {
  all = {
    Whitespace = { link = "Comment" },
    IncSearch = { bg = "palette.cyan" },
  },
  nightfox = {
    PmenuSel = { bg = "#73daca", fg = "bg0" },
  },
}

require("nightfox").setup({ palettes = palettes, specs = specs, groups = groups })

vim.cmd("colorscheme nightfox")

