-- Set leader
vim.g.mapleader = " "

-- Other remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "jk", "<esc>")

-- Copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Split
vim.keymap.set("n", "<leader>ss", vim.cmd.split)
vim.keymap.set("n", "<leader>vv", vim.cmd.vsplit)

-- Terminal
vim.keymap.set("n", "<leader>t", [[:split<enter>:terminal<enter>A]])  -- enter terminal split
vim.keymap.set("n", "<leader>T", [[:vsplit<enter>:terminal<enter>A]]) -- enter terminal vsplit
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])                          -- leave terminal mode
vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>:q<enter>]])            -- leave & close terminal
