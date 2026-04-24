local gamepush = require("gamepush.gamepush")
local utils = require("example.utils")

local unique_tag = "login"
local unique_value = "defold_player_demo"

local function register()
    gamepush.uniques.register({ tag = unique_tag, value = unique_value }, function(result)
        utils.to_log("Uniques register:", result)
    end)
end

local function check()
    gamepush.uniques.check({ tag = unique_tag, value = unique_value }, function(result)
        utils.to_log("Uniques check:", result)
    end)
end

local function get()
    local result = gamepush.uniques.get(unique_tag)
    utils.to_log("Uniques get:", result)
end

local function list()
    local result = gamepush.uniques.list()
    utils.to_log("Uniques list:", result)
end

local function delete()
    gamepush.uniques.delete({ tag = unique_tag }, function(result)
        utils.to_log("Uniques delete:", result)
    end)
end

local M = {
    { name = "Register", callback = register },
    { name = "Check", callback = check },
    { name = "Get", callback = get },
    { name = "List", callback = list },
    { name = "Delete", callback = delete },
}

gamepush.uniques.callbacks.register = function(result)
    utils.to_console("Uniques register:", result)
end
gamepush.uniques.callbacks.error_register = function(error)
    utils.to_console("Uniques register error:", error)
end
gamepush.uniques.callbacks.check = function(result)
    utils.to_console("Uniques check:", result)
end
gamepush.uniques.callbacks.error_check = function(error)
    utils.to_console("Uniques check error:", error)
end
gamepush.uniques.callbacks.delete = function(result)
    utils.to_console("Uniques delete:", result)
end
gamepush.uniques.callbacks.error_delete = function(error)
    utils.to_console("Uniques delete error:", error)
end

return M
