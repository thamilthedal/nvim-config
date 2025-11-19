-- lua/run_keymaps.lua
local M = {}

function M.setup()
  -- Check which OS we are on.
  -- vim.loop.os_uname() is the built-in Lua way to do this.
  local is_windows = vim.loop.os_uname().sysname:find("Windows")

  local python_cmd = "python3"
  local pause_cmd = "read -p 'Press any key to close...' -n 1 -s"

  if is_windows then
    -- On Windows, the command is 'python' (or 'py'), not 'python3'
    python_cmd = "python"
    
    -- There is no 'read -n 1 -s'. The best equivalent is 'echo' + 'pause > nul'
    -- & is the command chain character for cmd.exe
    pause_cmd = "echo Press any key to close... & pause > nul"
  end

  vim.keymap.set('n', '<C-b>', function()
    -- First, save the current file
    vim.cmd('w')

    local ft = vim.bo.filetype
    local run_cmd = "" -- This will hold the shell command to run

    if ft == 'python' then
      -- Build the cross-platform command
      -- % expands to the full file path.
      run_cmd = python_cmd .. " % & " .. pause_cmd

    elseif ft == 'tex' then
      -- pdflatex works the same on both.
      run_cmd = "pdflatex main.tex & " .. pause_cmd

    else
      vim.notify("No build action defined for filetype: " .. ft, vim.log.levels.WARN)
      return -- Stop the function if no command is set
    end

    -- Open a vertical split and run the command in a terminal
    vim.cmd([[vsplit | terminal ]] .. run_cmd)

  end, {
    noremap = true,
    silent = true,
    desc = "Save and run in new terminal split (Cross-Platform)"
  })
end

return M
