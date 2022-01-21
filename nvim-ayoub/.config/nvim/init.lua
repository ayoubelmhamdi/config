vim.g.mapleader = " "
-- vim.cmd('set guifont="Fira Code:3"') -- ===
vim.cmd('source /root/.config/nvim/vimScript/init.vim')
-- require'nvim-treesitter.configs'.setup {
--     ensure_installed = "maintained",

--     sync_install = false,
--     highlight = {enable = true, additional_vim_regex_highlighting = false}
-- }
require('ay')
require('tsp')

require('impatient')
