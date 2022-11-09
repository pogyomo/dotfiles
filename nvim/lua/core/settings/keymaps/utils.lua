local M = {}

---@param direction string
---@return boolean
function M.win_is_movable_to(direction)
    local table = {
        left  = "h",
        right = "l",
        up    = "k",
        down  = "j",
    }

    local from = vim.api.nvim_get_current_win()
    vim.cmd.wincmd(table[direction])
    local to = vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(from)

    return from ~= to
end

---@param direction string
function M:win_resize_to(direction)
    local table = {
        left = {
            [true] = ">",
            [false] = "<LT>"
        },
        right = {
            [true] = ">",
            [false] = "<LT>"
        },
        down = {
            [true]  = "+",
            [false] = "-"
        },
        up = {
            [true]  = "+",
            [false] = "-"
        },
    }

    -- Prevent that command line moves
    if direction == "up" or direction == "down" then
        if not (self.win_is_movable_to("up") or self.win_is_movable_to("down")) then
            return
        end
    end

    if direction == "left" and self.win_is_movable_to("left") and self.win_is_movable_to("right") then
        vim.api.nvim_input("5<C-w>" .. "<LT>")
        return
    end

    if direction == "up" and self.win_is_movable_to("up") and self.win_is_movable_to("down") then
        vim.api.nvim_input("5<C-w>" .. "-")
        return
    end

    local movability = self.win_is_movable_to(direction)
    vim.api.nvim_input("5<C-w>" .. table[direction][movability])
end

return M
