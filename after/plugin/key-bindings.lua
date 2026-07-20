vim.keymap.set("n", "<F3>", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer with LSP" })

vim.keymap.set("n", "<F4>", ":Neoformat<CR>", { noremap = true, silent = true })

