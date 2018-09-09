" Features
" global (base) vimrc
"   - ability to be extended
"   - a default color scheme
"   - linting gutter
"   - nerdtree
"   - git gutter
"   - remove trailing white space on save
"   - file name search
"   - autocomplete
"   - file content search
"
" local vimrc
"   - pick up local eslint config
"   - local colour scheme
"   - formatting (Prettier) on save

" enable project-specific .vimrc files
set exrc

" Vundle Boilerplate ------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Colour Schemes
Plugin 'morhetz/gruvbox'

" Helper Plugins
" Lint Engine      --- ALE
Plugin 'w0rp/ale'
" Formatting Engine --- Prettier
Plugin 'prettier/vim-prettier'
" Add Nerdtree
Plugin 'scrooloose/nerdtree'
" Nerdtree git labels
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Nerdtree icons
Plugin 'ryanoasis/vim-devicons'
" Show Git Changes in Nerdtree
Plugin 'airblade/vim-gitgutter'
" Go Plugin
Plugin 'fatih/vim-go'
" File Search
Plugin 'ctrlpvim/ctrlp.vim'
" Autocomplete
Plugin 'Valloric/YouCompleteMe'
" File Content Search
Plugin 'rking/ag.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Vundle Boilerplate End --------

" Enable Colours
if !exists("g:syntax_on")
  syntax enable
endif

" Colour Schemes
set background=dark
colorscheme gruvbox

" NerdTree Settings
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1        " Show dot files
let NERDTreeIgnore = ['\.swp$'] " Hide .swp files

" Nerdtree colours
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('js', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('go', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('rb', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('html', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('css', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('json', 'green', 'none', 'green', '#151515')

call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('yaml', 'yellow', 'none', 'yellow', '#151515')

" UI Settings
set number                         " show line numbers
set cursorline                     " highlight current line
set wildmenu                       " visual autocomplete for command menu
set showmatch                      " highlight matching [{()}]
set incsearch                      " search as characters are entered
set hlsearch                       " highlight matches
set noerrorbells visualbell t_vb=  " no failure alert sound
set encoding=utf8
set guifont=DroidSansMono_Nerd_Font:h11

" Autocomplete Settings
" Don't show YCM's preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" Character Preferences
set tabstop=2                      " number of visual spaces per TAB
set shiftwidth=2                   " number of spaces when indenting
set softtabstop=2                  " number of spaces in tab when editing
set expandtab                      " tabs are spaces

" Movement / Key Bindings
" jk is escape
inoremap jk <esc>

" File Searching
" Content
let g:ackprg = 'ag --nogroup --nocolor --column'
" Filenames - Ignore some files/directories
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" On Save
autocmd BufWritePre * :%s/\s\+$//e " remove trailing whitespace

" safe project-specific .vimrc files
set secure
