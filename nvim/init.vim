lua require('plugins')

" Reload plugins when updating the packer file
autocmd BufWritePost plugins.lua PackerCompile 

" Reload the init file on save
autocmd BufWritePost .init.vim source %

source ~/.config/nvim/test.vim

let g:coc_node_path = '/Users/alexandergertz/.nvm/versions/node/v18.14.0/bin/node'

syntax enable

" Coloring and theming
set background=dark
colorscheme palenight

" Yank/copy to clipboard
set clipboard+=unnamedplus

" This updates ux fast
set updatetime=300

" Show line numbers
set number

" Spacing options
set expandtab
set tabstop=4
set shiftwidth=4

" Set font 
set guifont=FiraCode

" Window splitting
set splitbelow
set splitright
nnoremap <C-K> <C-W><C-J>
nnoremap <C-J> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Mappings
let mapleader = (' ') 
nmap <Leader>f :Files<cr>
nmap <Leader>r :Rg<cr>
nmap <Leader>b :Buffers<cr>
nmap <Leader>g :GFiles?<cr>
nmap <F7> :w<cr>
nmap <F8> :wq<cr>
nmap <Leader>, :lua require('rest-nvim').run()<cr>

nmap <silent> gd <Plug>(coc-definition)

" Code completions
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" PHP namespace importer
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <F5> <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <F5> :call PhpInsertUse()<CR>

autocmd FileType php inoremap <F6> <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <F6> :call PhpSortUse()<CR>

" Recompile packer plugins on change
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
