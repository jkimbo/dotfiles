" == General editor plugins ==
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rhubarb'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'thasmin/minibufexpl.vim'
Plug 'tpope/vim-fugitive'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'mileszs/ack.vim'
Plug 'sjl/gundo.vim'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-cutlass'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-rooter'
Plug 'dense-analysis/ale'
Plug 'chr4/nginx.vim'
Plug 'hashivim/vim-terraform'

" == Autocomplete plugins ==
if has('nvim')		
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
  " Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  " Plug 'steelsojka/deoplete-flow'
  " Plug 'zchee/deoplete-jedi', { 'do': 'pip3 install jedi' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" == JavaScript syntax highlighting ==
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'

" == Python tools ==
Plug 'hynek/vim-python-pep8-indent'
Plug 'fisadev/vim-isort'

" == Prettier ==
Plug 'prettier/vim-prettier'

" == Black ==
Plug 'psf/black', { 'branch': 'stable' }

" == Golang ==
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
