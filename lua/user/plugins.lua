return {
  {
    -- 主题插件
    "EdenEast/nightfox.nvim",
    lazy = false,
  },
  {
    -- markdown preview
    "iamcco/markdown-preview.nvim",
    lazy = true,
    build = "cd app && npm install",
    ft = { "markdown", }
  },
  {
    -- latex
    "lervag/vimtex",
    lazy = true,
    ft = { "markdown", "tex"}
  },
}
