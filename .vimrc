set ruler
set expandtab
set tabstop=2
set shiftwidth=2
set scrolloff=5
set go-=T
set autoindent
set path+=**
set wildmenu
set hlsearch
set t_Co=256
set hidden
syntax on
filetype plugin on

" Color settings
hi clear
set background=dark
hi Bang ctermfg=black ctermbg=red guibg=red
match Bang /\%>79v.*\%<81v/
hi ExtraWhitespace ctermbg=lightblue guibg=lightblue ctermfg=black
match ExtraWhitespace /\s\+$/
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

" STATUSLINE
set laststatus=2
set ttimeoutlen=0
set noshowmode

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" Formats the statusline
set statusline=%f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor

command Json :%!jq '.'

nnoremap ge :lnext<cr>
nnoremap gE :lprev<cr>

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

" Yocto files as conf for simple syntax
augroup filetypedetect
    au BufRead,BufNewFile *.bb set filetype=sh
    au BufRead,BufNewFile *.bbappend set filetype=sh
    au BufRead,BufNewFile *.bbclass set filetype=sh
augroup END
