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
Plugin 'w0rp/ale'               " Linting Engine
Plugin 'prettier/vim-prettier'  " Formatting Engine
Plugin 'ctrlpvim/ctrlp.vim'     " File Search
Plugin 'rking/ag.vim'           " File Content Search
Plugin 'Valloric/YouCompleteMe' " Autocomplete
Plugin 'tpope/vim-fugitive'     " Git integration
Plugin 'tpope/vim-rhubarb'      " Github integration
Plugin 'mattn/emmet-vim'        " HTML templating

" UI Plugins
Plugin 'itchyny/lightline.vim'  " Status Bar
Plugin 'maximbaz/lightline-ale' " ALE in status bar

" NerdTree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin' " git labels
Plugin 'ryanoasis/vim-devicons'      " icons
Plugin 'airblade/vim-gitgutter'      " Show Git Changes

" Languages
Plugin 'fatih/vim-go' " Go Plugin

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Vundle Boilerplate End --------

" Colour Schemes
set background=dark
colorscheme gruvbox

" Enable Colours
if !exists("g:syntax_on")
  syntax enable
endif
" Custom filetype syntax highlighting
au BufNewFile,BufRead *.vue set filetype=html

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
set noshowmode                     " hide duplicate status bar
set encoding=utf8
set guifont=DroidSansMono_Nerd_Font:h11
" use relative numbers in insert mode only
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" configure lightline status bar
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand': {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ },
      \ }
" ALE Status line icons
let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "

" Autocomplete Settings
" Don't show YCM's preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
:command -nargs=* Rename YcmCompleter RefactorRename <args>
:command Find YcmCompleter GoTo

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
