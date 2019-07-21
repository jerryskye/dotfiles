hs.loadSpoon('ControlEscape'):start()
local vim_mode = hs.loadSpoon('VimMode')

hs.hotkey.bind({'cmd', 'ctrl'}, 'R', function()
  hs.reload()
end)

hs.hotkey.bind({'cmd', 'ctrl'}, '\\', function()
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

function fullScreenAppMainWindow(app_name, screen)
  local app = hs.application.find(app_name)
  if app then
    app:mainWindow():moveToScreen(screen):setFullScreen(true)
  end
end

function distanceFromPrimaryScreen(screen)
  return hs.geometry.point(screen:position()):distance(0, 0)
end

hs.hotkey.bind({'cmd', 'ctrl'}, 'L', function()
  local screens = hs.screen.allScreens()
  table.sort(screens, function(a, b)
    return distanceFromPrimaryScreen(a) < distanceFromPrimaryScreen(b)
  end)
  screens[2] = screens[2] or screens[1]
  screens[3] = screens[3] or screens[2]

  local mini_player_width = 288
  local screen_width = screens[1]:frame().w
  local mini_player_unit_w = mini_player_width / screen_width
  local mini_player_unit_x1 = 1 - mini_player_unit_w
  hs.layout.apply({
    {"Firefox", nil, screens[2], hs.layout.maximized, nil, nil},
    {"iTunes", "Mini Player", screens[1], {mini_player_unit_x1, 0, mini_player_unit_w, 1}, nil, nil},
    {"iTunes", "iTunes", screens[1], '0,0, 0.92,1', nil, nil},
    {"Messages", nil, screens[1], {x1=0.2, y1=0, x2=mini_player_unit_x1, y2=0.66}, nil, nil},
    {"Slack", nil, screens[1], {x1=0, y1=0, x2=mini_player_unit_x1, y2=1}, nil, nil}
  })
  fullScreenAppMainWindow('iterm', screens[3])
end)
