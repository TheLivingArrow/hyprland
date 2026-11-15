--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful
conf = require("../Config")

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)
-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})
hl.window_rule({
  match = { class = conf.BROWSER },
  workspace = 2,
})
hl.window_rule({
  match = { class = "discord" },
  workspace = 3,
})
hl.window_rule({
  match = { class = "vesktop" },
  workspace = 3,
})
hl.window_rule({
  match = { tag = "mustFloat" },
  float = true,
})


----------------------
--- Workspace Rules---
----------------------

hl.workspace_rule({ workspace = "s[true]", 
                    layout = "scrolling", 
                    layout_opts = { direction = "right" },
})
hl.workspace_rule({
  workspace = "s[false]";
  layout = "scrolling",
  layout_opts = { direction = "down",},
})

hl.config({ scrolling = {
  fullscreen_on_one_column = true,
  column_width = 1.0;
} })

-------------------
--- Tag Section ---
-------------------

hl.window_rule({ match = { modal = true},                     tag = "+mustFloat"})
hl.window_rule({ match = { title = "Buy Robux"},              tag = "+mustFloat"})
hl.window_rule({ match = { class = "hyprland-share-picker"},  tag = "+mustFloat"})
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk"}, tag = "+mustFloat"})
hl.window_rule({ match = { class = conf.BROWSER, 
                           title = "Picture-in-Picture"},     tag = "+mustFloat", size = {480, 270}})
