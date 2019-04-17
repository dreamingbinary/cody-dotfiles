" VIM Configuration - Cody Krainock
" Activate pathogen
call pathogen#infect()

" Cancel the compatibility with Vi. Essential if you want
" to enjoy the features of Vim
set nocompatible

" -- Display
set title                 " Update the title of your window or your terminal
set number                " Display line numbers
set ruler                 " Display cursor position
set wrap                  " Wrap lines when they are too long

set scrolloff=3           " Display at least 3 lines around you cursor (for scrolling)

set guioptions=T          " Enable the toolbar

" -- Search
set ignorecase            " Ignore case when searching
set smartcase             " If there is an uppercase in your search term
                          " search case sensitive again
set incsearch             " Highlight search results when typing
set hlsearch              " Highlight search results

" -- Beep
set visualbell            " Prevent Vim from beeping
set noerrorbells          " Prevent Vim from beeping

" Backspace behaves as expected
set backspace=indent,eol,start

" Hide buffer (file) instead of abandoning when switching
" to another buffer
set hidden

" Enable syntax highlighting
syntax enable

" Enable file specific behavior like syntax highlighting and indentation
filetype on
filetype plugin on
filetype indent on

" Groovy
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'

" Disabling the directional keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Set <Leader>
let mapleader = ","

" 2 space tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
let g:go_list_type = "quickfix"
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Rspec motions
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Statusline
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l/%3L,%02c%03V%)

" Line length marker
set colorcolumn=80

" FZF fuzzy finder
set rtp+=/usr/local/opt/fzf
noremap <C-p> :GFiles <CR>
noremap <C-a> :Ag <CR>

" Ctrl-l to remove highlighted stuff
nmap <Leader>x :nohl <CR>

" Allow jsx in js files
let g:jsx_ext_required = 0

" Use `.bash_profile` and aliases in shell
set shell=/bin/bash\ --rcfile\ ~/.bash_profile

" Easier split navigation
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" rspec devbox
let g:rspec_command = "!~/flexport/script/devbox.rb rspec {spec}"
