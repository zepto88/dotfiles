map <F2> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
set ignorecase
set ruler
set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
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
