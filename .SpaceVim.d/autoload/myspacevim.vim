function! myspacevim#before() abort
    set mouse=
    let g:neoformat_python_black = {
    \ 'exe': 'black',
    \ 'stdin': 1,
    \ 'args': ['-q', '-'],
    \ }
    let g:neoformat_enabled_python = ['black']
endfunction

