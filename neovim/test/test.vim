function! CreateWinCursor(width, height)
    let buf = nvim_create_buf(0, 1)
    let opt = {
        \ 'relative': 'cursor',
        \      'row': 1,
        \      'col': 0,
        \    'width': a:width,
        \   'height': a:height,
        \    'style': 'minimal'
        \ }
    let win = nvim_open_win(buf, 0, opt)
    return win
endfunction

let buf = CreateWinCursor(10, 1)
