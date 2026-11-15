--------------------
--- Config files ---
--------------------

local hyprroot
if os.getenv("HYPRLAND_ROOT") then
    hyprroot = os.getenv("HYPRLAND_ROOT")
else
    hyprroot = os.getenv("HOME") .. "/.config/hypr"
end
pcall(dofile, hyprroot .. "/autoload.lua")


------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "20")

 hl.on("hyprland.start", function () 
   hl.exec_cmd("kitty")
   hl.exec_cmd("nm-applet")
   hl.exec_cmd("udiskie")
   hl.exec_cmd("awww-daemon && awww img " .. os.getenv("HOME") .. "/.background.png")
   hl.exec_cmd("quickshell")
   hl.exec_cmd("systemctl --user start hyprpolkitagent")
   hl.exec_cmd("dunst")
end)
