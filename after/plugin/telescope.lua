local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup()

telescope.load_extension('fzy_native')

vim.keymap.set('n', '<leader>pf', function ()
  builtin.find_files({ hidden = true })
end)

vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string {
      search = vim.fn.input("Grep > "),
      additional_args = function()
        return {"--hidden"}
      end
    };
end)

require("telescope").load_extension("git_worktree")

vim.keymap.set('n', '<leader>pw', function()
  telescope.extensions.git_worktree.git_worktrees()
end)

