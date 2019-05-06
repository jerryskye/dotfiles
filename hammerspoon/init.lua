hs.loadSpoon('ControlEscape'):start()
local vim_mode = hs.loadSpoon('VimMode')

hs.hotkey.bind({'cmd', 'ctrl'}, 'R', function()
  hs.reload()
end)

hs.hotkey.bind({'ctrl'}, '\\', function()
  vim_mode:enter()
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'M', function()
  hs.application.launchOrFocus('Messages')
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'T', function()
  hs.application.launchOrFocus('iTerm')
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'W', function()
  hs.application.launchOrFocus('Firefox')
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'S', function()
  hs.application.launchOrFocus('Slack')
end)
