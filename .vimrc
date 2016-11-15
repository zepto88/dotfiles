map <F2> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
set ignorecase
set ruler
set shiftwidth=4
set expandtab
set tabstop=4
set scrolloff=5
set guioptions-=r
set guioptions-=L
set go-=T
set autoindent
colorscheme pablo
hi clear
hi Bang ctermbg=red guibg=red
match Bang /\%>79v.*\%<81v/
set hlsearch
syntax on
set list
set listchars=trail:.
hi ExtraWhitespace ctermbg=lightblue guibg=lightblue ctermfg=black
2match ExtraWhitespace /\s\+$/
