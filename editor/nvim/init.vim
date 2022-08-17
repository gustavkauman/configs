set shell=/bin/zsh
let mapleader = "\<Space>"

" =======================
" Plugins
" =======================
call plug#begin()

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'
Plug 'chriskempson/base16-vim'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Autocompletion
Plug 'ncm2/ncm2'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }

" Git me some controlz
Plug 'tpope/vim-fugitive'

" Language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'craigemery/vim-autotag'

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" PHP
"Plug 'phpactor/phpactor', {'do': 'call phpactor#Update()', 'for': 'php'}
"Plug 'phpactor/ncm2-phpactor'
"Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
"Plug 'SirVer/ultisnips'
"Plug 'phux/vim-snippets'
"Plug 'ncm2/ncm2-ultisnips'
"Plug 'StanAngeloff/php.vim', {'for': 'php'}
"Plug 'vim-scripts/vim-php-namespace'

" Commentary
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'

" Debugging
Plug 'joonty/vdebug'

" Tex
Plug 'lervag/vimtex'
Plug 'Konfekt/FastFold'
Plug 'matze/vim-tex-fold'

call plug#end()

" =======================
" fzf settings
" =======================
set rtp+=/usr/local/opt/fzf

" =======================
" GUI settings
" =======================

if has('nvim')
	set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
end

" Syntaxt highlightin on - yes please
syntax on

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
autocmd CursorHold * silent call CocActionAsync('highlight')

" Sane splits
set splitright
set splitbelow

" deal with colors
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:base16_shell_path="~/dev/others/base16/templates/shell/scripts/"
" colorscheme base16-gruvbox-dark-hard

" Brighter comments
" call Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")

" =======================
" Remaps
" =======================

" Quick-save
nmap <leader>w :w<CR>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" Center search results
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Jump to start and end of line
map H 0
map L $

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" use Ctrl+c for Esc as that's about a million miles away
nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
snoremap <C-c> <Esc>
xnoremap <C-c> <Esc>
cnoremap <C-c> <Esc>
onoremap <C-c> <Esc>
lnoremap <C-c> <Esc>
tnoremap <C-c> <Esc>

" Move by line
nnoremap j gj
nnoremap k gk

" Open hotkeys
map <C-p> :Files<CR>
nmap <leader>b :Buffers<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

" =======================
" Editor settings
" =======================
set mouse=a
set number
set guioptions-=T " remove toolbar
set vb t_vb = " remove the beeps
set encoding=utf-8

autocmd InsertLeave * set nopaste

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Permanent undo
set undodir=~/.vimdid
set undofile

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <TAB> for selections ranges.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Set sensible tabs
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" Add snippets
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:ultisnips_php_scalar_types = 1

" Set more sensible completion
set cmdheight=2
set updatetime=300

" Fix python issue
let g:autotagStartMethod='fork'

" =======================
" Latex settings
" =======================

let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_compiler_progname = 'nvr'

" NCM2
augroup NCM2
  " uncomment this block if you use vimtex for LaTex
  autocmd Filetype tex call ncm2#register_source({
            \ 'name': 'vimtex',
            \ 'priority': 8,
            \ 'scope': ['tex'],
            \ 'mark': 'tex',
            \ 'word_pattern': '\w+',
            \ 'complete_pattern': g:vimtex#re#ncm2,
            \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
            \ })
augroup END

" =======================
" PHP settings
" =======================

" Remaps
autocmd Filetype php inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
autocmd Filetype php noremap <Leader>u :call PhpInsertUse()<CR>

" Automatically create tags
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &

" =======================
" Rust settings
" =======================

" Automatically run rustfmt on save
let g:rustfmt_autosave = 1

