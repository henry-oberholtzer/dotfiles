return {
 "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  module = "telescope",

  config = function()
    require('telescope').setup({})

    local builtin = require('telescope.builtin')

    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = 'Telescope live grep'})
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = 'Telescope buggers'})
    vim.keymap.set("n", "<leader>fh", "Telescope help tags")

    vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)
  end
} 
