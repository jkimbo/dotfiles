filetype indent on      " load filetype-specific indent files

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

" === Markdown ===
au Filetype html,xml call SetMarkdownOptions()
function SetMarkdownOptions()
  setlocal spell
endfunction

" === HTML/XML ===
au Filetype html,xml call SetHTMLOptions()
function SetHTMLOptions()
  setlocal foldcolumn=2
  setlocal foldmethod=indent
  setlocal foldlevel=0
  setlocal foldlevelstart=2
  setlocal foldminlines=1
  setlocal foldnestmax=20
endfunction

" === CSS ===

au Filetype css call SetCSSOptions()
function SetCSSOptions()
  setlocal foldcolumn=2
  setlocal foldmethod=indent
  setlocal foldlevel=0
  setlocal foldlevelstart=2
  setlocal foldminlines=1
  setlocal foldnestmax=20
endfunction

" === SH ===
au Filetype sh call SetSHOptions()
function SetSHOptions()
  setlocal foldcolumn=2
  setlocal foldmethod=indent
  setlocal foldlevel=0
  setlocal foldlevelstart=2
  setlocal foldminlines=1
  setlocal foldnestmax=20
endfunction

" === JS ===
au Filetype javascript,javascript_jsx call SetJSOptions()
function SetJSOptions()
  setlocal wrap                    " wrap lines in javascript
  setlocal foldcolumn=2
  setlocal foldmethod=indent
  setlocal foldlevel=0
  setlocal foldlevelstart=2
  setlocal foldminlines=1
  setlocal foldnestmax=20
  setlocal list                    " show tabs and trailing spaces
  setlocal lcs=tab:├─              " Tabs are shown as ├──├──
  setlocal lcs+=trail:␣            " Show trailing spaces as ␣
  setlocal spell
  setlocal textwidth=80
  setlocal colorcolumn=+1
endfunction

" === Python ===
au Filetype python call SetPythonOptions()
function SetPythonOptions()
  setlocal wrap
  setlocal foldcolumn=2
  setlocal foldmethod=indent
  setlocal foldlevel=0
  setlocal foldlevelstart=2
  setlocal foldminlines=1
  setlocal foldnestmax=20
  setlocal list                           " show tabs and trailing spaces
  setlocal lcs=tab:├─                     " Tabs are shown as ├──├──
  setlocal lcs+=trail:␣                   " Show trailing spaces as ␣
  setlocal spell
endfunction

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

