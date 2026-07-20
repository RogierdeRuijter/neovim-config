local treesitter = require('nvim-treesitter')

treesitter.setup {
  --[[
  ensure_installed = {
    "astro",
    "bash",
    "css",
    "dockerfile",
    "gitignore",
    "graphql",
    "html",
    "javascript",
    "lua",
    "query",
    "tsx",
    "typescript",
    "vim",
    "vimdoc"
  },
  --]]

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  --[[
  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  --]]

  autotag = {
    enable = true,
  },
}

vim.api.nvim_create_autocmd('FileType', { 
    callback = function() 
      -- Enable treesitter highlighting and disable regex syntax
      pcall(vim.treesitter.start) 
      -- Enable treesitter-based indentation
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" 
    end,
}) 

local ensureInstalled = {
    "astro",
    "bash",
    "css",
    "dockerfile",
    "gitignore",
    "graphql",
    "html",
    "javascript",
    "lua",
    "query",
    "tsx",
    "typescript",
    "vim",
    "vimdoc"
    -- ... your parsers
  }
local alreadyInstalled = require('nvim-treesitter').get_installed()
local parsersToInstall = vim.iter(ensureInstalled)
  :filter(function(parser)
    return not vim.tbl_contains(alreadyInstalled, parser)
  end)
  :totable()

require('nvim-treesitter').install(parsersToInstall)

