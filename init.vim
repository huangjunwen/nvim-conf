
" neovim required.
if !has('nvim')
  echoerr "neovim required"
  exit
end

" Enable python3
let g:python3_host_prog = '/usr/local/bin/python3'

" set <Leader>
let mapleader = ' '

" Minimalist Vim Plugin Manager
call plug#begin('~/.config/nvim/plugged')

""""""""""""""""""""""""""
" Defaults
""""""""""""""""""""""""""
" Little less sensible yet great vim defaults
Plug 'sheerun/vimrc'


""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""
" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
let g:lightline.separator = {
      \ 'left': '',
      \ 'right': '',
      \ }
let g:lightline.subseparator = {
      \ 'left': '',
      \ 'right': '',
      \ }

" The fancy start screen for Vim
Plug 'mhinz/vim-startify'

""""""""""""""""""""""""""
" Edit
""""""""""""""""""""""""""
" Vim plugin, insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'


""""""""""""""""""""""""""
" Language 
""""""""""""""""""""""""""
" A solid language pack for Vim
Plug 'sheerun/vim-polyglot'

call plug#end()


" sheerun/vimrc includes this
colorscheme wombat256mod

