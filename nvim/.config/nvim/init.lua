-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Function to find Godot project root directory
local function find_godot_project_root()
  local cwd = vim.fn.getcwd()
  local search_paths = { "", "/.." }

  for _, relative_path in ipairs(search_paths) do
    local project_file = cwd .. relative_path .. "/project.godot"
    if vim.uv.fs_stat(project_file) then
      return cwd .. relative_path
    end
  end

  return nil
end

-- Function to check if server is already running
local function is_server_running(project_path)
  local server_pipe = project_path .. "/server.pipe"
  return vim.uv.fs_stat(server_pipe) ~= nil
end

-- Function to start Godot server if needed
local function start_godot_server_if_needed()
  local godot_project_path = find_godot_project_root()

  if godot_project_path and not is_server_running(godot_project_path) then
    vim.fn.serverstart(godot_project_path .. "/server.pipe")
    return true
  end

  return false
end

-- Main execution
start_godot_server_if_needed()

-- define functions only for Godot projects
if is_godot_project then
  -- write breakpoint to new line
  vim.api.nvim_create_user_command("GodotBreakpoint", function()
    vim.cmd("normal! obreakpoint")
    vim.cmd("write")
  end, {})
  vim.keymap.set("n", "<leader>b", ":GodotBreakpoint<CR>")

  -- delete all breakpoints in current file
  vim.api.nvim_create_user_command("GodotDeleteBreakpoints", function()
    vim.cmd("g/breakpoint/d")
  end, {})
  vim.keymap.set("n", "<leader>BD", ":GodotDeleteBreakpoints<CR>")

  -- search all breakpoints in project
  vim.api.nvim_create_user_command("GodotFindBreakpoints", function()
    vim.cmd(":grep breakpoint | copen")
  end, {})
  vim.keymap.set("n", "<leader>BF", ":GodotFindBreakpoints<CR>")

  -- append "# TRANSLATORS: " to current line
  vim.api.nvim_create_user_command("GodotTranslators", function(opts)
    vim.cmd("normal! A # TRANSLATORS: ")
  end, {})
end
