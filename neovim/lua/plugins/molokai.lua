function setup_molokai()
    -- Set colorscheme
    vim.cmd('colorscheme molokai')

    -- Disenable italic type
    vim.cmd([[
    hi DiffText                      guibg=#4C4745 gui=bold
    hi Macro           guifg=#C4BE89               gui=none
    hi SpecialKey      guifg=#66D9EF               gui=none
    hi Special         guifg=#66D9EF guibg=bg      gui=none
    hi StorageClass    guifg=#FD971F               gui=none
    hi Tag             guifg=#F92672               gui=none
    ]])
end
