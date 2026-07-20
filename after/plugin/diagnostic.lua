vim.diagnostic.config({
  virtual_text = true,  -- show inline
  signs = true,         -- show signs in the gutter
  underline = true,     -- underline problematic code
  update_in_insert = false, -- update only on Normal mode
  severity_sort = true, -- sort by severity
})
