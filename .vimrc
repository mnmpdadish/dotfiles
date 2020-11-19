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
Plug 'derekwyatt/vim-fswitch'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'altercation/vim-colors-solarized'
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

"if &term == 'rxvt-unicode'
"" Airline theme
"let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'
""Install e.g. Powerline Source Code Pro Font
"let g:airline_powerline_fonts = 1
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"
"let g:airline#extensions#tabline#show_buffers = 0

set t_Co=256
"highlight Normal ctermbg=16
"set background=dark
"colorscheme solarized
"endif





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
      \	      '--all-scopes-completion',
      \	      '--background-index',
      \	      '--clang-tidy',
      \	      '--completion-style=bundled',
      \	      '--header-insertion=iwyu'],
      \ 'cpp': ['clangd-9',
      \	      '--all-scopes-completion',
      \	      '--background-index',
      \	      '--clang-tidy',
      \	      '--completion-style=bundled',
      \	      '--header-insertion=iwyu'],
      \ }
 
"      \       '--compile-commands-dir='.getcwd().'/build',
"      \	      '--suggest-missing-includes'],

" --- Code Completion
set omnifunc=syntaxcomplete#Complete
set completefunc=LanguageClient#complete
set wildmenu
inoremap <C-n> <C-x><C-o>
let g:LanguageClient_autoStart = 1
let g:LanguageClient_hoverPreview = 'auto'
let g:LanguageClient_diagnosticsEnable = 1
"

" --- Language Server Bindings
autocmd Syntax c,cpp,python nnoremap <buffer> <C-j> :call LanguageClient#textDocument_definition()<CR>
autocmd Syntax c,cpp,python xnoremap <buffer> <C-j> :call LanguageClient#textDocument_definition()<CR>
autocmd Syntax c,cpp,python nnoremap <buffer> <C-h> :call LanguageClient#textDocument_rename()<CR>
autocmd Syntax c,cpp,python xnoremap <buffer> <C-h> :call LanguageClient#textDocument_rename()<CR>

" --- Config for clang-format plugin
autocmd Syntax c,cpp nnoremap <buffer> == :call LanguageClient_textDocument_formatting()<CR>
autocmd Syntax c,cpp xnoremap <buffer> == :call LanguageClient_textDocument_formatting()<CR>

"set printfont=Courier\ 4
"set printfont=Luxi\ Mono\ 8
set printfont=mono:h6
set printoptions=number:y



" change window mode mappings
"noremap <leader><leader> 	<C-W>
"noremap <leader><leader>s	<C-W>s
"noremap <leader><leader>v	<C-W><C-V>
"noremap <leader><leader>x	<C-W>c
"noremap <leader><leader>c	<C-W>x

" simple scrolling through file
"nnoremap ;j 	<C-D>
"nnoremap ;k 	<C-U>
"xnoremap ;j 	<C-D>
"xnoremap ;k 	<C-U>

" set up file switch for fswitch plugin
"au! BufEnter *.cpp let b:fswitchdst = 'h' | let b:fswitchlocs = '../include'
"au! BufEnter *.h let b:fswitchdst = 'cpp' | let b:fswitchlocs = '../src'
au! BufEnter *.cpp let b:fswitchdst = 'hpp'
au! BufEnter *.hpp let b:fswitchdst = 'cpp'

nmap <silent> <C-k> :set nu!<cr>

" --- FSwitch bindings
" Switch to the file and load it into the current window >
nmap <silent> ;;of :FSHere<cr>
nmap <silent> ;;ol :FSRight<cr>
nmap <silent> ;;oL :FSSplitRight<cr>
nmap <silent> ;;oh :FSLeft<cr>
nmap <silent> ;;oH :FSSplitLeft<cr>

set makeprg=make
:command! -nargs=* Make :make -j 3 <args> | cwindow 15

autocmd Syntax c,cpp map <buffer> 'll :Make -s -C build<cr><cr><cr>
";n for next error
"nnoremap ;n	:cn<cr>
"nnoremap ;p	:cp<cr>

