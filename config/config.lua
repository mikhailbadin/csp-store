config = {}

local option_port_env = "TARANTOOL_PORT"
local option_user_env = "TARANTOOL_USER"
local option_pass_env = "TARANTOOL_PASS"

local function get_tarantool_options()
    return {
        port = os.getenv(option_port_env),
        user = os.getenv(option_user_env),
        pass = os.getenv(option_pass_env)
    }
end

function config.init()
    config["options"] = get_tarantool_options()
end

return config
