local M = {}

function M.setup()
  -- No key mapping here now. Done in cmp.lua
  --vim.api.nvim_set_keymap('i', '<C-J>', , {silent = true, expr = true})
  
  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true
  vim.g.copilot_tab_fallback = ""

  vim.g.copilot_filetypes = {
    ["*"] = false,
    ["javascript"] = true,
    ["typescript"] = true,
    ["lua"] = false,
    ["rust"] = true,
    ["c"] = true,
    ["c#"] = true,
    ["c++"] = true,
    ["go"] = true,
    ["python"] = true,
    ["cmake"] = true,
    ["bash"] = true,
    ["sh"] = true,
  }

end

return M
