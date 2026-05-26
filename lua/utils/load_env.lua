local M = {}

function M.load_env(path)
    if not path then
        path = vim.fn.stdpath("config") .. "/.env"
    end
    local file = io.open(path, "r")
    if not file then return end

    for line in file:lines() do
        local key, value = line:match("^%s*([%w_]+)%s*=%s*\"?(.-)\"?%s*$")
        if key and value then
            vim.fn.setenv(key, value)
        end
    end
    file:close()
end

return M
