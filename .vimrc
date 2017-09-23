set nocompatible              " be iMproved, required
set nomodeline
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Bundle 'djoshea/vim-autoread'
Bundle 'scrooloose/syntastic'    
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'itchyny/lightline.vim'

" " Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-j>"

" Allow to use enter to trigger Utilsnips expansion
 let g:UltiSnipsExpandTrigger = "<nop>"
 inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
 let g:UltiSnipsJumpForwardTrigger="<tab>"
 let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_always_populate_location_list = 1
set completeopt=longest,menu

"Indenting stuff

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Colors for YouCompleteMe

highlight YcmWarningLine guibg=#FFFF69
highlight YcmWarningSign guibg=#FFFF69
highlight YcmWarningSection guibg=#FFFF69

" Shortcut for movie in split screen

nnoremap <C-J> <C-W><C-J> "Ctrl-j to move down a split  
nnoremap <C-K> <C-W><C-K> "Ctrl-k to move up a split  
nnoremap <C-L> <C-W><C-L> "Ctrl-l to move    right a split  
nnoremap <C-H> <C-W><C-H> "Ctrl-h to move left a split 


" Colorscheme choice

set background=dark
set t_Co=256
colorscheme molokai

set number
set laststatus=2
highlight LineNr ctermfg=grey ctermbg=none

set rnu
"set hlsearch
set timeoutlen=1000 ttimeoutlen=0

" new line but stays in normal mode 
nnoremap <S-CR> O<Esc>
nnoremap <S-B> O<Esc>
nmap <CR> o<Esc>

" Maximize GVim on start
if has("gui_running")
  set lines=999 columns=999
endif

" On exit save clipboard register
autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel -ib")

" Disable arrow key
nnoremap <Left> <Esc>
nnoremap <Right> <Esc>
nnoremap <Up> <Esc>
nnoremap <Down> <Esc>
nnoremap <PageUp> <Esc>
nnoremap <PageDown> <Esc>

inoremap <Left> <Esc>
inoremap <Right> <Esc>
inoremap <Up> <Esc>
inoremap <Down> <Esc>
inoremap <PageUp> <Esc>
inoremap <PageDown> <Esc>

vnoremap <Left> <Esc>
vnoremap <Right> <Esc>
vnoremap <Up> <Esc>
vnoremap <Down> <Esc>
vnoremap <PageUp> <Esc>
vnoremap <PageDown> <Esc>

"Various remaping

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <F9> <C-]>

"Remap Ctrl-C to escape in order to keep abbreviations

inoremap <C-c> <Esc><Esc>

"Make Alt key work
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

execute pathogen#infect()

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_python_python_exec = 'python3'
"let g:syntastic_c_compiler_options = "-std=c99 -Wall -Wextra -Wpedantic"
let g:syntastic_debug = 0
let b:syntastic_mode="passive"
nnoremap <F7> :SyntasticCheck<CR> :lopen<CR>
nnoremap <F8> :lclose<CR> :SyntasticReset<CR>

" Go to declaration in a new tab
nnoremap <expr> <F12> ":tab stjump " . expand("<cword>") . "<CR>"
set selection=inclusive

let g:ycm_show_diagnostics_ui = 0

let g:EclimCompletionMethod = 'omnifunc' 
set guifont=Monospace\ 13

"Autoread configuration
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! w

let g:EclimCValidate = 0
let g:EclimCppValidate = 0

"Assembly parameters for syntastic
let g:syntastic_asm_compiler="gcc"
let g:syntastic_asm_dialect="intel"
let g:syntastic_debug = 0

"==========Plugin shortcuts==========
"
"tagbar
nmap <F2> :TagbarToggle<CR>


"-----------------------C - C++--------------------
"https://github.com/Valloric/YouCompleteMe
"./install.sh --clang-completer
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_confs/c/.ycm_extra_conf.py"

" Do not uncomment for large tag files
" let g:ycm_collect_identifiers_from_tags_files = 1 
let g:ycm_show_diagnostics_ui = 0

nnoremap <F5> :YcmCompleter GoToDefinition<CR>
nnoremap <F6> :YcmCompleter GoToDeclaration<CR>

"lightline
let g:lightline = {
	  \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch','readonly', 'absolutepath', 'modified', 'charvaluehex' ] ]
      \ },
	  \ 'component_function': {
	  \   'gitbranch': 'fugitive#head'
	  \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }
