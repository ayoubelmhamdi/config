--  # i use ay/configfile.lua for tow reasenself:
--  ## i use / for use gf to naviget
--  ## require module must not repeted 
--  ### i can use directory or file named telecsope or cmp

-- LSP + efm
  require('ay/ls')
  require('ay/ls/efm')
  require("flutter-tools").setup{}

--------------------
--   theme   -------

--require('ay/theme/gruvbuddy')
  require('ay/theme/statusline')
  require('ay/theme/blankline')
  require('ay/theme/colorscheme') -- make in the end/to avoid ovvrided


  -- function
  require('ay/function/clip_board')
  require('ay/function/yank')
  require('ay/function/last-position')


  -- Pligin
  require('ay/conf/ay_cmp')
  require('ay/conf/autopair')
  require('ay/conf/cheatsheet')
  require('ay/conf/comment')
  require('ay/conf/globale')
  require('ay/conf/lspkind')
  require('ay/conf/packerPlugins')
  require('ay/conf/statusline')
  -- require('ay/conf/lightspeed') -- dir not removed
