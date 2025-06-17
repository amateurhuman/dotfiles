vim.g.mapleader = " "

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Load the plugin
local omnibox = require("omnibox")

-- Set up the keymap to open it
vim.keymap.set("n", "<C-p>", function()
  omnibox:open()
end, { noremap = true, silent = true })

vim.g.augment_workspace_folders = { "~/Source/github.com/augmentcode/vim-microsite/" }

vim.keymap.set("n", "<Leader>ac", ":Augment chat<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>at", ":Augment chat-toggle<CR>", { noremap = true, silent = true })
