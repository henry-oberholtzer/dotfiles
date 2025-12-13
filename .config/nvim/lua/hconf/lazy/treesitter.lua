return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  cnfig = function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
	  "python",	
          "lua",
          "vim",
          "vimdoc",
          "c",
          "query",
	  "markdown"
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
          disable = { "python", "c" } -- these and some other langs don't work well
        },
      })
  end
}
