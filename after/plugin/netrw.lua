vim.g.netrw_keymap_mappings = {
  ['{Left-Mapping}'] = ':<C-U>TmuxNavigateLeft<CR>',
  ['{Down-Mapping}'] = ':<C-U>TmuxNavigateDown<CR>',
  ['{Up-Mapping}'] = ':<C-U>TmuxNavigateUp<CR>',
  ['{Right-Mapping}'] = ':<C-U>TmuxNavigateRight<CR>',
  ['{Previous-Mapping}'] = ':<C-U>TmuxNavigatePrevious<CR>',
}

-- Create an autocmd for netrw file type to map <leader>n to create index.html
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    -- Map <leader>n to create and edit a new file 'index.html'
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>n", ":edit %:p:h/index.html<CR>", { noremap = true, silent = true })
  end,
})

