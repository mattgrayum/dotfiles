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
set number relativenumber
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

" Snippets
"
" Opens new line below cursor and starts console.log statement
" Type the name of the variable you want to console log and then press 
" Ctrl + l to finish the console.log statement.
nnoremap cl oconsole.log(');<Left><Left>
inoremap <C-l> ', <ESC>2<LEFT>yi'f p
"
" Copies the variable under the cursor and creates a console log statement for
" that variable on the line below.
nnoremap clc yiwoconsole.log('<ESC>pa', <ESC>pa);<ESC>
"
" Starts an if statement block
nnoremap <leader>if iif () {<Enter><Enter>}<Esc>?)<Enter>i
"
" Enters a block from above
inoremap <C-e> <Esc>ji  
"
" Starts an if-else statment block
nnoremap <leader>ie iif () {<Enter><Enter>} else {<Enter><Enter>}<Esc>?)<Enter>i
"
" BizMod React Class Component - type the class name at the top of the file,
" escape out of normal mode, and then hit <leader>rc
nnoremap <leader>rc ciwimport * as React from 'react';<Enter>import { inject, observer } from 'mobx-react';<Enter>import * as reactCssModules from 'react-css-modules';<Enter>import * as styles from './styles.scss';<Enter>import { Store } from 'store';<Enter><Enter>@inject('store')<Enter>@observer<Enter>@reactCssModules(styles)<Enter>export class <Esc>pa extends React.Component<{ store?: Store }> {<Enter>  render() {<Enter><Enter>  return (<Enter><Enter>);<Enter><Esc>0i}<Enter><Esc>3ki      
"
" Make BizMod note title
inoremap <Leader>bnt <ESC>diwi# [BIZ-<ESC>pa](https://califabcit.atlassian.net/browse/BIZ-<ESC>pa)<CR><CR>

" Yank to and put from the system clipboard more easily
nnoremap <C-v> "+p

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
"execute 'set <A-j>=\ej'
"execute 'set <A-k>=\ek'
nnoremap <C-j> m`o<ESC>``
nnoremap <C-k> m`O<ESC>``

" Buffer navigation
nnoremap <Leader>h :bprevious<CR>
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>k :bfirst<CR>
nnoremap <Leader>j :blast<CR>
nnoremap <C-z> :ls<CR>:b<Space>

" NERDTreeToggle
nmap <F5> :NERDTreeToggle<CR>

" Ignore node_modules
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

