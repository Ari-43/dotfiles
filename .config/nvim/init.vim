" vim:ft=vim:foldmethod=marker

" General Interface {{{
" Colors: https://www.ditig.com/256-colors-cheat-sheet
hi 	CursorLine	term=NONE	cterm=NONE	ctermbg=234	ctermfg=NONE
hi 	LineNr		term=NONE	cterm=NONE	ctermbg=236
hi 	CursorLineNr	term=bold	cterm=bold	ctermbg=235	ctermfg=012
set 	cursorline
set 	relativenumber
set 	nu
syntax	on
set	foldmethod=marker
" }}}

" Status Line {{{
" Too good for plugins
set laststatus=2
set statusline=
set statusline+=\ 
set statusline+=%F
set statusline+=\ 
set statusline+=%{StatuslineMode()}
set statusline+=%=
set statusline+=%{strftime(\"%H:%M:%S\")}
set statusline+=%=
set statusline+=\ 
set statusline+=%r
set statusline+=\ 
set statusline+=%m
set statusline+=\ 
set statusline+=%c
set statusline+=\ 
set statusline+=%l
set statusline+=/
set statusline+=%L
set statusline+=\ 
set statusline+=%P
set statusline+=\ 

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction
" }}}

" Usage {{{
set 	clipboard=unnamedplus
" }}}

" Keybinds {{{
" 	Dvorak Movement
nnoremap h h
nnoremap t j
nnoremap n k
nnoremap s l
" 	Dvorak Rebind Fixes
nnoremap k n
" }}}
