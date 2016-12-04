" pathogen
call pathogen#infect()
call pathogen#helptags()

" NERDTREE
map <F2> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

" Settings
set ignorecase
set ruler
set shiftwidth=4
set expandtab
set tabstop=4
set scrolloff=5
set go-=T
set autoindent
set path+=**
set wildmenu
set hlsearch
set t_Co=256
set nocompatible
set list
set listchars=trail:.
syntax on
filetype plugin on

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline_powerline_fonts=1
let g:airline_theme='badwolf'
set laststatus=2
set ttimeoutlen=0
set noshowmode

" Color settings
hi clear
hi Bang ctermbg=red guibg=red
match Bang /\%>79v.*\%<81v/
hi ExtraWhitespace ctermbg=lightblue guibg=lightblue ctermfg=black
2match ExtraWhitespace /\s\+$/
hi Visual term=reverse cterm=reverse

" mappings
nnoremap <C-n> gt
nnoremap <C-p> gT
nnoremap n nzz
nnoremap N Nzz

" commands
command! MakeTags !ctags -R .

colorscheme default
