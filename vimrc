set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set autochdir
set number
set tabstop=2 
set incsearch
let mapleader=","
set splitbelow
set splitright

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ervandew/supertab'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim.git'
Plugin 'airblade/vim-rooter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mileszs/ack.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-eunuch'
Plugin 'terryma/vim-multiple-cursors'
call vundle#end()


syntax enable
let g:solarized_termcolors=256
colorscheme solarized

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
"Split changing bindings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"end NERDTree
" Open files in horizontal split
nnoremap <silent> <Leader>s :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>

map!  0i#
map <Leader>v :vsplit<cr>
map <Leader>g :split<cr>
map <Leader>q :q<cr>
map <Leader>w :w<cr>
map <Leader>wq :wq<cr>
map <Leader>- :resize -2<cr>
map <Leader>= :resize +2<cr>
map <Leader>_ :vertical resize -2<cr>
map <Leader>+ :vertical resize +2<cr>
map <Leader>tn :tabnew<cr>
map <Leader>tc :tabclose<cr>

nmap <Leader>p :Files<CR>

"Автоткрытие в дереве файлов
autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif 
"обновление ctags
au BufWritePost *.js,*.rb silent! !ctags 2> /dev/null &
