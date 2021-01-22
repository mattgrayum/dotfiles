" Testing Config command
call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'jreybert/vimagit'
Plug 'junegunn/gv.vim'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'burntsushi/ripgrep'
Plug 'scrooloose/nerdtree'

cal plug#end()

command! Config execute ":vsp ~/dotfiles/.vimrc"
command! Source execute ":source $MYVIMRC"

" Misc
let mapleader = " "
set hidden
set nofoldenable
set relativenumber
inoremap jk <ESC>

" fzf commands
nmap <Leader>/ :BLines!<CR>
nmap <Leader>? :Rg!<CR>

" Color/Theme
set t_Co=256
colorscheme codedark

runtime macros/matchit.vim

" Vertical line at column 80
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Opens new line below cursor and starts console.log statement
" Type the name of the variable you want to console log and then press 
" Ctrl + l to finish the console.log statement.
nnoremap cl oconsole.log(');<Left><Left>
inoremap <C-l> ', <ESC>2<LEFT>yi'f p

" Make BizMod note title
inoremap <Leader>bnt <ESC>diwi# [BIZ-<ESC>pa](https://califabcit.atlassian.net/browse/BIZ-<ESC>pa)<CR><CR>

" Copies the variable under the cursor and creates a console log statement for
" that variable on the line below.
nnoremap clc yiwoconsole.log('<ESC>pa', <ESC>pa);<ESC>

" Yank to and put from the system clipboard more easily
nnoremap <C-v> "+p

" Wrap with if statement
vnoremap f <S-s><S-b>iif () <ESC><LEFT>i

" set list shows tab characters and shows line endings as $
nnoremap sl :set list<CR>
nnoremap nl :set nolist<CR>

" <TAB> key behavior
filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

" Add blank line above or below cursor while leaving cursor in place
execute "set <A-j>=\ej"
execute "set <A-k>=\ek"
nnoremap <A-j> m`o<ESC>``
nnoremap <A-k> m`O<ESC>``

" Buffer navigation
nnoremap <Leader>h :bprevious<CR>
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>k :bfirst<CR>
nnoremap <Leader>j :blast<CR>
nnoremap <C-z> :ls<CR>:b<Space>

" Ctrl P 
nnoremap <C-p> :CtrlP :pwd<CR>

" NERDTree
nmap <F5> :NERDTreeToggle<CR>

let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#0ee375",  
    \ "Modified"  : "#d9bf91",  
    \ "Renamed"   : "#51C9FC",  
    \ "Untracked" : "#FCE77C",  
    \ "Unmerged"  : "#FC51E6",  
    \ "Dirty"     : "#FFBD61",  
    \ "Clean"     : "#87939A",   
    \ "Ignored"   : "#808080"   
    \ }                         


let g:NERDTreeIgnore = ['^node_modules$']

" NERDCommenter
nmap // <leader>ci
vmap // <leader>ci

" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
" Update sign column every quarter second
set updatetime=250
" Gutter highlighting
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg
" Jump between hunks
nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)

" Open vimagit pane
nnoremap <leader>gs :Magit<CR>
let g:magit_default_fold_level = 0

set tags=tags;/

filetype on

