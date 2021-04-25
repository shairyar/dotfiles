set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'ctrlpvim/ctrlp.vim'                           		" To search a file
Plugin 'scrooloose/nerdtree'                          		" To access project explorer
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'dyng/ctrlsf.vim' 			      		" To search in multiple files
Plugin 'ludovicchabant/vim-gutentags'				" To generate ctags
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'				" Theme for vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line
let g:airline_theme='simple'
set ruler                     					" show the cursor position all the time
set number                    					" Show numbers infront of each line
syntax on
map <C-n> :NERDTreeToggle<CR> 					" To open and close nerdtree Ctrl + n
set hlsearch                  					" highlight the searched word
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git' 	" Ignore these folders while searching for a file

" =============================================
" Sync NerdTree with the file thats open
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()
" End of sync NerdTree with the file thats open
" =============================================
      
