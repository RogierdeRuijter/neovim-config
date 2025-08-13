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
--
vim.cmd([[command! -nargs=0 W write]])

require("mason").setup()

-- Where do the lsp settings come from?
-- This should be moved somewhere else after a while
vim.lsp.enable('astro')
 -- 'cssls',
vim.lsp.enable('cssls')
 -- 'dockerls',
vim.lsp.enable('dockerls')
 -- 'eslint',
vim.lsp.enable('eslint')
 -- 'graphql',
vim.lsp.enable('graphql')
 -- 'html',
vim.lsp.enable('html')
 -- 'jsonls',
vim.lsp.enable('jsonls')
 -- 'lua_ls',
vim.lsp.enable('luals')
 -- 'marksman',
vim.lsp.enable('marksman')
 -- 'ts_ls'
 -- vim.lsp.enable('typescript-language-server')
vim.lsp.enable('ts_ls')

vim.lsp.config.graphql = {
  filetypes = { "astro", "graphql", "javascript", "typescript", "vue" },
}

local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  local keymap = vim.keymap.set

  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "gl", function()
    vim.diagnostic.open_float(nil, { scope = "line" })
  end, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  keymap("n", "<leader>vd", vim.diagnostic.open_float, opts)
  keymap("n", "[d", vim.diagnostic.goto_next, opts)
  keymap("n", "]d", vim.diagnostic.goto_prev, opts)
  keymap("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  keymap("n", "<leader>vrr", vim.lsp.buf.references, opts)
  keymap("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  keymap("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

vim.lsp.config('*', {
  on_attach = on_attach,
})

vim.cmd.colorscheme="catppuccin"

