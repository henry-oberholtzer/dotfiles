-- Key Remappings

-- When selecting a whole line, capital J or K to move up or down
-- vim.setmap.set(MODE, KEY, COMMAND)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- try jj to exit insert mode
vim.keymap.set("i", "jj", "<esc>")
-- pressing o will open a new line below
vim.keymap.set("n", "o", "o<esc>")
-- pressing O will open a new line above
vim.keymap.set("n", "O", "O<esc>")
-- center cursor vertically when moving to the next word
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
-- yank from cursor to end of line
vim.keymap.set("n", "Y", "y$")


vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
