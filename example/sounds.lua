local gamepush = require("gamepush.gamepush")
local utils = require("example.utils")

local function is_muted()
    utils.to_log("Sounds is muted:", tostring(gamepush.sounds.is_muted()))
end

local function is_sfx_muted()
    utils.to_log("Sounds is sfx muted:", tostring(gamepush.sounds.is_sfx_muted()))
end

local function is_music_muted()
    utils.to_log("Sounds is music muted:", tostring(gamepush.sounds.is_music_muted()))
end

local function mute()
    gamepush.sounds.mute()
    utils.to_log("Sounds mute")
end

local function unmute()
    gamepush.sounds.unmute()
    utils.to_log("Sounds unmute")
end

local function mute_sfx()
    gamepush.sounds.mute_sfx()
    utils.to_log("Sounds mute sfx")
end

local function unmute_sfx()
    gamepush.sounds.unmute_sfx()
    utils.to_log("Sounds unmute sfx")
end

local function mute_music()
    gamepush.sounds.mute_music()
    utils.to_log("Sounds mute music")
end

local function unmute_music()
    gamepush.sounds.unmute_music()
    utils.to_log("Sounds unmute music")
end

local M = {
    { name = "Is muted", callback = is_muted },
    { name = "Is sfx muted", callback = is_sfx_muted },
    { name = "Is music muted", callback = is_music_muted },
    { name = "Mute", callback = mute },
    { name = "Unmute", callback = unmute },
    { name = "Mute sfx", callback = mute_sfx },
    { name = "Unmute sfx", callback = unmute_sfx },
    { name = "Mute music", callback = mute_music },
    { name = "Unmute music", callback = unmute_music },
}

return M
