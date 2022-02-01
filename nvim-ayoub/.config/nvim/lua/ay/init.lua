--  # i use ay.configfile.lua for tow reasenself:
--  ## i use . for use gf to naviget
--  ## require module must not repeted
--  ### i can use directory or file named telecsope or cmp

-- LSP + efm
  require('ay.ls')
  require('ay.ls.ay_efm')
  require("flutter-tools").setup{}

--------------------
--   theme   -------

--require('ay.theme.ay_gruvbuddy')
  require('ay.theme.ay_statusline')
  require('ay.theme.ay_blankline')
  require('ay.theme.ay_colorscheme') -- make in the end.to avoid overrided


  -- function
  require('ay.function.ay_clip_board')
  require('ay.function.ay_yank')
  require('ay.function.ay_last-position')


  -- Plugin
  require('ay.conf.ay_cmp')
  require('ay.conf.ay_autopair')
--require('ay.conf.ay_cheatsheet')
  require('ay.conf.ay_comment')
  require('ay.conf.ay_globale')
  require('ay.conf.ay_lspkind')
  require('ay.conf.ay_packerPlugins')
  require('ay.conf.ay_statusline')
--require('ay.conf.ay_lightspeed') -- dir not removed
  -- require('ay.conf.ay_dapui')
  require('ay.conf.ay_dap4')
--require('ay.conf.ay_dap3')
--require('ay.conf.ay_lldb')
--require('ay.conf.ay_codelldb')
--require('ay.conf.ay_dapcpptools')
