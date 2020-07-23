" ==================================================================================================
" General settings
" ==================================================================================================

syntax on                                   " syntax highlighting
filetype plugin indent on                   " recognise filetype and load plugins and indent files

let mapleader = "\<Space>"

" interface
set path+=**                                " search down into subfolders / tab-completion for file-related tasks
set go+=m                                   " easier mouse mode for gVim
set background=dark                         " tell vim what the background color looks like
set laststatus=2                            " enable airline on open
set noshowmode                              " don't show mode as airline already does
set number                                  " show line numbers
set ruler                                   " show current position at bottom
set showcmd                                 " show any commands
set sidescroll=1                            " smoother horizontal scrolling
set splitbelow                              " create new splits below
set splitright                              " create new splits to the right
set wildmenu                                " enable wildmenu
set wildmode=longest:full,full              " configure wildmenu
set lazyredraw                              " don't draw everything
set hidden                                  " don't unload buffer if abandoned
set scrolloff=999                           " always center cursor where possible
set timeout timeoutlen=400 ttimeoutlen=450  " set quick timeouts

" whitespace
set expandtab                               " use tabs instead of spaces
set nojoinspaces                            " use one space, not two, after punctuation
set shiftround                              " shift to next tabstop
set shiftwidth=2                            " amount of space used for indentation
set softtabstop=2                           " appearance of tabs
set tabstop=2                               " use two spaces for tabs

" text appearance
set nowrap                                  " disable line wrapping
set showmatch                               " show opening and closing character matches

" interaction
set backspace=2                             " make backspace work like most other apps
set mouse=a                                 " enable mouse support

" searching
set incsearch                               " highlight search matches
set ignorecase                              " set case insensitive searching
set smartcase                               " case sensitive searching when not all lowercase

" background processes
set autoread                                " update file when changed outside of vim
set smartindent                             " automatically insert one extra level of indentation
set history=200                             " store last 200 commands as history
set ttyfast                                 " indicates a fast terminal connection

" ==================================================================================================
" Runtime Paths
" ==================================================================================================

set runtimepath+=$HOME\\.vim\\
set viminfo+=n"$HOME\\.vim\\viminfo\\"
set packpath=$HOME\\.vim\\

" ==================================================================================================
" Plugins and Plugin Options
" ==================================================================================================

" vim-plug
call plug#begin('~/.vim/plugged')
  Plug 'terryma/vim-multiple-cursors'
  Plug 'mcchrish/nnn.vim'
  Plug 'tommcdo/vim-lion'
  Plug 'mbbill/undotree'
  Plug 'roman/golden-ratio'
  Plug 'jeetsukumaran/vim-buffergator'
  Plug 'ryanoasis/vim-devicons'
call plug#end()

" gruvbox
colorscheme gruvbox
let g:gruvbox_italic     = 1
let g:gruvbox_termcolors = 256

" nnn
let g:nnn#set_default_mappings = 0
let g:nnn#layout               = {'left': '~20%'}
let g:nnn#action               = {'<S-l>': 'vsplit'}
nnoremap <Leader>n :NnnPicker '%:p:h'<CR>

" vim-lion (easyalign)
let g:lion_squeeze_spaces = 1
vnoremap = :'<,'>norm glip=<CR>

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping = 1
let g:multi_cursor_quit_key            = '<Esc>'

" ==================================================================================================
" Custom Key Bindings
" ==================================================================================================

inoremap jk <ESC>
nnoremap n :norm! nzzzv<CR>
nnoremap N :norm! Nzzzv<CR>
nnoremap H ^
nnoremap L $
nnoremap <Return> o<ESC>
nnoremap <Leader>w :up<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>qq :qall!<CR>
nnoremap <Leader>k dd
nnoremap <Leader>d :t.<CR>
nnoremap <Leader>z z=
nnoremap <Leader>af ggVG
nnoremap <Leader>pwd :pwd<CR>
nnoremap <C-Tab> >>
nnoremap <C-S-Tab> <<
nnoremap <Leader>, :noh<CR>
nnoremap <Space><Space> :%s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap J <PageDown>
nnoremap K <PageUp>
nnoremap <C-J> :join<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap <Leader>ix :w !curl -F "f:1=<-" ix.io<CR>

" fix copy and paste
noremap y "+y
noremap p "+p
vnoremap y "+y
vnoremap p "+p

" custom keys / functions
nnoremap <F5> :NnnPicker<CR>
nnoremap <F6> :UndotreeToggle<CR>
nnoremap <F7> :BuffergatorToggle<CR>
nnoremap <F8> :CheckSyntax<CR>
nnoremap <F9> 1G=G<CR>
nnoremap <F10> :set rnu! rnu?<CR>

" window splits
" the following two lines enable _ to open a horizontal split
" and | to open a vertical split
nnoremap <expr><silent> \| !v:count ? "<C-W>v<C-W><Right>" : '\|'
nnoremap <expr><silent> _ !v:count ? "<C-W>s<C-W><Down>"  : '_'
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" ==================================================================================================
" Custom Functions and Options
" ==================================================================================================

" autocmd
augroup StartupGroup
  autocmd!
  autocmd VimEnter * set rnu
  autocmd VimEnter * set autochdir
  autocmd ColorScheme * highlight Comment cterm=italic
  autocmd InsertEnter * let updaterestore=&updatetime | set updatetime=4000
  autocmd InsertLeave * let &updatetime=updaterestore
  autocmd CursorHoldI * stopinsert
augroup END

" Macro for Visual Range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Paste from register
function! Reg()
  reg
  echo "Register: "
  let char = nr2char(getchar())
  if char != "\<Esc>"
    execute "normal! \"".char."p"
  endif
  redraw
endfunction

command! -nargs=0 Reg call Reg()

" folding
set foldmethod=manual
inoremap <F9> <C-O>za
nnoremap <F9> za
xnoremap <F9> zf
