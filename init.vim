set number     
set cursorline  
set showcmd " show what you did on the lower right corner
set wildmenu 
set hlsearch   
set incsearch
set ignorecase
set smartcase


noremap h i
noremap H I

noremap i k
noremap I 5k
noremap K 5j
noremap k j
noremap j h

" open file-tree explorer by typing tt
noremap tt :CocCommand explorer<CR>

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>


call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'

call plug#end()

" let g:SnazzyTransparent = 1
color snazzy

" initial coc.nvim plugins
let g:coc_global_extensions = [ 'coc-json', 'coc-vimlsp', 'coc-marketplace', 'coc-highlight' ]

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <ctrl-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Highlight the same thing and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

