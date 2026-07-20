--[[
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
--]]


vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end })


vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/github/copilot.vim",
  "https://github.com/EdenEast/nightfox.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/theprimeagen/harpoon",
	"https://github.com/mbbill/undotree",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	-- Core completion plugin
	"https://github.com/hrsh7th/nvim-cmp",
	-- Completion sources
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	"https://github.com/hrsh7th/cmp-buffer",
	"https://github.com/hrsh7th/cmp-path",
	"https://github.com/hrsh7th/cmp-cmdline",
	-- Snippet engine (optional but recommended)
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/saadparwaiz1/cmp_luasnip",
	-- Snippet collection (optional)
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/tpope/vim-surround",
	"https://github.com/sbdchd/neoformat",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/ThePrimeagen/git-worktree.nvim",
	-- Library below does not work
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/nvim-lua/popup.nvim",
  "https://github.com/apple/pkl-neovim",
	"https://github.com/nvim-telescope/telescope-fzy-native.nvim",
  --[[
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = "make tiktoken",
    opts = {
      model = 'gpt-4.1',           -- AI model to use
      temperature = 0.1,           -- Lower = focused, higher = creative
      window = {
        layout = 'vertical',       -- 'vertical', 'horizontal', 'float'
        width = 0.5,              -- 50% of screen width
      },
      auto_insert_mode = true,     -- Enter insert mode when opening
    },
  },
  --]]
})

local hasConfigTreesitter, treesitterConfigs = pcall(require, "nvim-treesitter")
if hasConfigTreesitter then
  treesitterConfigs.setup {
    ensure_installed = "pkl",  -- install pkl parser
    highlight = {
      enable = true,           -- enable tree-sitter highlighting
    },
    indent = {
      enable = true
    },
  }
end
