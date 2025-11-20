" Plugins {{{
" Enable vim-plug
call plug#begin()

" Install Plugins
Plug 'tpope/vim-sensible'
Plug 'rose-pine/neovim'
"Plug 'rose-pine/vim'
Plug 'nordtheme/vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'fladson/vim-kitty'
Plug 'ap/vim-css-color'
Plug 'elkowar/yuck.vim'
call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" }}}

" General Interface {{{
" Colors: https://www.ditig.com/256-colors-cheat-sheet
colorscheme rose-pine
hi 	Normal 		guibg=NONE
"hi 	NonText		guibg=NONE
"hi 	Normal 		ctermbg=NONE
"hi 	Normal 		ctermbg=NONE
"hi 	CursorLine	term=NONE	cterm=NONE	ctermbg=234	ctermfg=NONE
"hi 	LineNr		term=NONE	cterm=NONE	ctermbg=236
hi 	CursorLineNr	term=bold	cterm=bold	ctermbg=235	ctermfg=012
set 	cursorline
set 	relativenumber
set 	nu
syntax	on
set	foldmethod=marker
" Line breaks on space
set nolist wrap linebreak breakat&vim
"setlocal spell spelllang=en_us
" }}}

" Status Line {{{
" Too good for plugins
set laststatus=2
set statusline=
set statusline+=%{StatuslineMode()}
set statusline+=\ 
set statusline+=%F
set statusline+=\ 
set statusline+=\ 
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
    return "NORMAL "
  elseif l:mode==?"v"
    return "VISUAL "
  elseif l:mode==#"i"
    return "INSERT "
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT "
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL  "
  endif
endfunction
" }}}

" Usage {{{
set 	clipboard=unnamedplus
set 	undofile
" }}}

" Keybinds {{{
" 	Dvorak Movement (& shifted to the home keys)
nnoremap h h
nnoremap t j
nnoremap n k
nnoremap s l
" 	Dvorak Rebind Fixes
nnoremap k n
" }}}

" vim:ft=vim:foldmethod=marker
