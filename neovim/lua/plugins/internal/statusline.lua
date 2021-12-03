-- --------------------
-- Settings for display
-- --------------------
-- Display statusline and tabline
vim.opt.laststatus  = 2
vim.opt.showtabline = 2


-- -----------------------------
-- Function to use in statusline
-- -----------------------------
-- Return file path and modify flag
function GetFileName()
    local filename = vim.fn.expand('%:p')
    if vim.bo.modifiable == 0 then
        return filename..'-'
    elseif vim.bo.modified == 1 then
        return filename..'+'
    else
        return filename
    end
end

-- If it is help buffer, return 'Help'
function IsHelpBuffer()
    if vim.bo.buftype == 'help' then
        return 'Help'
    else
        return ''
    end
end

-- If it is preview buffer, return 'Prev'
function IsPreviewBuffer()
    if vim.wo.previewwindow == 1 then
        return 'Prev'
    else
        return ''
    end
end


-- -------------------------
-- Functio to use in tabline
-- -------------------------
-- Return the number of buffer at n's tabpage
function GetNumberOfBuffer(n)
    return vim.fn.tabpagewinnr(n, '$')
end


-- --------------------
-- Function for general
-- --------------------
-- Reflesh statusline
function UpdateStatusline()
    vim.opt.statusline = ''
end
