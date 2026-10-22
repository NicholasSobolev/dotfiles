return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    {
      "windwp/nvim-ts-autotag",
      config = function()
        require("nvim-ts-autotag").setup({
          filetypes = { "html", "xml", "javascriptreact", "typescriptreact", "vue" },
        })
      end,
    },
  },
  config = function()
    require("nvim-treesitter.config").setup({
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "svelte",
				callback = function()
					vim.treesitter.start()
				end,
			}),
      ensure_installed = { "c", "lua", "vim", "vimdoc", "rust", "go", "cpp", "javascript", "html", "tsx", "svelte", "css", "javascript", "typescript" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
    })

    -- optional: remove bold function highlights
    local hl = { "@function", "@function.call", "@function.builtin", "@method", "@constructor" }
    for _, group in ipairs(hl) do
      vim.api.nvim_set_hl(0, group, { bold = false })
    end
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        for _, group in ipairs(hl) do
          vim.api.nvim_set_hl(0, group, { bold = false })
        end
      end,
    })
  end,
}
