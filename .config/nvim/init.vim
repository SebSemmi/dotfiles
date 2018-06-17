" Launch Config {{{
set encoding=utf-8
" Initialize Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
set rtp+=/usr/local/opt/fzf
" }}}
" Colors {{{
syntax enable           " enable syntax processing
color smyck             " Colorscheme see https://github.com/hukl/Smyck-Color-Scheme
" }}}
" Spaces & Tabs {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab           " use spaces for tabs
set modelines=1
filetype indent on
filetype plugin on
set autoindent
set nowrap
set list listchars=tab:»·,trail:·
" }}}
" UI Layout {{{
set number              " show line numbers
set ruler               " column and line numbers
set cursorline          " highlight current line
set wildmenu            " display all matching files when tab-completion
set showmatch           " higlight matching parenthesis
:au BufWinEnter * let w:m2=matchadd('ColumnMargin', '\%>80v.\+', -1)    " Highlight characters behind the 80 chars margin
set scrolloff=2         " minimum lines above/below cursor
" }}}
" Status Bar {{{
set laststatus=2                  " always show status bar
set statusline=%F%m%r%h%w\ %y\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
"set showcmd             " show command in bottom bar
" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=16 ctermbg=10
  au InsertLeave * hi StatusLine ctermbg=8 ctermfg=15
endif
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
set path+=**            " search down into subfolders, provides tab-completion for all file-related tasks
" }}}
" Folding {{{
set foldenable          " don't fold files by default on open
set foldlevelstart=10   " start with fold level of 10
set foldnestmax=10      " max 10 depth
set foldmethod=indent   " fold based on indent level
" }}}
" Line Shortcuts {{{
" }}}
" Leader Shortcuts {{{
let mapleader=" "
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>a :Ag
" Map Ctrl+l to clear highlighted searches
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
" }}}
" NERDTree {{{
let NERDTreeIgnore = ['\.pyc$', 'build', 'venv', 'egg', 'egg-info/', 'dist', 'docs']
let NERDTreeShowHidden=1
" }}}
" Syntastic {{{
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_ignore_files = ['.java$']
" let g:syntastic_check_on_open=1
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.py setlocal softtabstop=4
    autocmd BufEnter *.py setlocal tabstop=4
    autocmd BufEnter *.py setlocal shiftwidth=4
    autocmd BufEnter *.py setlocal textwidth=79
augroup END
" Close window if last remaining window is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}
" Misc {{{
set ttyfast                     " faster redraw
set backspace=indent,eol,start
" }}}
" Git-Gutter {{{
set signcolumn=yes
set updatetime=250
" }}}
" Backups {{{
set noswapfile
set nobackup
set nowritebackup
" }}}
" Custom Funktions {{{
" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
let g:ackprg = 'ag --nogroup --nocolor --column'
" }}}
" neovim {{{
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
" }}}
" vimr {{{
if has("gui_vimr")
    set guioptions-=r
    set guioptions-=L
endif
" }}}
" vim:foldmethod=marker:foldlevel=0
