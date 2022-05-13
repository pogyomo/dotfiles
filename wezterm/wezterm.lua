local wezterm = require'wezterm'

return {
    color_scheme = 'OneHalfDark',

    font      = wezterm.font('HackGenNerd Console'),
    font_size = 14.0,

    window_padding = {
        left   = 0,
        right  = 0,
        top    = 0,
        bottom = 0
    },

    initial_cols = 120,
    initial_rows = 36,
    window_background_opacity = 0.9
}
