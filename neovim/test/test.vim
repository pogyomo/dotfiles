function! CreateWindow() abort
    let buf = nvim_create_buf(0, 1)
    let opt = {
        \ 'relative': 'cursor',
        \      'row': 1,
        \      'col': 0,
        \    'width': 30,
        \   'height': 10,
        \    'style': 'minimal'
        \ }
    let win = nvim_open_win(buf, 0, opt)
endfunction

function! CloseWindow(buf) abort
    call nvim_win_close(buf, 0)
endfunction

let buf = CreateWindow()
