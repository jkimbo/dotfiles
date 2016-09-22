" Mark certain extension as specific filetypes
au BufRead,BufNewFile *.txt         setfiletype text
au BufRead,BufNewFile *.csv,*.tsv   setfiletype csv
au BufRead,BufNewFile *.prb         setfiletype tex
au BufRead,BufNewFile *.less        setlocal filetype=less          " less syntax
au BufRead,BufNewFile *.tpl         setlocal filetype=smarty.html   " smarty syntax
au BufRead,BufNewFile *.coffee      setlocal filetype=coffee        " coffee syntax
au BufRead,BufNewFile *.styl        setlocal filetype=stylus        " stylus syntax
au BufRead,BufNewFile gitconfig     setlocal filetype=gitconfig     " gitconfig syntax
au BufRead,BufNewFile *.twig        setlocal filetype=html          " twig
au BufRead,BufNewFile *.json        setlocal syntax=json

" === HTML/XML ===
au Filetype html,xml setlocal
  \ foldcolumn=2
  \ foldmethod=indent
  \ foldlevel=0
  \ foldlevelstart=2
  \ foldminlines=1
  \ foldnestmax=20

" === CSS ===

au Filetype css setlocal
  \ foldcolumn=2
  \ foldmethod=indent
  \ foldlevel=0
  \ foldlevelstart=2
  \ foldminlines=1
  \ foldnestmax=20

" === SH ===
au Filetype sh setlocal
  \ foldcolumn=2
  \ foldmethod=indent
  \ foldlevel=0
  \ foldlevelstart=2
  \ foldminlines=1
  \ foldnestmax=20

" === PHP ===
au Filetype php setlocal wrap                           " wrap lines in PHP
au Filetype php setlocal foldcolumn=2
au Filetype php setlocal foldmethod=indent
au Filetype php setlocal foldlevel=0
au Filetype php setlocal foldlevelstart=2
au Filetype php setlocal foldminlines=1
au Filetype php setlocal foldnestmax=20
au Filetype php setlocal list                           " show tabs and trailing spaces
au Filetype php setlocal lcs=tab:├─                     " Tabs are shown as ├──├──
au Filetype php setlocal lcs+=trail:␣                   " Show trailing spaces as ␣
au Filetype php setlocal spell

" === JS ===
au Filetype javascript setlocal wrap                    " wrap lines in javascript
au Filetype javascript setlocal foldcolumn=2
au Filetype javascript setlocal foldmethod=indent
au Filetype javascript setlocal foldlevel=0
au Filetype javascript setlocal foldlevelstart=2
au Filetype javascript setlocal foldminlines=1
au Filetype javascript setlocal foldnestmax=20
au Filetype javascript setlocal list                    " show tabs and trailing spaces
au Filetype javascript setlocal lcs=tab:├─              " Tabs are shown as ├──├──
au Filetype javascript setlocal lcs+=trail:␣            " Show trailing spaces as ␣
au Filetype javascript setlocal spell

" === Python ===
au Filetype python setlocal wrap
au Filetype python setlocal foldcolumn=2
au Filetype python setlocal foldmethod=indent
au Filetype python setlocal foldlevel=0
au Filetype python setlocal foldlevelstart=2
au Filetype python setlocal foldminlines=1
au Filetype python setlocal foldnestmax=20
au Filetype python setlocal list                           " show tabs and trailing spaces
au Filetype python setlocal lcs=tab:├─                     " Tabs are shown as ├──├──
au Filetype python setlocal lcs+=trail:␣                   " Show trailing spaces as ␣
au Filetype python setlocal spell

" === SCSS ===
au Filetype scss setlocal wrap
au Filetype scss setlocal foldcolumn=2
au Filetype scss setlocal foldmethod=indent
au Filetype scss setlocal foldlevel=0
au Filetype scss setlocal foldlevelstart=2
au Filetype scss setlocal foldminlines=1
au Filetype scss setlocal foldnestmax=20
au Filetype scss setlocal list                           " show tabs and trailing spaces
au Filetype scss setlocal lcs=tab:├─                     " Tabs are shown as ├──├──
au Filetype scss setlocal lcs+=trail:␣                   " Show trailing spaces as ␣
au Filetype scss setlocal spell
