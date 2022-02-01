vim.cmd [[
set clipboard+=unnamedplus

function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction

" function! ClipboardPaste()
"  let @@ = system('xclip -o -selection clipboard')
"endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
xnoremap <silent> y y:call ClipboardYank()<cr>
" vnoremap <silent> d d:call ClipboardYank()<cr>
" nnoremap <silent> p :call ClipboardPaste()<cr>
]]
