local hyprroot
if os.getenv("HYPRLAND_ROOT") then
    hyprroot = os.getenv("HYPRLAND_ROOT")
else
    hyprroot = os.getenv("HOME") .. "/.config/hypr"
end

local modules = hyprroot .. "/modules"
local p = io.popen('find -L "' .. modules .. '" -name "*.lua" -type f | sort')

if not p then return end

for path in p:lines() do
    local ok, error = pcall(dofile, path)
    if not ok then
        hl.notification.create({
            text = "autoload: " .. path .. '\n' .. tostring(error),
            timeout = 5000,
            icon = "warning",
        })
    end
end
