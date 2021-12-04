-- -----------------
-- Standard settings
-- -----------------
-- It should be written
vim.cmd[[packadd packer.nvim]]

-- Plugin that will be managed by packer
return require('packer').startup(function()
    -- Packer should be maneged by itself
    use'wbthomason/packer.nvim'

    -- Colorscheme
    use{
        'tomasr/molokai',
        config = function()
            vim.cmd('colorscheme molokai')
        end
    }

    -- Easymotion like plugin
    use{
        'phaazon/hop.nvim',
        config = function()
            require'hop'.setup()
        end
    }          

end)
