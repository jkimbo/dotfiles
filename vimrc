set nocompatible

" === Plugins ===
call plug#begin()

try
  source ~/dotfiles/vim/vimrc.plugs
catch
endtry

call plug#end()

syntax enable

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

" === Plugin settings ===
 if has('nvim')
  " == Shougo/deoplete.nvim ==
  " == carlitux/deoplete-ternjs ==
  let g:deoplete#enable_at_startup = 1
  let g:SuperTabDefaultCompletionType = "<c-n>"
  let g:deoplete#sources#flow#flow_bin = g:flow_path
  let g:tern_request_timeout = 1
  let g:tern_show_signature_in_pum = 0
  set completeopt-=preview

  " == scrooloose/syntastic ==
  let g:syntastic_auto_loc_list=1
  let g:syntastic_loc_list_height=5
  let g:syntastic_aggregate_errors = 1
  let g:syntastic_mode_map = { 'mode': 'active',
                              \ 'active_filetypes': [],
                              \ 'passive_filetypes': ['less', 'phtml', 'html'] }
  let g:syntastic_python_checkers=['python', 'flake8']
  let g:syntastic_scss_checkers=['sass', 'scss_lint']
  let g:syntastic_css_checkers=['stylelint']
  let g:syntastic_php_checkers=['php']
  let g:syntastic_javascript_checkers=['eslint']
  let g:syntastic_javascript_eslint_exec = 'eslint_d'
  let g:syntastic_jsx_checkers=['eslint']
  let g:syntastic_jsx_eslint_exec = 'eslint_d'
  let g:syntastic_python_flake8_exec = '/Users/jkimbo/bin/flake8.sh'

  " == flowtype/vim-flow ==
  let g:flow#autoclose = 1
endif

" == mxw/vim-jsx ==
let g:jsx_ext_required = 0


" === Keybindings ===

let mapleader = ','
let g:mapleader = ","
let maplocalleader = "\\"

""" Smart way to move windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map gw <C-W>
map gW <C-W>
nnoremap <leader>w<CR> <C-w>v<C-w>l                        " open new window in vertical split
nnoremap <leader>h<CR> <C-w>s<C-w>j                        " open new window in horizontal split

" Window resizing with arrow keys
nmap <Down> <C-W>-<C-W>-
nmap <Up> <C-W>+<C-W>+
nmap <right> <C-W>><C-W>>
nmap <left> <C-W><<C-W><

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Stupid shift key fixes
cmap Xa xa
cmap xA xa

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

noremap <F12> <Esc>:syntax sync fromstart<CR>       " fix syntax highlighting problems
inoremap <F12> <C-o>:syntax sync fromstart<CR>      " fix syntax highlighting problems

" Copy to system clipboard
vnoremap <leader>y "*y

" == junegunn/fzf ==
nnoremap <leader>t :FZF<CR> 

" == scrooloose/nerdtree ==
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>

let g:NERDTreeShowBookmarks=1
let g:NERDTreeIgnore=['\.pyc','\~$', '\.swo$', '\.swp$', '\.git$', '\.hg$', '\.svn$', '\.bzr$', '\.orig', '\.DS_Store$']
let g:NERDTreeShowHidden=1
let g:NERDTreeKeepTreeInNewTab=1
let g:NERDTreeWinSize=20
