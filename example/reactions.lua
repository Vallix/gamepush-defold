local gamepush = require("gamepush.gamepush")
local utils = require("example.utils")

local reaction_params = {
    entityType = "FILE",
    entityId = "demo-entity",
    reactionType = "like"
}

local function set()
    gamepush.reactions.set(reaction_params, function(result)
        utils.to_log("Reactions set:", result)
    end)
end

local function unset()
    gamepush.reactions.unset(reaction_params, function(result)
        utils.to_log("Reactions unset:", result)
    end)
end

local M = {
    { name = "Set reaction", callback = set },
    { name = "Unset reaction", callback = unset },
}

gamepush.reactions.callbacks.set = function(result)
    utils.to_console("Reactions set:", result)
end
gamepush.reactions.callbacks.unset = function(result)
    utils.to_console("Reactions unset:", result)
end
gamepush.reactions.callbacks.set_error = function(error)
    utils.to_console("Reactions set error:", error)
end
gamepush.reactions.callbacks.unset_error = function(error)
    utils.to_console("Reactions unset error:", error)
end
gamepush.reactions.callbacks.event_set = function(result)
    utils.to_console("Reactions event set:", result)
end
gamepush.reactions.callbacks.event_unset = function(result)
    utils.to_console("Reactions event unset:", result)
end

return M
