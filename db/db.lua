db = {}

local function space_script_src_init()
    space_name = "script_src"
    if box.space[space_name] ~= nil then
        return
    end
    s = box.schema.space.create(space_name)
    s:format(
        {
            {name = "id", type = "unsigned"},
            {name = "report_time", type = "unsigned"},
            {name = "report_only", type = "boolean"},
            {name = "blocked_uri", type = "string"},
            {name = "document_uri", type = "string"},
            {name = "source_file", type = "string"},
            {name = "line_number", type = "number"},
            {name = "column_number", type = "number"},
            {name = "referer", type = "string"}
        }
    )
    seq = box.schema.sequence.create("script_src_s", {min = 1})
    s:create_index("primary", {sequence = "script_src_s"})
end

function db.init()
    space_script_src_init()
end

return db
