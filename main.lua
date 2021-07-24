local rotateRight = true
local titleAngle = -0.5
local timer = 0
local currentState = 0
local cursorY = 115
love.keyboard.setKeyRepeat(false)

--currentStates: 0 (menu), 1 (game), 2 (settings), etc

function love.load()
  --fullscreen (if necessary)
  --love.window.setFullscreen(true, "desktop")
  --loading the images
  greyp = love.graphics.newImage("img/greyp.png")
  redp = love.graphics.newImage("img/redp.png")
  greenp = love.graphics.newImage("img/greenp.png")
  whitep = love.graphics.newImage("img/whitep.png")
  bluep = love.graphics.newImage("img/bluep.png")
  board = love.graphics.newImage("img/board.png")
  title = love.graphics.newImage("img/title.png")
  start = love.graphics.newImage("img/start.png")
  cursor = love.graphics.newImage("img/cursor.png")
  setting = love.graphics.newImage("img/setting.png")
  chplayer = love.graphics.newImage("img/chplayer.png")
  p1 = love.graphics.newImage("img/player1.png")
end


function love.update(dt)
  if currentState == 0 then
    --rotating the ur. symbol
    if rotateRight then
      titleAngle = titleAngle + 0.01
    else
      titleAngle = titleAngle - 0.01
    end

    timer = timer + 1

    if timer==100 then
      timer = 0
      rotateRight = not rotateRight
    end

    if love.keyboard.isDown("space") then
      if cursorY == 115 then
        currentState = 1
      elseif cursorY == 215 then
        currentState = 2
      end
    end

    if love.keyboard.isDown("down") then
      if cursorY == 115 then
        cursorY = 215
      end
    end



    if love.keyboard.isDown("up") then
      if cursorY == 215 then
        cursorY = 115
      elseif cursorY == 315 then
        cursorY = 215
      end
    end

  if love.keyboard.isDown("w") then
      currentState = 0
  end

  end


end

function love.draw()
  if currentState == 0 then
    love.graphics.setBackgroundColor(128, 0, 128)
    love.graphics.draw(title, 400, 75, titleAngle, 1, 1, 55, 22)
    love.graphics.draw(start, 300, 150)
    love.graphics.draw(greyp, 175, cursorY)
    love.graphics.draw(setting, 300, 250)
  end

  if currentState == 1 then
    love.graphics.draw(chplayer, 100, 50)
    love.graphics.draw(p1, 300, 500)
    love.graphics.draw(redp, 95, 200, 0, 2)
    love.graphics.draw(greyp, 195, 210, 0, 2)
    love.graphics.draw(bluep, 295, 210, 0, 2)
    love.graphics.draw(whitep, 395, 210, 0, 2)
    love.graphics.draw(greenp, 495, 210, 0, 2)
  end

  if currentState == 2 then
    love.graphics.print("dont have this in the game yet, so have a thing", 225, 200)
    love.graphics.draw(redp, 300, 300)
  end
end
