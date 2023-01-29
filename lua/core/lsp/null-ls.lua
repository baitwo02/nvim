local null_ls = require("null-ls")

null_ls.builtins.formatting.stylua.with({
  extra_args = { "--indent-type", "Space" },
})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.spell,
  },
})
