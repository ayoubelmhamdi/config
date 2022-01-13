local M = {}
-- local line = vim.fn.line
-- local exp = vim.fn.expand

function M.post(rename_old, winnr)
    local new = vim.api.nvim_get_current_line()
    vim.api.nvim_win_close(winnr, true)
    vim.lsp.buf.rename(vim.trim(new))
    print(rename_old..' -> '..new)
    vim.cmd [[stopinsert!]]
end

function M.rename()
    local rename_old = vim.fn.expand('<cword>')
    local noice_buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(
    noice_buf, true,
    {
        relative='cursor',
        row=1, col=1,
        width=30, height=1,
        style='minimal', border='single',
    })
    vim.cmd [[startinsert]]
    vim.api.nvim_buf_set_keymap( noice_buf, 'i', '<CR>',
    '<cmd>lua require("static.rename").post("'..rename_old..','..win..'")<CR>', {noremap=true, silent=true})
    vim.api.nvim_buf_set_keymap( noice_buf, 'n', 'q', '<cmd>bd<CR>', {noremap=true, silent=true})
    vim.api.nvim_buf_set_keymap( noice_buf, 'n', '<CR>', '<cmd>bd<CR>', {noremap=true, silent=true})
end

return M
