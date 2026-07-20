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

vim.o.autocomplete = true
vim.o.pumheight = 5

vim.opt.completeopt = { "menuone", "noselect" }

-- capital w saves the file
--
vim.cmd([[command! -nargs=0 W write]])

require("mason").setup()

-- Where do the lsp settings come from? Answer: nvim-lspconfig

-- This should be moved somewhere else after a while
vim.lsp.enable('astro')
 -- 'cssls',
vim.lsp.enable('cssls')
 -- 'dockerls',
vim.lsp.enable('eslint')
 -- 'html',
vim.lsp.enable('html')
 -- 'jsonls',
vim.lsp.enable('jsonls')
 -- 'lua_ls',
vim.lsp.enable('lua_ls')
 -- 'marksman',
vim.lsp.enable('marksman')
 -- 'ts_ls'
vim.lsp.enable('ts_ls')

vim.lsp.config.graphql = {
  filetypes = { "astro", "graphql", "javascript", "typescript", "vue" },
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/implementation') then
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
      -- has an overwrite to switch panes with tmux
      -- keymap("i", "<C-h>", vim.lsp.buf.signature_help, opts)
      -- Create a keymap for vim.lsp.buf.implementation ...
    end
    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    if client:supports_method('textDocument/completion') then
      -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      -- client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
    end
    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    --[[
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
    --]]
  end,
})

--[[
local function on_attach(client, bufnr)
end

vim.lsp.config('*', {
  on_attach = on_attach,
})
]]--

vim.cmd.colorscheme="catppuccin"

local device_file = vim.fn.stdpath("config") .. "/lua/device.lua"
local f = io.open(device_file, "r")
if f ~= nil then
  io.close(f)       -- close the file after checking
  dofile(device_file)  -- execute it
end
