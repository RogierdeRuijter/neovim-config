require("rogier")

vim.api.nvim_command("autocmd BufNewFile *.html 0r ~/.vim/templates/html.skel");
vim.api.nvim_command("autocmd BufNewFile *.webcomponent.js 0r ~/.vim/templates/webcomponent.skel");
vim.api.nvim_command("autocmd BufNewFile *.litcomponent.js 0r ~/.vim/templates/litcomponent.skel");

vim.api.nvim_set_keymap('n', '<space>e', ':lua open_float()<CR>', { noremap = true, silent = true })

-- Enable spell checking
vim.opt.spell = true

-- Set the spell language to English US (en_us)
vim.opt.spelllang = "en_us"

-- Cursor to block
vim.opt.guicursor = ""

-- capital w saves the file
vim.cmd([[command! -nargs=0 W write]])


