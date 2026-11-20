-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

--hl.env("XCURSOR_SIZE", "24")
--hl.env("HYPRCURSOR_SIZE", "24")

return {
    TERMINAL     = "kitty",
    FILE_MANAGER = "dolphin",
    HYPR_RUN     = "kitty -c NONE --class otter-launcher otter-launcher",
    BROWSER      = "zen",
    DSP_OUT_UTIL = "hyprshot -m region -o ~/Pictures/Screenshots/", -- Screenshot utility
}
