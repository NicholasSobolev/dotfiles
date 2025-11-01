return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    lsp_file_methods = {
      enabled = true,
      timeout_ms = 1000,
      autosave_changes = true,
    },
    columns = {
      "permissions",
      "icon",
    },
    float = {
      max_width = 0.7,
      max_height = 0.6,
      border = "rounded",
    },
  },
  -- Optional dependencies
  dependencies = {
    { "nvim-mini/mini.icons", opts = {} },
    -- { "nvim-tree/nvim-web-devicons" }, -- use this instead if you prefer nvim-web-devicons
  },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
