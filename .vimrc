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

" Use the dark version of Solarized
set background=dark
colorscheme solarized

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

" Default params for ack
let g:ackprg="ack -H --nocolor --nogroup --column"

" Add a mark and search
nmap <leader>j mA:Ack<space>

" Add a mark and search for the word under the cursor
nmap <leader>ja mA:Ack "<C-r>=expand("<cword>")<cr>"
nmap <leader>jA mA:Ack "<C-r>=expand("<cWORD>")<cr>"

" 2 space tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Ctrl-P fuzzy search
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Default ignores in fuzzy search
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Special bullshit for js
function! SyntasticESlintChecker()
  let l:npm_bin = ''
  let l:eslint = 'eslint'

  if executable('npm')
      let l:npm_bin = split(system('npm bin'), '\n')[0]
  endif

  if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
    let l:eslint = l:npm_bin . '/eslint'
  endif

  let b:syntastic_javascript_eslint_exec = l:eslint
endfunction


let g:syntastic_javascript_checkers = ["eslint"]

autocmd FileType javascript :call SyntasticESlintChecker()

" Special non-bullshit for go
" Use goimports for formatting
let g:go_fmt_command = "goimports"

" Turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>

