" == General editor plugins ==
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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
Plug 'airblade/vim-rooter'
Plug 'w0rp/ale'

" == Autocomplete plugins ==
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
Plug 'jparise/vim-graphql'
" Plug 'leafgarland/typescript-vim'

" == Python tools ==
Plug 'hynek/vim-python-pep8-indent'
Plug 'fisadev/vim-isort'

" == Prettier ==
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" == Black ==
" Plug 'python/black'
