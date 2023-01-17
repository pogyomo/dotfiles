-- Keymaps for normal mode
-- Move display line.
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Keymaps for terminal mode
-- Enable to exit from terminal mode by <ESC> like insert mode
vim.keymap.set("t", "<ESC>", "<C-\\><C-N>")

-- Better escape
local timer = nil
vim.on_key(function(key)
    if key ~= "j" and timer then
        timer:stop()
        timer:close()
        timer = nil
    end
end)
vim.keymap.set("i", "j", function()
    if timer then
        return "<bs><esc>"
    else
        timer = vim.loop.new_timer()
        timer:start(500, 0, function()
            timer:stop()
            timer:close()
            timer = nil
        end)
        return "j"
    end
end, { expr = true })
