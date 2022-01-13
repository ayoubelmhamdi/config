-- to make snippet change whe add any char
-- know i'm disable because TextChangedI make text write randomly on screen
-- require'luasnip'.config.setup({updateevents="TextChangedI" })
-- to load vs code snippet
-- must loaded after luasnip call snippet
vim.cmd('set rtp+=/projects/lua/friendly-snippets')
require('luasnip.loaders.from_vscode').load()
-- snippets/flutter.json

vim.cmd([[
        autocmd BufWritePost *.json lua require("luasnip").snippets={}
        autocmd BufWritePost *.json lua require("luasnip.loaders.from_vscode").load()
]])
--
-- Set completeopt to have a better completion experience
-- tis some visiter
--
-- vim.o.completeopt = "menu,menuone,noselect"
vim.o.completeopt = 'menuone,noselect'

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
-- luasnip setup
local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_status_ok then return end

-- nvim-cmp setup
local smp_status_ok, cmp = pcall(require, 'cmp')
if not smp_status_ok then return end
cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {behavior = cmp.ConfirmBehavior.Replace, select = true},
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"})
    },
    sources = {
        {name = 'path'}, {name = 'luasnip'}, {name = 'nvim_diagnostic'}, {name = 'cmp_tabnine'}, {name = 'treesitter'}, {name = 'buffer'}
        -- { name = 'nvim_lua', keyword_lengh=1 },
        -- { name = 'look' , keyword_lengh=0 },
        -- { name = 'spell' },
        -- { name = 'nuspell' },
        -- { name = "user_dictionary" },
        -- { name = "latex_symbols" },
        -- { name = 'emoji' },

    },
    formatting = {
        -- fields = {"kind", "abbr", "menu"},
        fields = {"kind", "abbr"},
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            -- vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " "
            -- set a name for each source
            vim_item.menu = ({
                buffer = "[Buffer]",
                calc = "[Calc]",
                cmp_tabnine = "[TabNine]",
                emoji = "[Emoji]",
                latex_symbols = " [Latex_symbols]",
                look = "[Look]",
                luasnip = " [Luasnip]",
                nuspell = " [Nuspell]",
                nvim_diagnostic = "[LSP]",
                nvim_lua = "[Lua]",
                path = "[Path]",
                spell = "[Spell]",
                treesitter = " [Treesitter]",
                user_dictionary = " [User_dictionary]"

            })[entry.source.name]
            return vim_item
        end
    },
    experimenal = {ghost_text = true, native_menu = false}
}
