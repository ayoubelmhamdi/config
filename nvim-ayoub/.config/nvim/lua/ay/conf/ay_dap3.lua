local dap = require("dap")
local api = vim.api

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/.local/bin/nodeDebug.js'},
}

dap.configurations.javascript = {
  {
    name = "Run",
    type = 'node2',
    request = 'launch',
    program = '${workspaceFolder}/${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    name = "Attach",
    type = 'node2',
    request = 'attach',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = {'<node_internals>/**/*.js'},
  },
}

dap.configurations.typescript = dap.configurations.javascript

dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "Run",
    metals = {
      runType = "run",
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test File",
    metals = {
      runType = "testFIle",
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}


dap.adapters.cpp = {
  type = 'executable',
  command = 'lldb-vscode',
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
  },
  name = "lldb"
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "cpp",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    env = function()
      local variables = {}
      for k, v in pairs(vim.fn.environ()) do
        table.insert(variables, string.format("%s=%s", k, v))
      end
      return variables
    end,
    stopOnEntry = false,
    args = {}
  },
}

dap.adapters.c = dap.adapters.cpp
dap.configurations.c = dap.configurations.cpp
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

-- Mappings.
local keymap = api.nvim_set_keymap
local opts = { noremap=true, silent=true }

keymap('n', '<leader>dh', ':lua require"dap".toggle_breakpoint()<CR>', opts)
keymap('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap('n', '<c-k>', ':lua require"dap".step_out()<CR>', opts)
keymap('n', '<c-l>', ':lua require"dap".step_into()<CR>', opts)
keymap('n', '<c-j>', ':lua require"dap".step_over()<CR>', opts)
keymap('n', '<c-h>', ':lua require"dap".continue()<CR>', opts)
keymap('n', '<leader>dk', ':lua require"dap".up()<CR>', opts)
keymap('n', '<leader>dj', ':lua require"dap".down()<CR>', opts)
keymap('n', '<leader>dd', ':lua require"dap".disconnect({ terminateDebuggee = true });require"dap".close()<CR>', opts)
keymap('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l', opts)
keymap('n', '<leader>di', ':lua require"dap.ui.variables".visual_hover()<CR>', opts)
keymap('n', '<leader>d?', ':lua require"dap.ui.variables".scopes()<CR>', opts)
keymap('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>', opts)

-- Map K to hover while session is active.
local keymap_restore = {}
dap.listeners.after['event_initialized']['me'] = function()
  for _, buf in pairs(api.nvim_list_bufs()) do
    local keymaps = api.nvim_buf_get_keymap(buf, 'n')
    for _, keymapp in pairs(keymaps) do
      if keymapp.lhs == "K" then
        table.insert(keymap_restore, keymapp)
        api.nvim_buf_del_keymap(buf, 'n', 'K')
      end
    end
  end
  api.nvim_set_keymap(
    'n', 'K', '<Cmd>lua require("dap.ui.variables").hover()<CR>', { silent = true })
end

dap.listeners.after['event_terminated']['me'] = function()
  for _, keymapp in pairs(keymap_restore) do
    api.nvim_buf_set_keymap(
      keymapp.buffer,
      keymapp.mode,
      keymapp.lhs,
      keymapp.rhs,
      { silent = keymapp.silent == 1 }
    )
  end
  keymap_restore = {}
end
  require('dap.ext.vscode').load_launchjs()
-- require("nvim-dap-virtual-text").setup()

-- nvim-dap-ui
require("dapui").setup()
keymap('n', '<leader>du', '<cmd>lua require"dapui".toggle()<CR>', opts)

-- telescope-dap
keymap('n', '<leader>dc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', opts)
keymap('n', '<leader>db', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', opts)
keymap('n', '<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', opts)
keymap('n', '<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', opts)
