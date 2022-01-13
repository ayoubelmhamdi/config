
local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')

cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}' -- disabled in visual mode
