  vim.cmd('set termguicolors')
  require('colorizer').setup()

  -- vim.o.background = "light"
  vim.o.background = "dark"
  vim.cmd('colorscheme gruvbox')
  vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
