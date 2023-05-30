local M = {}

function M.setup()
  vim.api.nvim_set_keymap('i', '<script>', [[<Cmd>lua require('copilot').Accept('<CR>')<CR>]], {silent = true, expr = true})
  vim.g.copilot_no_tab_map = true
end

return M
