local dap = require('dap')
local HOME = os.getenv('HOME')


local M = setmetatable({}, {
  __index = function(tbl, key)
    if key == 'widgets' then
      local val = require('dap.ui.widgets')
      rawset(tbl, key, val)
      return val
    end
    return dap[key]
  end,
})


function M.setup()
  dap.set_log_level('TRACE');

  dap.adapters.cppdbg = {
    type = 'executable',
    command = HOME .. '/.config/nvim/vscode/extension/debugAdapters/OpenDebugAD7',
  }
  dap.adapters.lldb = {
    type = 'executable',
    command = '/sbin/lldb-vscode',
    name = "lldb"
  }
  dap.configurations.cpp = {
    {
      name = 'Attach to gdbserver :1234',
      type = 'cppdbg',
      request = 'launch',
      MIMode = 'gdb',
      miDebuggerServerAddress = 'localhost:1234',
      miDebuggerPath = '/usr/bin/gdb',
      cwd = '${workspaceFolder}',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
    },
    {
      name = "Launch (integrated terminal)",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
      runInTerminal = true,
      },
    {
      name = "Launch",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
      runInTerminal = false,
    },
    {
      -- If you get an "Operation not permitted" error using this, try disabling YAMA:
      --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
      name = "Attach to process",
      type = 'lldb',
      request = 'attach',
      pid = require('dap.utils').pick_process,
      args = {},
    },
  }
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp

  vim.api.nvim_command("au FileType dap-repl lua require('dap.ext.autocompl').attach()")
  require('dap.ext.vscode').load_launchjs()
end

M.setup()
return M
