local perso = {}
local largeur, hauteur

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  print("Largeur : ",largeur)
  print("hauteur : ",hauteur)
  initPerso()
end

function love.update(dt)
  switchOrigin()
  movePerso()
  rotatePerso()
  scalingPerso()
end

function love.draw()
  love.graphics.draw(perso.img, perso.x, perso.y, perso.radian, perso.scale_x, perso.scale_y, perso.ox, perso.oy)
  MyPrint()
  myRedDot(perso.ox, perso.oy)
end

function MyPrint()
  love.graphics.print("x = ".. perso.x, 10, 10)
  love.graphics.print("y = ".. perso.y, 10, 25)
  love.graphics.print("actual origin: " .. perso.origin, 10, 40)
  love.graphics.print("c for origin Bottom right | f for origin at Top left | r for origin at Center ", 10, 60)
end 

function initPerso()
  perso["img"] = love.graphics.newImage("images/personnage.png")
  perso["x"] =  largeur/2 - perso.img:getWidth()/2
  perso["y"] =  hauteur/2 - perso.img:getHeight()/2
  perso["ox"] =  perso.img:getWidth()/2
  perso["oy"] =  perso.img:getHeight()/2
  perso["imgHeight"] = perso.img:getHeight()
  perso["imgWidth"] = perso.img:getWidth()
  perso["origin"] = "Center"
  myRedDot(perso.ox, perso.oy)
  perso.radian = 0
  perso.scale_x = 1
  perso.scale_y = 1
end 


function myRedDot(ox, oy)
  love.graphics.setColor(1, 0, 0)
  love.graphics.circle("fill", perso.x, perso.y, 4, 4)
  love.graphics.setColor(1, 1, 1)
end


function originToCenter()
    perso.ox = perso.img:getWidth()/2
    perso.oy = perso.img:getHeight()/2
      myRedDot(perso.ox, perso.oy)
end

function originToBottomRight()
    perso.ox = perso.img:getWidth()
    perso.oy = perso.img:getHeight()
      myRedDot(perso.ox, perso.oy)
end

function originToTopLeft()
    perso.ox = 0
    perso.oy = 0
    myRedDot(perso.ox, perso.oy)
end


function switchOrigin()
  if love.keyboard.isDown("c") then
    perso["origin"] = "Bottom right"
    originToBottomRight()
  elseif love.keyboard.isDown("f") then
    perso["origin"] = "Top left"
    originToTopLeft()
  elseif love.keyboard.isDown("r") then 
    perso["origin"] = "Center"
    originToCenter()
  end
end

function movePerso()
  if love.keyboard.isDown('z') or love.keyboard.isDown('up') then
    perso.y = perso.y - 10
  end
  if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
    perso.y = perso.y + 10
  end
  if love.keyboard.isDown('q') or love.keyboard.isDown('left') then
    perso.x = perso.x - 10
  end
  if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
    perso.x = perso.x + 10
  end
end

function rotatePerso()
  if love.keyboard.isDown('a') then
    perso.radian = perso.radian - 0.05
  end
  if love.keyboard.isDown('e') then
    perso.radian = perso.radian + 0.05
  end
end
function scalingPerso()
  if love.keyboard.isDown('1') then 
      perso.scale_x = perso.scale_x + 0.01
      perso.scale_y = perso.scale_y + 0.01
  end
  if love.keyboard.isDown('2') then
    perso.scale_x = perso.scale_x - 0.01
    perso.scale_y = perso.scale_y - 0.01
  end
end
