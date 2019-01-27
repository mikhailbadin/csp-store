--[[
    Program: CSP store
    Description:
        This program need to init TDB as store for using by CSP Aggregator.
    License:
        See LICENSE file in project root directory
    Developers:
        Mikhail Badin <mikhail.badin@gmail.com>
]]
local config = require("config.config")
local db = require("db.db")
local configuration = require("configuration.configuration")

-- Initialize TDB with parameters
local function init()
    config.init()
    configuration.init()
    db.init()
end

init()
