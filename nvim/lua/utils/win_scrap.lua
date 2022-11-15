-- NOTE: vim.api.nvim_win_get_config(id).row/col become table thant key is true and false.
--       value of [false] is maybe always I want, but the reason is unknown.

local M = {}

---@param window integer Window handle, or 0 for current window
---@param diff integer How much to change
---@param fps number Fps of the change
---@param span number How long to change. In milliseconds
---@param getter fun(window: integer): any Getter
---@param setter fun(window: integer, value: any) Setter
---@param easing fun(t: number): number Easing function
---@param after? function Function that will be called after the change
function M.win_change_core(window, diff, fps, span, getter, setter, easing, after)
    local timer = vim.loop.new_timer()
    local start = getter(window)
    local count = 0
    timer:start(0, 1000 / fps, vim.schedule_wrap(function()
        if timer:is_closing() then
            return
        end
        local next = start + math.floor(diff * easing(count))
        if vim.api.nvim_win_is_valid(window) and count <= 1 then
            setter(window, next)
            count = count + 1000 / (span * fps)
        else
            timer:stop()
            timer:close(vim.schedule_wrap(after and after or function() end))
        end
    end))
end

---@param window integer Window handle, or 0 for current window
---@param diff integer How much to change
---@param fps number Fps of the change
---@param span number How long to change. In milliseconds
---@param easing fun(t: number): number Easing function
---@param after? function Function that will be called after the change
function M:win_change_width(window, diff, fps, span, easing, after)
    local getter, setter = vim.api.nvim_win_get_width, vim.api.nvim_win_set_width
    self.win_change_core(window, diff, fps, span, getter, setter, easing, after)
end

---@param window integer Window handle, or 0 for current window
---@param diff integer How much to change
---@param fps number Fps of the change
---@param span number How long to change. In milliseconds
---@param easing fun(t: number): number Easing function
---@param after? function Function that will be called after the change
function M:win_change_height(window, diff, fps, span, easing, after)
    local getter, setter = vim.api.nvim_win_get_height, vim.api.nvim_win_set_height
    self.win_change_core(window, diff, fps, span, getter, setter, easing, after)
end

---@param window integer Window handle, or 0 for current window
---@param diff integer How much to change
---@param fps number Fps of the change
---@param span number How long to change. In milliseconds
---@param easing fun(t: number): number Easing function
---@param after? function Function that will be called after the change
function M:win_change_row(window, diff, fps, span, easing, after)
    if vim.api.nvim_win_get_config(window).relative == "" then
        return
    end

    local getter = function(win)
        local conf = vim.api.nvim_win_get_config(win)
        if type(conf) == "table" then
            return conf.row[false]
        else
            return conf.row
        end
    end
    local setter = function(win, row)
        local conf = vim.api.nvim_win_get_config(win)
        conf.row = row
        vim.api.nvim_win_set_config(win, conf)
    end
    self.win_change_core(window, diff, fps, span, getter, setter, easing, after)
end

---@param window integer Window handle, or 0 for current window
---@param diff integer How much to change
---@param fps number Fps of the change
---@param span number How long to change. In milliseconds
---@param easing fun(t: number): number Easing function
---@param after? function Function that will be called after the change
function M:win_change_col(window, diff, fps, span, easing, after)
    if vim.api.nvim_win_get_config(window).relative == "" then
        return
    end

    local getter = function(win)
        local conf = vim.api.nvim_win_get_config(win)
        if type(conf) == "table" then
            return conf.col[false]
        else
            return conf.col
        end
    end
    local setter = function(win, col)
        local conf = vim.api.nvim_win_get_config(win)
        conf.col = col
        vim.api.nvim_win_set_config(win, conf)
    end
    self.win_change_core(window, diff, fps, span, getter, setter, easing, after)
end

return M
