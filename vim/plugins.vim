" == General editor plugins ==
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'fholgado/minibufexpl.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'mileszs/ack.vim'
Plug 'sjl/gundo.vim'
" Plug 'svermeulen/vim-easyclip'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-cutlass'
Plug 'editorconfig/editorconfig-vim'
" Plug 'sbdchd/neoformat'
Plug 'airblade/vim-rooter'
Plug 'mhinz/vim-startify'
Plug 'chr4/nginx.vim'

" == Autocomplete plugins ==
if has('nvim')		
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }		
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }		
  " Plug 'steelsojka/deoplete-flow'		
  Plug 'zchee/deoplete-jedi', { 'do': 'pip3 install jedi' }		
  Plug 'Shougo/neosnippet'		
  Plug 'Shougo/neosnippet-snippets'		
  " Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
  " Plug 'w0rp/ale'
endif

" == JavaScript syntax highlighting ==
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'


" Plug 'scrooloose/syntastic'
Plug 'dense-analysis/ale'

" == Python tools ==
Plug 'hynek/vim-python-pep8-indent'
Plug 'fisadev/vim-isort'

" == Prettier ==
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" == Black ==
Plug 'psf/black', { 'tag': '19.10b0' }

Plug 'hashivim/vim-terraform'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
