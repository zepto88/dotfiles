" Vundle
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-commentary'
Plugin 'chiel92/vim-autoformat'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()

" Settings
set ruler
set expandtab
set shiftwidth=2
set tabstop=2
set scrolloff=5
set go-=T
set autoindent
set path+=**
set wildmenu
set hlsearch
set t_Co=256
set nocompatible
set hidden
" set paste
syntax on
filetype plugin on

" Color settings
hi clear
colorscheme default
hi Bang ctermfg=black ctermbg=red guibg=red
match Bang /\%>79v.*\%<81v/
hi ExtraWhitespace ctermbg=lightblue guibg=lightblue ctermfg=black
2match ExtraWhitespace /\s\+$/
hi Visual cterm=NONE ctermfg=black ctermbg=172
hi Search cterm=NONE ctermfg=black ctermbg=green
hi MatchParen ctermbg=blue guibg=lightblue

" vimdiff colors
hi DiffAdd cterm=none ctermfg=NONE ctermbg=23
hi DiffChange cterm=none ctermfg=NONE ctermbg=8
hi DiffDelete cterm=none ctermfg=NONE ctermbg=95
hi DiffText cterm=none ctermfg=0 ctermbg=166
hi Folded   cterm=none ctermfg=15 ctermbg=8
hi CursorColumn ctermbg=8

" NERDTREE
map <F2> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1


" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline_symbols_ascii = 1
let g:airline_theme='badwolf'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.whitespace = 'Ξ'


set laststatus=2
set ttimeoutlen=0
set noshowmode
command Json :%!jq '.'

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_highlighting=0
let g:syntastic_enable_signs=1
highlight SyntasticErrorLine ctermbg=95
highlight SyntasticWarningLine ctermbg=95

nnoremap ge :lnext<cr>
nnoremap gE :lprev<cr>

" CtrlP
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_prompt_mappings = { 'AcceptSelection("t")': ['<cr>'] }
nnoremap <leader>o :CtrlPTag<CR>


" mappings
noremap <F8> :set number!<CR>:set relativenumber!<CR>
noremap <F4> :set cursorcolumn!<CR>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-n> :bn<cr>
nnoremap <C-p> :bp<cr>
nnoremap n nzz
nnoremap N Nzz
nnoremap <Enter> @@
nnoremap <leader>t :tabnew<space>
nnoremap <leader>f :find<space>
nnoremap <leader>b :buffers<cr>:b<space>
vnoremap // y/<C-R>"<CR>
noremap <leader>F :Autoformat<CR>

" commands
command! MakeTags !ctags -R .

" Yocto files as conf for simple syntax
augroup filetypedetect
    au BufRead,BufNewFile *.bb set filetype=sh
    au BufRead,BufNewFile *.bbappend set filetype=sh
    au BufRead,BufNewFile *.bbclass set filetype=sh
 augroup END
