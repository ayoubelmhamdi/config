local line = vim.fn.line
function last_place()
    -- if vim.api.nvim_win_is_valid(0) and vim.api.nvim_buf_is_loaded(0) then
    if vim.tbl_contains(vim.api.nvim_list_bufs(), vim.api.nvim_get_current_buf()) then
        if not vim.tbl_contains({"help", "packer", "toggleterm"}, vim.bo.ft) then
            if line [['"]] > 1 and line [['"]] <= line("$") then
                vim.cmd [[norm '"]]
            end
        end
    end
end
vim.cmd [[au BufEnter * lua last_place()]]
