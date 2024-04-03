vim.g.neoformat_try_node_exe = 1

vim.cmd([[autocmd BufWritePre *.html,*.js,*.scss,*.json,*.ts undojoin | Neoformat]])

