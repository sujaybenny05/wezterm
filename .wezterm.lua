local wezterm = require 'wezterm'


wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
        local folder_name = "WezTerm"

        local cwd_uri = tab.active_pane and tab.active_pane.current_working_dir
        if cwd_uri then
                -- convert URI to string safely
                local cwd_str = tostring(cwd_uri)
                -- remove file:// prefix if it exists
                cwd_str = cwd_str:gsub("^file://", "")
                -- extract last folder name
                folder_name = cwd_str:match(".*/(.*)$") or cwd_str
        end

        return folder_name
end)


return {
        keys = {
                -- Vertical split: Cmd + Shift + V
                {
                        key = "V",
                        mods = "CMD|SHIFT",
                        action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
                },
                -- Horizontal split: Cmd + Shift + H
                {
                        key = "H",
                        mods = "CMD|SHIFT",
                        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
                },
                -- Move focus between panes using Cmd + Alt + Arrow keys
                { key = "LeftArrow",  mods = "CMD|ALT", action = wezterm.action.ActivatePaneDirection "Left" },
                { key = "RightArrow", mods = "CMD|ALT", action = wezterm.action.ActivatePaneDirection "Right" },
                { key = "UpArrow",    mods = "CMD|ALT", action = wezterm.action.ActivatePaneDirection "Up" },
                { key = "DownArrow",  mods = "CMD|ALT", action = wezterm.action.ActivatePaneDirection "Down" },
                -- Close current tab with Cmd + W
                {
                        key = "W",
                        mods = "CMD",
                        action = wezterm.action.CloseCurrentTab { confirm = true },
                },
                -- Close current pane with Cmd + Shift + W
                {
                        key = "W",
                        mods = "CMD|SHIFT",
                        action = wezterm.action.CloseCurrentPane { confirm = true },
                },

                -- Resize current pane with Cmd + j/k/h/l
                {
                        key = "J",
                        mods = "CMD",
                        action = wezterm.action.AdjustPaneSize { "Down", 5 },
                },
                {
                        key = "K",
                        mods = "CMD",
                        action = wezterm.action.AdjustPaneSize { "Up", 5 },
                },
                {
                        key = "H",
                        mods = "CMD",
                        action = wezterm.action.AdjustPaneSize { "Left", 5 },
                },
                {
                        key = "L",
                        mods = "CMD",
                        action = wezterm.action.AdjustPaneSize { "Right", 5 },
                },
        },
}
