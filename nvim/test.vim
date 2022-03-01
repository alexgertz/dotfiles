" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> <F1> :TestNearest<CR>
nmap <silent> <F3> :TestFile<CR>
" cmap <silent> :ts :TestSuite<CR>
nmap <silent> <F2> :TestLast<CR>
" cmap <silent> :tv :TestVisit<CR>

let test#strategy = 'shtuff'
let g:shtuff_receiver = 'php-tests-runner'
let g:test#preserve_screen = 1
