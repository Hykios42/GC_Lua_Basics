local perso = {}
local largeur, hauteur

function love.load()
  
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  print("Largeur : ",largeur)
  print("hauteur : ",hauteur)
  initPerso()
end

function love.draw()
  love.graphics.draw(perso.img, perso.x, perso.y, 0 , 1, 1, perso.ox, perso.oy)
   -- myRedDot()
  MyPrint()
  switchOrigin()
  movePerso()
end

function MyPrint()
  love.graphics.print("x = ".. perso.x, 10, 10)
  love.graphics.print("y = ".. perso.y, 10, 25)
  love.graphics.print("actual origin: " .. perso.origin, 10, 40)
  
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
end 


function myRedDot()
  love.graphics.setColor(1, 0, 0)
  love.graphics.circle("fill", perso.ox, perso.oy, 10)
  love.graphics.setColor(1, 1, 1)
end


function originToCenter()
    perso.x = largeur / 2 - perso.img:getHeight()/2
    perso.y = hauteur/2 - perso.img:getWidth()/2
    perso.ox = perso.img:getHeight()/2
    perso.oy = perso.img:getWidth()/2
end

function originToBottomRight()
    perso.ox = perso.img:getHeight() + perso.x
    perso.oy = perso.img:getWidth() + perso.y
end

function originToDownCenter()
    perso.ox = perso.img:getHeight()/2 + perso.x
    perso.oy = perso.img:getWidth() + perso.y
end


function switchOrigin()
  if love.keyboard.isDown('c') then
    perso["origin"] = "Bottom right"
    originToBottomRight()
  elseif love.keyboard.isDown('f') then
    perso["origin"] = "Centre bas"
    originToDownCenter()
  elseif love.keyboard.isDown('r') then 
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
