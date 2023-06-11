local status_ok, dap_python = pcall(require, "dap-python")
if not status_ok then
  return
end

dap_python.test_runner = "pytest"
dap_python.setup "~/.virtualenvs/debugpy/bin/python"
