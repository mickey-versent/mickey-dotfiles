" Removes trailing spaces
function TrimWhiteSpace()
    %s/\s*$//
    ''
:endfunction

" Function key mappings
map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>
map <F3> :nohl<CR>
map! <F3> :nohl<CR>
map <F4> :set invnumber<CR>
map! <F4> :set invnumber<CR>

" Tab mappings
nnoremap tp :tabprevious<CR>
nnoremap tn :tabnext<CR>
:nnoremap tc :tabclose<CR>

" NerdTree
let NERDTreeRespectWildIgnore = 1
map <leader>n <plug>NERDTreeTabsToggle<CR>

" Platinum Searcher
nmap // :Pt! <C-R><C-W><CR>
