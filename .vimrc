set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

"Valloric YouCompleteMe Plugin
Plugin 'Valloric/YouCompleteMe'

" Add a whole bunch of colorschemes
Plugin 'flazz/vim-colorschemes'

" A fuzzy file finder
Plugin 'ctrlp.vim'

" A better file tree viewer
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" List open buffers
Plugin 'jlanzarotta/bufexplorer'

" Make the status line nicer
Plugin 'vim-airline/vim-airline'

" Make moving around a bit better
Plugin 'EasyMotion'

" Syntax Checking
Plugin 'Syntastic'
Plugin 'trailing-whitespace'

" Brackets, quotes, etc. completion
Plugin 'surround.vim'

" Tags for goto definition
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'

" Add git support
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

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

set nobackup
set backspace=indent,eol,start
set ruler
set nowritebackup
set mouse=a
 colorscheme inkpot
syntax on
set t_Co=256
set tabstop=4
set shiftwidth=4
set expandtab
set number
set showcmd

set hidden

set noautoindent
filetype plugin indent off

if has("gui_running")
  let do_syntax_sel_menu = 1|runtime! synmenu.vim|aunmenu &Syntax.&Show\ filetypes\ in\ menu
endif

function InsertTabWrapper()
 let col = col('.') - 1
 if !col || getline('.')[col - 1] !~ '\k'
   return "\<tab>"
 else
   return "\<c-p>"
 endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<CR>

" turn on the airline status bar
set laststatus=2

" Map a command to NERDTree
map <C-n> :NERDTree<CR>

" Clear sign column for syntastic
hi clear SignColumn
augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END

" Tagfile settings
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
map <C-b> :TagbarToggle<CR>

let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_extra_conf_globlist = ['!~/Downloads/*', '~/*', '!/*']
