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
let g:mapleader = ","
" let maplocalleader = "\\"

" set regexpengine=1
set noshowcmd
set synmaxcol=200
" let g:loaded_matchparen=1
set nocursorline

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
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
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
set lazyredraw                                              " fixes scrolling slowness
set ttimeoutlen=2

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
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
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

let g:python_host_prog = $HOME.'/.pyenv/versions/2.7.13/bin/python'
let g:python3_host_prog = $HOME.'/.pyenv/versions/3.6.0/bin/python'

" === Plugin settings ===
 if has('nvim')
  set completeopt-=preview

  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources#flow#flow_bin = g:flow_path
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  call deoplete#custom#option('num_processes', 0)
  call deoplete#custom#option('auto_refresh_delay', 0)
  call deoplete#custom#source('tabnine', 'rank', 80)

  " vim tern
  let g:tern_request_timeout = 1
  let g:tern_show_signature_in_pum = 0

  " neosnippet complete
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)

  " == scrooloose/syntastic ==
  let g:syntastic_auto_loc_list=1
  let g:syntastic_loc_list_height=5
  let g:syntastic_aggregate_errors = 1
  let g:syntastic_mode_map = { 'mode': 'active',
                              \ 'active_filetypes': [],
                              \ 'passive_filetypes': ['less', 'phtml', 'html'] }
  let g:syntastic_python_checkers=['python', 'flake8']
  " let g:syntastic_python_flake8_exec = '/Users/jkimbo/bin/flake8.sh'
  let g:syntastic_scss_checkers=['sass', 'scss_lint']
  let g:syntastic_css_checkers=['stylelint']
  let g:syntastic_php_checkers=['php']
  let g:syntastic_javascript_checkers=['eslint', 'flow']
  let g:syntastic_javascript_eslint_exec = g:eslint_path
  let g:syntastic_javascript_flow_exec = g:flow_path
  let g:syntastic_jsx_checkers=['eslint']
  let g:syntastic_jsx_eslint_exec = g:eslint_path
  let g:syntastic_javascript_jsx_checkers=['eslint']
  let g:syntastic_javascript_jsx_eslint_exec = g:eslint_path

  " == flowtype/vim-flow ==
  let g:flow#autoclose = 1
  let g:flow#enable = 1
  let g:flow#flowpath = g:flow_path

  " == neoformat ==
  " let g:neoformat_enabled_javascript = ['prettier']
  " let g:neoformat_javascript_prettier = {
  "           \ 'exe': g:prettier_path,
  "           \ 'args': ['--stdin', '--stdin-filepath', '%:p'],
  "           \ 'stdin': 1,
  "           \ }

endif

" == junegunn/fzf ==
nnoremap <leader>t :FZF<CR> 
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
nnoremap <leader>a :Ack 

" == sjl/gundo.vim ==
nnoremap <F5> :GundoToggle<CR>
let g:gundo_right = 1

" == tpope/vim-commentary ==
xmap <leader>c  <Plug>Commentary
nmap <leader>c  <Plug>Commentary
omap <leader>c  <Plug>Commentary

" == svermeulen/vim-easyclip ==
set clipboard=unnamed
nnoremap <silent> <F6> :Yanks<CR>
let g:yoinkIncludeDeleteOperations = 1
let g:yoinkChangeTickThreshold = 1
" Allow seting marks with gm
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

" == sbdchd/neoformat ==
" nnoremap <F3> :silent mkview!<CR>:Neoformat<CR>:silent loadview!<CR>
" autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ --trailing-comma\ es5
" Use formatprg when available
" let g:neoformat_try_formatprg = 1


" Prettier
nnoremap <F3> :Prettier<CR>

" Black
autocmd FileType python nnoremap <F3> :Black<CR>

autocmd FileType go nnoremap <F3> :GoFmt<CR>

" == editorconfig/editorconfig-vim ==
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

let g:vim_isort_python_version = 'python3'

" == airblade/vim-rooter ==
let g:rooter_patterns = ['package.json', 'service.yml', 'manage.py', '.projectroot', '.git/']
let g:rooter_silent_chdir = 1
" let g:rooter_manual_only = 1

" == w0rp/ale ==
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
let g:ale_open_list = 1
" let g:ale_list_window_size = 5
" nmap <silent> <C-n> <Plug>(ale_previous_wrap)
" nmap <silent> <C-m> <Plug>(ale_next_wrap)

" == mhinz/vim-startify
let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]


" == ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

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

let g:vim_jsx_pretty_colorful_config = 1
