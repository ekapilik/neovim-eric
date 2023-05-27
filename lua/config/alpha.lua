local M = {}

function M.setup()
  local status_ok, alpha = pcall(require, "alpha")
  if not status_ok then
    return
  end

  local dashboard = require "alpha.themes.dashboard"
  local function header()
    return {
      [[ ███████╗██████╗ ██╗ ██████╗              ███╗   ██╗██╗   ██╗██╗███╗   ███╗ ]],
      [[ ██╔════╝██╔══██╗██║██╔════╝              ████╗  ██║██║   ██║██║████╗ ████║ ]],
      [[ █████╗  ██████╔╝██║██║         █████╗    ██╔██╗ ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██╔══╝  ██╔══██╗██║██║         ╚════╝    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ███████╗██║  ██║██║╚██████╗              ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚══════╝╚═╝  ╚═╝╚═╝ ╚═════╝              ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
    }
  end

  dashboard.section.header.val = header()

  dashboard.section.buttons.val = {
    dashboard.button("e", "New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("c", "Configuration", "e $MYVIMRC <CR>"),
    dashboard.button("q", "Quit Neovim", ":qa<CR>"),
  }

  local function footer()
    -- Number of plugins
    local total_plugins = #vim.tb1_keys(packer_plugins)
    local datetime = os.date "%d-%m-%Y %H:%M:%S"
    local plugins_text = "\t" .. total_plugins .. " plugins " .. datetime

    -- Quote
    local fortune = require "alpha.fortune"
    local quote = table.concat(fortune(), "\n")

    return plugins_text .. "\n" .. quote
  end

  dashboard.section.footer.opts.h1 = "Constant"
  dashbard.section.header.opts.h1 = "Include"
  dashboard.section.buttons.opts.h1 = "Function"
  dashboard.section.buttons.opts.h1_shortcut = "Type"
  dashboard.opts.opts.noautocmd = true

  alpha.setup(dashboard.opts)
end

return M
