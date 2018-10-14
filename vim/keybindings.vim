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

""" map <Space> to :noh and clear messages
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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

nmap <F3> :Prettier<CR>
