set nocompatible
syntax on
filetype plugin indent on

" Automatically indent when adding a curly bracket, etc.
set smartindent

" Use UTF-8
set encoding=utf-8

set t_Co=256

colorscheme candycode

set incsearch  " Search as you type
set ignorecase 

set autoread                  " watch for file changes
set lazyredraw                " don't redraw when don't have to
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set showfulltag               " show full completion tags
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal

" this makes the mouse paste a block of text without formatting it
" (good for code)
map <MouseMiddle> <esc>"*p

" vimclojure
let maplocalleader = " "
let vimclojure#WantNailgun = 1

" Save as sudo with :W
command W silent w !sudo tee % > /dev/null

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
set viminfo^=%

" keybindings for tabs
map <LocalLeader>tc :tabnew %<cr> 
map <LocalLeader>td :tabeclose <cr>
map <LocalLeader>tn :tabnext<cr>
map <LocalLeader>tp :tabprevious<cr>

" keybindings for windows
map <F6> :vsplit<cr>
map <F7> :split<cr>




	" Clj stuff
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun=1

"folding function (clojure)
nmap <LocalLeader>ff (zf%     
   "open fold
nmap <LocalLeader>of zo

"Copy a function, util from re-run in repl
nmap <LocalLeader>cp $%v%yG$PGA

" comment block (clojure)
vmap ; :s/^/;/g<CR>

