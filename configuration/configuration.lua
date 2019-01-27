configuration = {}

local config = require("config.config")

local function add_user(name, pass)
    if pass == nil then
        box.schema.user.create(name, {if_not_exists = true})
    else
        box.schema.user.create(name, {password = pass, if_not_exists = true})
    end
    box.schema.user.grant(name, "read,write,execute", "universe", nil, {if_not_exists = true})
end

function configuration.init()
    opt = config.options
    port = 3301
    if opt.port ~= nil then
        port_parsed = tonumber(opt.port)
        if port_parsed ~= nil then
            port = port_parsed
        end
    end
    box.cfg {listen = port}
    if opt.user ~= nil then
        add_user(opt.user, opt.pass)
    end
end

return configuration
