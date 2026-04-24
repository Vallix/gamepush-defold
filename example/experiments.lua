local gamepush = require("gamepush.gamepush")
local utils = require("example.utils")

local experiment_tag = "EASY_LEVEL"
local cohort_tag = "easy"

local function map()
    utils.to_log("Experiments map:", gamepush.experiments.map())
end

local function has()
    local result = gamepush.experiments.has(experiment_tag, cohort_tag)
    utils.to_log(string.format("Experiments has '%s'/'%s': %s", experiment_tag, cohort_tag, tostring(result)))
end

local M = {
    { name = "Map", callback = map },
    { name = "Has(EASY_LEVEL/easy)", callback = has },
}

return M
