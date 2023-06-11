M = {}

local function run_command(command)
  local handle = io.popen(command)
  local result = handle:read "*a"
  local rc = { handle:close() }
  if rc[1] ~= true then
    error("Returned error from command: " .. command)
  end
  return result
end

function M.which(binary)
  local result = run_command("which" .. " " .. binary)
  result = result:gsub("[\n\r]", "")
  return result
end

return M
