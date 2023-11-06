set nocompatible
syntax on

so ~/.vim/plugins.vim

" Disable the default Vim startup message
set shortmess+=I

" Make backspace behave like other editor
set backspace=indent,eol,start
let mapleader=","

" show line numbers
set number
set relativenumber

" show the status line at the bottom, even if you only have one window open
set laststatus=2				

" set tabs using spaces instead
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4

set nowrap

"------------Visual------------"
colorscheme atom-dark-256

"------------Search------------"
set hlsearch
set incsearch


"------------Mappings------------"
"Make it easy to edit the Vimrc file
nmap <Leader>ev :tabedit ~/.vimrc<cr>

"Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>
nmap <c-T> :CtrlPBufTag<cr>
nmap <c-E> :CtrlPMRUFiles<cr>
imap jj <ESC>


"------------Plugins------------"
"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_max_files=0
let g:cltrp_max_depth=40

"/
"/ Greplace.vim
"/
set grepprg=ag                                      " We want to use Ag for search
let g:grep_cmd_opts = '--line-numbers --noheading'

"------------Laravel-Specific------------"
nmap <Leader>lr :e routes/web.php<cr>

"------------Auto-Commands------------"
" Auto source the Vimrc file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

set tags=./tags,tags;
" Notes and Tips
" - Press 'zz' to instantly center the line where the cursor is located
" - Press 'c-]' to quickly go to where the method was definded using Ctags
" - Press 'c-^' to go back to the previous edit location
