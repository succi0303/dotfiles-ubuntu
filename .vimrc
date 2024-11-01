" vim-plug
call plug#begin('~/.vim/autoload/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'cohama/lexima.vim'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'previm/previm'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'

call plug#end()

" Basic settings
set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8
set backspace=indent,eol,start
set hidden
set showcmd
set showmatch
set cursorline
set number
set wrap
set laststatus=2
set incsearch
set display+=lastline
set wildmenu
set ignorecase
set clipboard=unnamed
set wildmode=list,full
set nobackup
set noswapfile
set nowritebackup
nnoremap <ESC><ESC> :nohlsearch<CR>

" Indent settings
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab
set smarttab
set autoindent
set smartindent
augroup fileTypeIndent
  autocmd!
  autocmd!
  autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.yml,*.yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BUfNewFile,BufRead *.template,*.template.yml,*.cfn.yaml,*.cfn.yml setlocal ft=cloudformation.yaml
augroup END

" Window settings
nnoremap s <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sq :<C-u>q<CR>

" Tab settings
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT
nnoremap sQ :<C-u>tabclose<CR>

" Buffer settings
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

syntax on

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

colorscheme slate

" lightline.vim
  let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
	\ }
  " Use autocmd to force lightline update.
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" vim-easymotion
let g:EasyMotion_startofline=0
let g:EasyMotion_smartcase=1
map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
map <Leader>s <Plug>(easymotion-bd-f2)
nmap <Leader>s <Plug>(easymotion-overwin-f2)
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>n <Plug>(easymotion-linebackward)
