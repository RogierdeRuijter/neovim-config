require('lualine').setup {
  options = {
    icons_enabled = false
  },
  sections = {
    lualine_a = {''},
    lualine_b = { { 'filename', path = 1 } },
    lualine_c = {''},
    lualine_x = {'branch', 'diff', 'diagnostics'},
    lualine_y = {''},
    lualine_z = {''}
  }
}

