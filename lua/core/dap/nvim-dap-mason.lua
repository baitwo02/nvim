local mason_nvim_dap = require("mason-nvim-dap")

local mason_nvim_dap_setting = {
  ensure_installed = { "debugpy", }, -- 会自动安装表内插件, 和第二个参数没有半毛钱关系
  automatic_installation = false, -- 如果配置号的adapter 没有安装, 会自动安装, 和第一个参数没有一毛钱关系
  automatic_setup = true, -- 自动配置 adapter
}

mason_nvim_dap.setup(mason_nvim_dap_setting)

mason_nvim_dap.setup_handlers({
  function(source_name) -- 允许所有没有 handler 的源使用
    require("mason-nvim-dap.automatic_setup")(source_name) -- 需要初始设置 `automatic_setup = true`
  end,

  require('dap.ext.vscode').load_launchjs(
    "/home/baitwo02/.vscode/launch.json",
    {
      cppdbg = { "c", "cpp", "rust" },
      python = { "python" }
    })
})
