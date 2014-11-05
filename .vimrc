set nobackup
set backspace=indent,eol,start
set ruler
set nowritebackup
set mouse=a
colorscheme vividchalk
syntax on
set t_Co=256
set tabstop=4
set shiftwidth=4
set expandtab

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
