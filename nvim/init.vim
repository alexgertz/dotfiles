lua require('plugins')

" Reload plugins when updating the packer file
autocmd BufWritePost plugins.lua PackerCompile 

" Reload the init file on save
autocmd BufWritePost .init.vim source %

source ~/.config/nvim/coc.nvim
source ~/.config/nvim/test.vim

let g:coc_node_path = "/Users/alexandergertz/.nvm/versions/node/v15.7.0/bin/node"

syntax enable

" Coloring and theming
set background=dark
colorscheme palenight

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

let g:palenight_terminal_italics=1


" Yank/copy to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif


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
nmap <F7>> :w<cr>
nmap <F8> :wq<cr>
nmap <Leader>, :lua require('rest-nvim').run()<cr>


" PHP namespace importer
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <F5> <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <F5> :call PhpInsertUse()<CR>

" Recompile packer plugins on change
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
