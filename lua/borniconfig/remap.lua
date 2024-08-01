vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Remap netrw file explorer
vim.keymap.set("n", "<leader>fs", vim.cmd.Ex)

-- Remap page jump
vim.keymap.set("n", "<C-j>", "<C-d>zz")
vim.keymap.set("n", "<C-k>", "<C-u>zz")

-- Moves lines to top and bottom with auto indenting
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--J normally deletes lines below and appends it to the current line. This shortcut leaves the cursor on the current position
vim.keymap.set("n", "J", "mzJ`z")

--Keeps yank buffer unchanged after paste (buffer normally gets overwritten after paste)
vim.keymap.set("x", "<leader>p", "\"_dP")

--yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

--command to replace current selection with <something>
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
