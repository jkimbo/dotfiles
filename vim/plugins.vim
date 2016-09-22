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

" == Autocomplete plugins ==
Plug 'ervandew/supertab'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'steelsojka/deoplete-flow'
  Plug 'zchee/deoplete-jedi', { 'do': 'pip3 install jedi' }
endif

" == JavaScript syntax highlighting ==
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'

" == JavaScript tools integration ==
Plug 'scrooloose/syntastic'
Plug 'flowtype/vim-flow'
