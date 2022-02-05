---@diagnostic disable: unused-local
vim.g.mapleader = " "
local ay_ok, ay = pcall(require, "ay")
if not ay_ok then
  print("ay not loading")
end

local tsp_ok, tsp = pcall(require, "tsp")
if not tsp_ok then
  print("tsp not loading")
end


require('impatient')
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    sync_install = false,
    ignore_install = {"javascript"},
    highlight = {enable = true, additional_vim_regex_highlighting = false},
}

vim.cmd('source /root/.config/nvim/vimScript/init.vim')
