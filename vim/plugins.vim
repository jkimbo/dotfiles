" == General editor plugins ==
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'fholgado/minibufexpl.vim'
Plug 'tpope/vim-fugitive'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'mileszs/ack.vim'
Plug 'sjl/gundo.vim'
Plug 'svermeulen/vim-easyclip'
Plug 'editorconfig/editorconfig-vim'
Plug 'sbdchd/neoformat'

" == Autocomplete plugins ==
Plug 'ervandew/supertab'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'steelsojka/deoplete-flow'
  Plug 'zchee/deoplete-jedi', { 'do': 'pip3 install jedi' }
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
endif

" == JavaScript syntax highlighting ==
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'jparise/vim-graphql'
" Plug 'leafgarland/typescript-vim'

" == JavaScript tools integration ==
Plug 'scrooloose/syntastic'
" Plug 'flowtype/vim-flow'

" == Python tools ==
Plug 'hynek/vim-python-pep8-indent'
