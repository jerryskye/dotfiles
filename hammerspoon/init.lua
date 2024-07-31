hs.window.setFrameCorrectness = true

hs.hotkey.bind({'cmd', 'ctrl'}, 'R', function()
  hs.reload()
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'M', function()
  hs.application.launchOrFocus('Messages')
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'T', function()
  hs.application.launchOrFocus('Alacritty')
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'W', function()
  hs.application.launchOrFocus('Firefox')
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'S', function()
  hs.application.open('Slack'):activate(true)
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'P', function()
  local time_left = hs.itunes.getDuration() - hs.itunes.getPosition()
  hs.timer.doAfter(time_left, function()
    hs.itunes.pause()
    hs.itunes.setPosition(0)
  end)
end)

function distanceFromPrimaryScreen(screen)
  return hs.geometry.point(screen:position()):distance(0, 0)
end

function sort_screens(a, b)
  return distanceFromPrimaryScreen(a) > distanceFromPrimaryScreen(b)
end

function screens_table()
  local screens = hs.screen.allScreens()
  table.sort(screens, sort_screens)
  screens[2] = screens[2] or screens[1]
  screens[3] = screens[3] or screens[2]

  return screens
end

function oldestSlackWindowByID()
  local allSlackWindows = hs.application.find('Slack'):allWindows()
  table.sort(allSlackWindows, function(a, b) return a:id() < b:id() end)
  print(allSlackWindows[1]:title())
  return {allSlackWindows[1]}
end

hs.hotkey.bind({'cmd', 'ctrl'}, 'L', function()
  local screens = screens_table()

  hs.layout.apply({
    {"Firefox", nil, screens[1], hs.layout.maximized, nil, nil},
    {"Music", nil, screens[2], {x1=0.8, y1=0, w=0.2, h=1.0}, nil, nil},
    {"Messages", nil, screens[2], {x1=0.2, y1=0, w=0.6, h=0.66}, nil, nil},
    {"Slack", "%d+:%d+", screens[1], hs.layout.maximized, nil, nil},
    {"Slack", "screen share", screens[1], hs.layout.maximized, nil, nil},
    {"Slack", oldestSlackWindowByID, screens[2], hs.layout.maximized, nil, nil},
    {"Alacritty", nil, screens[1], hs.layout.maximized, nil, nil}
  }, string.match)
end)

hs.hotkey.bind({'cmd', 'ctrl'}, ';', function()
  local screens = screens_table()

  hs.layout.apply({
    {"Firefox", nil, screens[1], hs.layout.left50, nil, nil},
    {"Alacritty", nil, screens[1], hs.layout.right50, nil, nil},
  })
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'return', function()
  hs.caffeinate.startScreensaver()
end)
