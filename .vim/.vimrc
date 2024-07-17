source $VIMRUNTIME/defaults.vim

set laststatus=2

syntax enable

packadd! matchit

filetype plugin on

augroup vimrcEx
	au!
	autocmd FileType text setlocal textwidth=78
augroup END

set showcmd
set scrolloff=3
set cursorcolumn
set cursorline
set number
set mouse=a
set wrap
set whichwrap=b,s,<,>,[,]
set noshowmode
xnoremap J :move '>+1<CR>gv=gv
xnoremap K :move '<-2<CR>gv=gv
nnoremap <C-d> f=lv$hd0
inoremap jh <Esc>
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj
inoremap <C-d> <BS>
nnoremap <Space> :
vnoremap <Space> :
map	<F2> ko{<Esc>}ko}<Esc>
map	<F3> i(<Esc>$a)

ab #i #include
ab #d #define

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set scrolloff=8
set sidescrolloff=8
set nu
set relativenumber
autocmd BufNewFile,BufRead *.tpp set filetype=cpp
au BufNewFile,BufRead *.html set filetype=htmldjango

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Plugins (dir = ~/.vim/plugged)
call plug#begin()

Plug 'tibabit/vim-templates'
Plug 'Konfekt/vim-alias'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'bronson/vim-trailing-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly'}

call plug#end()

colorscheme nightfly

" Templates
let g:tmpl_search_paths = ['~/.vim/templates']
autocmd FileType template setlocal noeol binary fileformat=dos

" Aliases
if exists('s:loaded_vimafter')
    silent doautocmd VimAfter VimEnter *
else
    let s:loaded_vimafter = 1
    augroup VimAfter
        autocmd!
        autocmd VimEnter * source ~/.vim/after/alias.vim
    augroup END
endif

" Basic colors
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

" NERDTree colors
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExactMatchHighlightColor = {}

let g:NERDTreeExtensionHighlightColor['c'] = s:aqua
let g:NERDTreeExtensionHighlightColor['cpp'] = s:darkBlue
let g:NERDTreeExtensionHighlightColor['tpp'] = s:blue
let g:NERDTreeExactMatchHighlightColor['Makefile'] = s:git_orange
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange

let g:nerdtree_vis_confirm_open=0
let g:nerdtree_vis_confirm_copy=0
let g:nerdtree_vis_confirm_move=0
