"syntax on

"set ts=3

"filetype plugin on
"runtime macros/matchit.vim
"set clipboard=unnamed
"set hlsearch
"set sidescroll=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  My .VIMRC 	\O/						"
"								"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------- Load plugins ------------------------------------------{{{

call plug#begin()
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-fugitive'
"Plug 'vim-scripts/GrepCommands'
"Plug 'Latex-Box-Team/Latex-Box'
"Plug 'scrooloose/nerdcommenter'
"Plug 'chrisbra/Recover.vim'
"Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'derekwyatt/vim-fswitch'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()
"}}}
"-------------------------------------- General Settings ------------------------------------------{{{

set nowrap
syntax on			" Syntax highlighting on
filetype plugin indent on	" Indenting globally on
set shiftwidth=2		" Set indent shift
set backspace=2			" Make backspace work normally
set nomore			" Do not prompt for 'more'

" My Status Line
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2		" Always display status bar
set hidden			" Can hide changed buffers!
set number 			" Show line numbers

if &term == 'rxvt-unicode'
"" Airline theme
 let g:airline_theme='solarized'
 "let g:airline_solarized_bg='dark'
 ""Install e.g. Powerline Source Code Pro Font
 "let g:airline_powerline_fonts = 1
 "if !exists('g:airline_symbols')
 "  let g:airline_symbols = {}
 "endif
 "let g:airline_symbols.space = "\ua0"
 "let g:airline#extensions#tabline#show_buffers = 0

 set t_Co=256
 set background=dark
 colorscheme solarized
endif





" Remove all trailing whitespaces on write
"autocmd BufWritePre * %s/\s\+$//e
:command! Delwsp :%s/\s\+$//e

set wildmenu

" --- Enable highlighting of matching angle braces
autocmd Syntax c,cpp set mps+=<:>


let g:LanguageClient_diagnosticsList = "Disabled" " We do not want to populate the quickfix window
let g:LanguageClient_serverCommands = {
      \ 'python': ['pyls'],
      \ 'c': ['clangd-9',
      \       '--compile-commands-dir='.getcwd().'/build',
      \	      '--all-scopes-completion',
      \	      '--background-index',
      \	      '--clang-tidy',
      \	      '--completion-style=bundled',
      \	      '--header-insertion=iwyu',
      \	      '--suggest-missing-includes'],
      \ 'cpp': ['clangd-9',
      \       '--compile-commands-dir='.getcwd().'/build',
      \	      '--all-scopes-completion',
      \	      '--background-index',
      \	      '--clang-tidy',
      \	      '--completion-style=bundled',
      \	      '--header-insertion=iwyu',
      \	      '--suggest-missing-includes'],
      \ }

" --- Language Server Bindings
autocmd Syntax c,cpp,python nnoremap <buffer> <C-]> :call LanguageClient#textDocument_definition()<CR>
autocmd Syntax c,cpp,python xnoremap <buffer> <C-]> :call LanguageClient#textDocument_definition()<CR>
autocmd Syntax c,cpp,python nnoremap <buffer> <C-h> :call LanguageClient#textDocument_rename()<CR>
autocmd Syntax c,cpp,python xnoremap <buffer> <C-h> :call LanguageClient#textDocument_rename()<CR>



" --- Config for clang-format plugin
autocmd Syntax c,cpp nnoremap <buffer> == :call LanguageClient_textDocument_formatting()<CR>
autocmd Syntax c,cpp xnoremap <buffer> == :call LanguageClient_textDocument_formatting()<CR>


