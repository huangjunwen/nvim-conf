
" neovim required.
if !has('nvim')
  echoerr "neovim required"
  exit
end

" Enable python3
let g:python3_host_prog = '/usr/local/bin/python3'

" set <Leader>
let mapleader = ' '

""""""""""""""""""""""""""
" Plug start 
""""""""""""""""""""""""""
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

" Language Server Protocol (LSP) support for vim and neovim
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

" Slim, Fast and Hackable Completion Framework for Neovim (depends on nvim-yarp)
Plug 'ncm2/ncm2'

" Yet Another Remote Plugin Framework for Neovim
Plug 'roxma/nvim-yarp'

""""""""""""""""""""""""""
" GPG
""""""""""""""""""""""""""

" This script implements transparent editing of gpg encrypted files.
Plug 'jamessan/vim-gnupg'

""""""""""""""""""""""""""
" Plug end
""""""""""""""""""""""""""
call plug#end()

""""""""""""""""""""""""""
" lightline configure
""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""
" LanguageClient-neovim configure
""""""""""""""""""""""""""""""""""
" Init language servers
let g:LanguageClient_serverCommands = {}

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <c-]> :call jumpstack#Push()<CR>:call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <c-t> :call jumpstack#Pop()<CR>

""""""""""""""""""""""""""
" ncm2 configure
""""""""""""""""""""""""""
" Enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

""""""""""""""""""""""""""
" Theme
""""""""""""""""""""""""""
" sheerun/vimrc includes this
colorscheme wombat256mod

""""""""""""""""""""""""""
" Golang
""""""""""""""""""""""""""
" Start a global bingo golang lsp server if not exists
" call jobstart("nc -z 127.0.0.1 4389 || bingo -mode tcp -addr :4389 -format-tool gofmt -freeosmemory 10", {'detach': 1})
" let g:LanguageClient_serverCommands.go = ['tcp://127.0.0.1:4389']

" Add golang server
"let g:LanguageClient_serverCommands.go = ['go-langserver', '-format-tool', 'gofmt', '-gocodecompletion']
let g:LanguageClient_serverCommands.go = ['bingo', '-format-tool', 'gofmt', '-freeosmemory', '10']
" https://github.com/autozimu/LanguageClient-neovim/pull/706
au BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
