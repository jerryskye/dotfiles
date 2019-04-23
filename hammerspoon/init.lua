hs.loadSpoon('ControlEscape'):start()
local vim_mode = hs.loadSpoon('VimMode')

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)

hs.hotkey.bind({'ctrl'}, '\\', function()
  vim_mode:enter()
end)
