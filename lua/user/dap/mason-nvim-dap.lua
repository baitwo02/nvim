local dap = require("dap")
local mason_nvim_dap = require("mason-nvim-dap")


local mason_nvim_dap_setting = {
    -- 表内的 adapter 如果未安装, 则会自动安装 
    -- 该设置与 `automatic_installation` 没有半毛钱关系
    ensure_installed = {},

	-- 注意: 此设置是为了可能更深入的需求
	-- 决定如果一个 adapter (通过 dap)设置好了, 但是没有安装好, 是否应该自动安装
	-- 该选项和 `ensure_installed` 没有一毛钱关系
	-- 参数可以是一下值:
	--   - false: dap 不会自动安装 adapter
	--   - true: 所有通过 dap 配置好的 adapter 都会自动安装J
	--   - { exclude: string[] }: 所有通过 mason-nvim-dap 配置好的 adapter 都会自动安装, 除了这个表里面的内容
	--       Example: automatic_installation = { exclude = { "python", "delve" } }
    automatic_installation = false,

	-- 通过 mason 安装的 adapter 是否会通过 dap 自动配置好
	-- 可以移除该项通过 dap 手动配置
	-- 参考 mappings.adapters and mappings.configurations 来设置
	-- 如果设置为 true, 必须使用: `require 'mason-nvim-dap'.setup_handlers()`
	-- 值可以如下:
	-- 	- false: dap 不会自动配置
	-- 	- true: dap 会自动配置
	-- 	- {adapters: {ADAPTER: {}, }, configurations: {ADAPTER: {}, }}. 允许覆写默认配置
	automatic_setup = false,
}

mason_nvim_dap.setup(mason_nvim_dap_setting)

mason_nvim_dap.setup_handlers {
    function(source_name) -- 允许所有没有 handler 的源使用
      -- 需要初始设置 `automatic_setup = true`
      require('mason-nvim-dap.automatic_setup')(source_name)
    end,

    -- python = function(source_name)
    --     dap.adapters.python = {
	--         type = "executable",
	--         command = "/usr/bin/python3",
	--         args = { "-m", "debugpy.adapter" },
    --     }

    --     dap.configurations.python = {
	--         {
	-- 	        type = "python",
	-- 	        request = "launch",
	-- 	        name = "Launch file",
	-- 	        program = "${file}", -- This configuration will launch the current file if used.
	--         },
    --     }
    -- end,
}


