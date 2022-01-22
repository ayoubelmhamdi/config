vim.g.mapleader = " "
require('impatient')
--- vim.cmd('set guifont="Fira Code:3"') -- ===
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    sync_install = false,
    ignore_install = {"javascript"},
    highlight = {enable = true, additional_vim_regex_highlighting = false},
}
require('ay')
require('tsp')

vim.cmd('source /root/.config/nvim/vimScript/init.vim')
