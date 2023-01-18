require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "lua", "python", "vim", "help" },
  sync_install = true,
  auto_install = false,
  ignore_install = {},

  highlight = {
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true
  },

  rainbow = {
    enable = true,
    disable = {},
    extended_mode = true,
    max_file_lines = nil,
    colors = {
      "#ff0000",
      "#ffa500",
      "#ffff00",
      "#00ff00",
      "#00ffff",
      "#0000ff",
      "#663399",
    },
    termcolors = {
    }
  }
})

vim.opt["foldmethod"] = "expr"
vim.opt["foldexpr"] = "nvim_treesitter#foldexpr()"
vim.opt["foldenable"] = false
