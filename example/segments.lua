local gamepush = require("gamepush.gamepush")
local utils = require("example.utils")

local tag = "VIP"

local function list()
    local segments = gamepush.segments.list()
    if next(segments) == nil then
        utils.to_log("Segments list is empty in current mock config")
        return
    end
    utils.to_log("Segments list:", segments)
end

local function has()
    utils.to_log(string.format("Segments has '%s': %s", tag, tostring(gamepush.segments.has(tag))))
end

local M = {
    { name = "List", callback = list },
    { name = "Has(VIP)", callback = has },
}

gamepush.segments.callbacks.enter = function(segment_tag)
    utils.to_console("Segment enter:", segment_tag)
end
gamepush.segments.callbacks.leave = function(segment_tag)
    utils.to_console("Segment leave:", segment_tag)
end

return M
