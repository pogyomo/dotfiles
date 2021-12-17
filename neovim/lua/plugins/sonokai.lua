function setup_sonokai()
    -- Set style
    vim.g.sonokai_style = 'shusia'

    -- Disable italic
    vim.g.sonokai_enable_italic = false
    vim.g.sonokai_disable_italic_comment = true

    -- Register colorscheme
    vim.cmd[[colorscheme sonokai]]
end
