local M = {}

function M.strip_trailing_spaces ()
    local excluded_ft = { 'ruby', 'markdown', 'perl' }
    local ft = vim.bo.filetype
    for _, value in ipairs(excluded_ft) do
        if ft == value then
            return
        end
    end
    vim.cmd [[ %s/\s\+$//e ]]
end

return M
