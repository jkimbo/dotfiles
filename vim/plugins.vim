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

" YouCompleteMe
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

Plug 'SirVer/ultisnips'
" == JavaScript syntax highlighting ==
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Plug 'othree/javascript-libraries-syntax.vim'

" == JavaScript tools integration ==
Plug 'scrooloose/syntastic'
" Plug 'flowtype/vim-flow'
" Plug 'fleischie/vim-styled-components'

" == Python tools ==
Plug 'hynek/vim-python-pep8-indent'
