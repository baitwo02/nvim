local mason = require("mason")

-- 官方默认配置
local mason_settings = {
  -- 配置安装目录
  install_root_dir = vim.fn.stdpath("data") .. "/mason",

  -- mason 将其 bin 文件放在你环境变量哪个位置:
  -- - "prepend" (default, 放在 PATH 开头)
  -- - "append" (放在 PATH 末尾)
  -- - "skip" (不修改 PATH)
  PATH = "prepend",

  pip = {
    -- 安装包之前, 是否将虚拟环境的 pip 更新到最新版本
    upgrade_pip = false,

    -- 添加 pip install 的参数
    -- Example: { "--proxy", "https://proxyserver" }
    install_args = {},
  },

  -- 设置哪种日志会被写入到日志文件当中
  log_level = vim.log.levels.INFO,

  -- 限制同时安装的包的数量
  max_concurrent_installers = 4,

  github = {
    -- The template URL to use when downloading assets from GitHub.
    -- The placeholders are the following (in order):
    -- 1. The repository (e.g. "rust-lang/rust-analyzer")
    -- 2. The release version (e.g. "v0.3.0")
    -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
    download_url_template = "https://github.com/%s/releases/download/%s/%s",
  },

  -- The provider implementations to use for resolving package metadata (latest version, available versions, etc.).
  -- Accepts multiple entries, where later entries will be used as fallback should prior providers fail.
  -- Builtin providers are:
  --   - mason.providers.registry-api (default) - uses the https://api.mason-registry.dev API
  --   - mason.providers.client                 - uses only client-side tooling to resolve metadata
  providers = {
    "mason.providers.registry-api",
  },

  ui = {
    -- 打开 mason 窗口时, 是否自动检测为船新版本
    check_outdated_packages_on_open = true,

    -- 使用 ui 窗口时边框样式, 接受和 |nvim_open_win()| 一样的参数.
    border = "none",

    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    },

    keymaps = {
      -- 展开详细信息
      toggle_package_expand = "<CR>",
      -- 安装光标所在位置的包
      install_package = "i",
      -- 升级光标所在位置的包
      update_package = "u",
      -- 检测光标所在位置的包是否为船新版本
      check_package_version = "c",
      -- 升级所有包
      update_all_packages = "U",
      -- 检测那些已安装的包过时了
      check_outdated_packages = "C",
      -- 卸载光标所在位置的包
      uninstall_package = "X",
      -- 取消正在安装的包
      cancel_installation = "<C-c>",
      -- 使用筛选器
      apply_language_filter = "<C-f>",
    },
  },
}

mason.setup(
  mason_settings
)
