set encoding=utf8

" -- UI --
syntax enable
set showcmd                             " show command in bottom bar
set number                              " show line numbers
set relativenumber                      " line numbers relative to cursor
set showmatch                           " hightlight matching {[()]} "
set background=dark                     " dark background
set laststatus=2                        " status line always on
set nowrap                              " disables wrapping to new line

" -- Spaces and Tabs -- 
set tabstop=4                           " number of visual spaces per tab
set softtabstop=4                       " number of spaces in tab when editing
set expandtab                           " tabs are spaces
set autoindent
set backspace=indent,eol,start

" -- Search --
set hlsearch                            " highlight matches
set incsearch                           " search as characters are entered
set ignorecase
set smartcase

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
call vundle#end()
filetype plugin indent on

colorscheme delek                       " set colorscheme

" -- Custom Key-Bindings
set pastetoggle=<f3>                    " f3 to toggle paste mode
map <C-n> :NERDTreeToggle<CR>           " control-n to toggle NERDTree

