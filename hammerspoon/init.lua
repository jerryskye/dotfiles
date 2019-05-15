hs.loadSpoon('ControlEscape'):start()
local vim_mode = hs.loadSpoon('VimMode')

local slack_window_layout = {'Slack', 'move 0.0,0.0,0.8,1 Color'}
local itunes_window_layout = {{iTunes = {allowTitles = 'iTunes'}}, 'move 0.0,0.0,0.92,1 Color'}
local itunes_mini_player_layout = {{iTunes = {allowTitles = 'Mini Player'}}, 'move 0.8,0.0,0.8,1 Color'}
local imessage_window_layout = {'Messages', 'move 0.2,0.0,0.8,0.66 Color'}
local window_layouts = {
  hs.window.layout.new({
    slack_window_layout,
    itunes_mini_player_layout,
    itunes_window_layout,
    imessage_window_layout,
    {'iTerm2', 'fullscreen Color'},
    {'Firefox', 'fullscreen Color'}
  }):setScreenConfiguration({Color = true, MP59G = false, DELL = false}),
  hs.window.layout.new({
    slack_window_layout,
    itunes_mini_player_layout,
    itunes_window_layout,
    imessage_window_layout,
    {'iTerm2', 'fullscreen MP59G'},
    {'Firefox', 'fullscreen MP59G'}
  }):setScreenConfiguration({Color = true, MP59G = true, DELL = false}),
  hs.window.layout.new({
    slack_window_layout,
    itunes_mini_player_layout,
    itunes_window_layout,
    imessage_window_layout,
    {'iTerm2', 'fullscreen DELL'},
    {'Firefox', 'fullscreen MP59G'}
  }):setScreenConfiguration({Color = true, MP59G = true, DELL = true})
}

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

hs.hotkey.bind({'cmd', 'ctrl'}, 'P', function()
  local time_left = hs.itunes.getDuration() - hs.itunes.getPosition()
  hs.timer.doAfter(time_left, function()
    hs.itunes.pause()
    hs.itunes.setPosition(0)
  end)
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'L', function()
  for _,layout in pairs(window_layouts) do
    layout:apply()
  end
end)
