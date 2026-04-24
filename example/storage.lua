local gamepush = require("gamepush.gamepush")
local utils = require("example.utils")

local local_key = "example_storage_key"
local local_value = {
    level = 7,
    stars = 3
}
local global_key = "example_storage_global_key"
local global_value = "global-demo"

local function set_storage_platform()
    gamepush.storage.set_storage("platform")
    utils.to_log("Storage set type: platform")
end

local function set_storage_local()
    gamepush.storage.set_storage("local")
    utils.to_log("Storage set type: local")
end

local function set()
    gamepush.storage.set(local_key, local_value, function(result)
        utils.to_log("Storage set:", result)
    end)
end

local function get()
    gamepush.storage.get(local_key, function(result)
        utils.to_log("Storage get callback:", result)
    end)
    local result = gamepush.storage.get(local_key)
    utils.to_log("Storage get:", result)
end

local function set_global()
    gamepush.storage.set_global(global_key, global_value, function(result)
        utils.to_log("Storage set global:", result)
    end)
end

local function get_global()
    gamepush.storage.get_global(global_key, function(result)
        utils.to_log("Storage get global callback:", result)
    end)
    local result = gamepush.storage.get_global(global_key)
    utils.to_log("Storage get global:", result)
end

local M = {
    { name = "Set storage platform", callback = set_storage_platform },
    { name = "Set storage local", callback = set_storage_local },
    { name = "Set", callback = set },
    { name = "Get", callback = get },
    { name = "Set global", callback = set_global },
    { name = "Get global", callback = get_global },
}

gamepush.storage.callbacks.set = function(result)
    utils.to_console("Storage event set:", result)
end
gamepush.storage.callbacks.get = function(result)
    utils.to_console("Storage event get:", result)
end
gamepush.storage.callbacks.set_global = function(result)
    utils.to_console("Storage event set global:", result)
end
gamepush.storage.callbacks.get_global = function(result)
    utils.to_console("Storage event get global:", result)
end

return M
