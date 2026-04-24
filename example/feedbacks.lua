local gamepush = require("gamepush.gamepush")
local utils = require("example.utils")

local feedback_id = nil

local function send()
    local parameters = {
        type = "SUGGESTION",
        text = "Example feedback from Defold module",
        files = {}
    }
    gamepush.feedbacks.send(parameters, function(result)
        if result and result.id then
            feedback_id = result.id
        end
        utils.to_log("Feedbacks send:", result)
    end)
end

local function open()
    gamepush.feedbacks.open(nil, function(result)
        utils.to_log("Feedbacks open:", result)
    end)
end

local function open_feedback()
    local id = feedback_id or "1"
    gamepush.feedbacks.open_feedback({ feedbackId = tostring(id) }, function(result)
        utils.to_log("Feedbacks open feedback:", result)
    end)
end

local function fetch()
    gamepush.feedbacks.fetch(nil, function(result)
        if result and result.items and #result.items > 0 and result.items[1].id then
            feedback_id = result.items[1].id
        end
        utils.to_log("Feedbacks fetch:", result)
    end)
end

local function fetch_more()
    gamepush.feedbacks.fetch_more({ limit = 5 }, function(result)
        utils.to_log("Feedbacks fetch more:", result)
    end)
end

local function send_message()
    local id = feedback_id or "1"
    local parameters = {
        feedbackId = tostring(id),
        text = "Example message from Defold",
        files = {}
    }
    gamepush.feedbacks.send_message(parameters, function(result)
        utils.to_log("Feedbacks send message:", result)
    end)
end

local M = {
    { name = "Send", callback = send },
    { name = "Open", callback = open },
    { name = "Open feedback", callback = open_feedback },
    { name = "Fetch", callback = fetch },
    { name = "Fetch more", callback = fetch_more },
    { name = "Send message", callback = send_message },
}

gamepush.feedbacks.callbacks.create_feedback = function(result)
    utils.to_console("Feedbacks create:", result)
end
gamepush.feedbacks.callbacks.error_create_feedback = function(error)
    utils.to_console("Feedbacks create error:", error)
end
gamepush.feedbacks.callbacks.open_feedbacks_list = function()
    utils.to_console("Feedbacks open list")
end
gamepush.feedbacks.callbacks.error_open_feedbacks_list = function(error)
    utils.to_console("Feedbacks open list error:", error)
end
gamepush.feedbacks.callbacks.fetch_feedbacks = function(result)
    utils.to_console("Feedbacks fetch:", result)
end
gamepush.feedbacks.callbacks.error_fetch_feedbacks = function(error)
    utils.to_console("Feedbacks fetch error:", error)
end
gamepush.feedbacks.callbacks.fetch_more_feedbacks = function(result)
    utils.to_console("Feedbacks fetch more:", result)
end
gamepush.feedbacks.callbacks.error_fetch_more_feedbacks = function(error)
    utils.to_console("Feedbacks fetch more error:", error)
end
gamepush.feedbacks.callbacks.send_message = function(result)
    utils.to_console("Feedbacks send message:", result)
end
gamepush.feedbacks.callbacks.error_send_message = function(error)
    utils.to_console("Feedbacks send message error:", error)
end
gamepush.feedbacks.callbacks.event_feedback_message = function(result)
    utils.to_console("Feedbacks event message:", result)
end
gamepush.feedbacks.callbacks.event_feedback_created = function(result)
    utils.to_console("Feedbacks event created:", result)
end
gamepush.feedbacks.callbacks.event_feedback_status_updated = function(result)
    utils.to_console("Feedbacks event status updated:", result)
end
gamepush.feedbacks.callbacks.event_feedback_platform_status_updated = function(result)
    utils.to_console("Feedbacks event platform status updated:", result)
end

return M
