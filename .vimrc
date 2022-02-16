set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'

call vundle#end()

filetype plugin indent on

" line number
set number

" highlght current line
"set cursorline

" show matching bracket
set showmatch

" ignore case when searching
set ignorecase
set smartcase

" set tabs
set tabstop=4
set shiftwidth=4

" Show file stats
set ruler

" YouCompleteMe stuff
let g:ycm_autoclose_preview_window_after_insertion = 1

" Color scheme (terminal)
" Important!!
if has('termguicolors')
	set termguicolors
endif
" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 0
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai


