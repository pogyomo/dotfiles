-- NOTE: vim.api.nvim_win_get_config(id).row/col become table thant key is true and false.
--       value of [false] is maybe always I want, but the reason is unknown.

local utils = require("lua.utils")

local M = {}

---@param window integer Window handle, or 0 for current window
---@param diff integer How much to change
---@param fps number Fps of the change
---@param span number How long to change. In milliseconds
---@param easing fun(t: number): number Easing function
---@param after? function Function that will be called after the change
function M.win_change_width(window, diff, fps, span, easing, after)
    local getter = function()
        return vim.api.nvim_win_get_width(window)
    end
    local setter = function(v)
        vim.api.nvim_win_set_width(window, v)
    end
    utils.resize(diff, fps, span, getter, setter, easing, after)
end

---@param window integer Window handle, or 0 for current window
---@param diff integer How much to change
---@param fps number Fps of the change
---@param span number How long to change. In milliseconds
---@param easing fun(t: number): number Easing function
---@param after? function Function that will be called after the change
function M:win_change_height(window, diff, fps, span, easing, after)
    local getter = function()
        return vim.api.nvim_win_get_height(window)
    end
    local setter = function(v)
        vim.api.nvim_win_set_height(window, v)
    end
    utils.resize(diff, fps, span, getter, setter, easing, after)
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

    local getter = function()
        local conf = vim.api.nvim_win_get_config(window)
        if type(conf) == "table" then
            return conf.row[false]
        else
            return conf.row
        end
    end
    local setter = function(row)
        local conf = vim.api.nvim_win_get_config(window)
        conf.row = row
        vim.api.nvim_win_set_config(window, conf)
    end
    utils.resize(diff, fps, span, getter, setter, easing, after)
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

    local getter = function()
        local conf = vim.api.nvim_win_get_config(window)
        if type(conf) == "table" then
            return conf.col[false]
        else
            return conf.col
        end
    end
    local setter = function(col)
        local conf = vim.api.nvim_win_get_config(window)
        conf.col = col
        vim.api.nvim_win_set_config(window, conf)
    end
    utils.resize(diff, fps, span, getter, setter, easing, after)
end

return M
