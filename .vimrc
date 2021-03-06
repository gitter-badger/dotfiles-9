set nocompatible              " be iMproved, required
filetype off                  " required

""" Vundle
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Plugins
Plugin 'mattn/webapi-vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'rodjek/vim-puppet'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/gist-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-ruby/vim-ruby'
" Colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'croaky/vim-colors-github'
Plugin 'sickill/vim-monokai'
Plugin 'vim-scripts/twilight256.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
""" End Vundle

" Enable syntax highlighting
syntax on
" Colorscheme
colorscheme monokai
" Add line numbers
set number
set ruler
" Set encoding
set encoding=utf-8
" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,trail:·
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" Disable automatic comment insertion in general
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Start searching when you type the first character of the search string
set incsearch
" Any search highlights the string matched by the search.
set hlsearch
" Map Ctrl+l to clear highlighted searches
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" Disable code folding
set nofoldenable
" Directories for swp files
set backupdir=~/.vimbackup
set directory=~/.vimbackup
" Make uses real tabs
au FileType make set noexpandtab
" Erlang uses 4 spaces
au FileType erlang set softtabstop=4 tabstop=4 shiftwidth=4
" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
" Add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript
au BufRead,BufNewFile *.txt call s:setupWrapping()
" Make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" Ruby completion vim-ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Ctrp custom ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.eunit$',
  \ 'file': '\.exe$\|\.so$\|\.dll\|\.beam$\|\.DS_Store$'
  \ }

" GIST Open Browser after Gist
let g:gist_open_browser_after_post = 1

" Gitgutter enabale realtime
let g:gitgutter_realtime = 1

" Disable folding for markdown
let g:vim_markdown_folding_disabled = 1

" SYNTASTIC
let g:syntastic_check_on_open=1
"let g:syntastic_enable_signs=1
"let g:syntastic_auto_jump=1
"let g:syntastic_auto_loc_list=1
"let g:syntastic_enable_highlighting=1
"let g:syntastic_echo_current_error=1

