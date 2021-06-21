set nocompatible

" === Plugins ===
call plug#begin()

try
  source ~/dotfiles/vim/plugins.vim
catch
endtry

call plug#end()

syntax enable

" === General settings ===

let mapleader = ','

set history=1000                   " lines of history to remember
set undofile
set undodir=~/.vimundo
set hidden                         " hides buffers instead of closing them
set number                         " set numbering rows
au StdinReadPost * setlocal nonu   " but not in man
set nobackup                       " no backup
set noswapfile                     " no swapfile
set fileformats=unix               " always use Unix file format

" Colour scheme
set background=dark
colorscheme solarized

" Highlight the 81st column 
set textwidth=80
set colorcolumn=+1

" UI settings
set ruler                                                   " always display cursor position
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)          " a ruler on steroids
set backspace=indent,eol,start                              " backspace for dummys
set incsearch                                               " search as type
set hlsearch                                                " highlight search terms
set ignorecase smartcase                                    " ignore case except explicit UC
set scrolloff=4                                             " keep cursor 5 lines from edge
set sidescrolloff=10
set wildmode=list:longest,full                              " command <Tab> completion, list matches, then longest common part, then all.
set tabpagemax=40                                           " max number opening tabs = ?
set showtabline=1                                           " standard tabbed viewing
set viminfo='100                                            " save marks and jumps in viminfo
set whichwrap=b,s,>,<                                       " which movement chars move lines
set winminheight=0                                          " window minimum height is 0
" set showmatch                                               " highlight matching [{()}]
" set lazyredraw                                              " fixes scrolling slowness
" set ttimeoutlen=2

if has('statusline')
  set laststatus=2

  function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? '👌' : printf(
    \   '%d⚠️  %d⛔️',
    \   all_non_errors,
    \   all_errors
    \)
  endfunction

  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ %w%h%m%r\ " Options
  set statusline+=%=%{LinterStatus()}\ %-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set tabstop=2                      " spaces per tab
set softtabstop=2
set shiftwidth=2                   " spaces per indent
set expandtab                      " expand tabs to spaces
set smarttab                       " at start shiftwidth, else tabstop
set autoindent                     " indent new line to same as previous
set smartindent                    " indent on code type
set nolist                         " disable list on most files
set foldenable                     " auto fold code
set gdefault

""" Control wrapping
set wrap
set linebreak                      " wraps without <eol>

""" Folding
set foldcolumn=2                   " set width of folding column (appears on left side of ruler)

""" Session
au BufWinLeave * silent! mkview             " make vim save view (state) (folds, cursor, etc)
au BufWinEnter * silent! loadview           " make vim load view (state) (folds, cursor, etc)

" === Filetypes ===
source ~/dotfiles/vim/filetypes.vim

" === Spelling ===

au Filetype c,css,html,tex,text,mkd,wiki,vimwiki setlocal spell
au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell " git commit messages
au Filetype help setlocal nospell
au StdinReadPost * setlocal nospell         " but not in man
set spelllang=en_gb                         " spell check language to GB

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
let g:prettier_path = StrTrim(system('PATH=$(npm bin):$PATH && which prettier'))
let g:eslint_path = StrTrim(system('PATH=$(npm bin):$PATH && which eslint'))

let g:python_host_prog = "python2" " $HOME.'/.pyenv/versions/2.7.13/bin/python'
let g:python3_host_prog = "python" " $HOME.'/.pyenv/versions/3.6.0/bin/python'

" === Plugin settings ===

" Completion
set completeopt-=preview

let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" neosnippet complete
imap <C-k>     <Plug>(neosnippet_expand_or_jump)

" == junegunn/fzf ==
nnoremap <leader>t :Files<CR> 
let g:fzf_layout = { 'down': '40%' }
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" == mxw/vim-jsx ==
let g:jsx_ext_required = 0

" == fholgado/minibufexpl.vim ==
let g:miniBufExplorerMoreThanOne = 0

" == scrooloose/nerdtree ==
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>

let g:NERDTreeShowBookmarks=1
let g:NERDTreeIgnore=['\.pyc','\~$', '\.swo$', '\.swp$', '\.git$', '\.hg$', '\.svn$', '\.bzr$', '\.orig', '\.DS_Store$']
let g:NERDTreeShowHidden=1
let g:NERDTreeKeepTreeInNewTab=1
let g:NERDTreeWinSize=20
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" == mileszs/ack.vim ==
let g:ackprg = 'ag --nogroup --nocolor --column'
cnoreabbrev Ack Ack!
nnoremap <leader>a :Ack!<Space>

" == sjl/gundo.vim ==
nnoremap <F5> :GundoToggle<CR>
let g:gundo_right = 1

" == tpope/vim-commentary ==
xmap <leader>c  <Plug>Commentary
nmap <leader>c  <Plug>Commentary
omap <leader>c  <Plug>Commentary

" == svermeulen/vim-cutlass ==
set clipboard=unnamedplus
let g:yoinkIncludeDeleteOperations = 1
let g:yoinkChangeTickThreshold = 1

nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D

nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" == pangloss/vim-javascript ==
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" == editorconfig/editorconfig-vim ==
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

let g:vim_isort_python_version = 'python3'

" == airblade/vim-rooter ==
let g:rooter_patterns = ['package.json', 'service.yml', 'manage.py', '.projectroot', '.git/']
" let g:rooter_silent_chdir = 1

" == w0rp/ale ==
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}
" let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0
let g:ale_list_window_size = 5
nmap <silent> <C-n> <Plug>(ale_previous_wrap)
nmap <silent> <C-m> <Plug>(ale_next_wrap)

" === Keybindings ===
source ~/dotfiles/vim/keybindings.vim

" # Function to permanently delete views created by 'mkview'
function! MyDeleteView()
    let path = fnamemodify(bufname('%'),':p')
    " vim's odd =~ escaping for /
    let path = substitute(path, '=', '==', 'g')
    if empty($HOME)
    else
        let path = substitute(path, '^'.$HOME, '\~', '')
    endif
    let path = substitute(path, '/', '=+', 'g') . '='
    " view directory
    let path = &viewdir.'/'.path
    call delete(path)
    echo "Deleted: ".path
endfunction

" # Command Delview (and it's abbreviation 'delview')
command Delview call MyDeleteView()
