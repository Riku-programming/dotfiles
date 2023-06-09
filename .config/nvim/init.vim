set shell=/bin/zsh
set shiftwidth=4
set tabstop=4
set expandtab
set textwidth=0
set autoindent
set hlsearch
set clipboard=unnamed
set splitright
set number
syntax match markdownLineBreak /\s\s$/ conceal cchar=↵
syntax on

let mapleader="\<Space>"

call plug#begin()
Plug 'ntk148v/vim-horizon'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-commentary'
Plug 'skanehira/preview-markdown.vim'
Plug 'plasticboy/vim-markdown'
Plug 'previm/previm'
Plug 'ekickx/clipboard-image.nvim'
call plug#end()
let g:gitgutter_highlight_lines = 1

"terrfarom settings
let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_fmt_on_save=1
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" if you don't set this option, this color might not correct
set termguicolors

colorscheme horizon

" lightline
let g:lightline = {}
let g:lightline.colorscheme = 'horizon'

" fzf
let g:fzf_command_prefix = 'Fzf'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" markdown_preview
let g:preview_markdown_parser = 'glow'
let g:preview_markdown_auto_update = 1
let g:preview_markdown_vertical = 1
nnoremap <Leader>md :PreviewMarkdown<CR>

" previm
let g:vim_markdown_folding_disabled = 1
let g:previm_enable_realtime = 1
let g:previm_open_cmd = 'open -a Google\ Chrome'
nmap <C-s> :<C-u>PrevimOpen<CR>

" select All
nnoremap <Leader>a ggVG

"coc-markmap
nmap <Leader>m <Plug>(coc-markmap-create)
