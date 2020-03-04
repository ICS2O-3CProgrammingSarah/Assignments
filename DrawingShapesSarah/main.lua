-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
-- create local variable
local verticesTri = {0, 160, 130, -230, -300, 130}

--  Draw the shape and make it display on the screen.
local triangle = display.newPolygon(display.contentWidth/2, display.contentHeight/2,verticesTri)

-- set colour of triangle
triangle:setFillColor(240/255,255/255,240/255)

-- set background
display.setDefault("background", 112/255, 128/255, 144/255)

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

 --anchor the Triangle in the top right corner of the screen and set its (x,y) position
triangle.anchorX = 0
triangle.anchorY = 0
triangle.x = 20
triangle.y = 20
triangle.width = 300
triangle.height = 230

-- set the triangle width border
triangle.strokeWidth = 20

-- set the triangle of the border
triangle.strokeWidth = 20

-- set the colour of the triangle
triangle.strokeWidth = 20

-- set the colour of the triangle
triangle:setFillColor(0.7,0.1,0.3)

-- set the colour of the triangle
triangle:setStrokeColor(0,1,0)


-- name the shape and position the (x,y)
textObject = display.newText(" Triangle", 100, 270, nil, 50)

-- create local variable
local verticesPentagon = {0, 40, 30, 20, 20, -10, -20, -10, -30, 20}

-- 
local Pentagon = display.newPolygon(display.contentWidth/2, display.contentHeight/2,verticesPentagon)

-- --anchor the Pentagon in the top left corner of the screen and set its (x,y) position
Pentagon.anchorX = 0
Pentagon.anchorY = 0
Pentagon.x = 700
Pentagon.y = 250
Pentagon.width = 300
Pentagon.height = 230

-- scale
Pentagon:scale (1, -1)
-- name the shape and position the (x,y)
 textObjectPent = display.newText("Pentagon", 850, 270, nil, 50)
 
 -- set the colour of the Pentagon
local paint = {
	type = "gradient",
	color1 = { 255/255, 255/255, 244/255}, color2 = { 240/255, 255/255, 240/255},
	directions = "up"
 }
Pentagon.fill = paint
 -- create local variable
 local verticesTrap = {-100, 100, 50, 100, 100, -50, -150, -50}

 --
 local Trap = display.newPolygon(display.contentWidth/2, display.contentHeight/2,verticesTrap)


--anchor the Trapezium in the bottom right corner of the screen and set its (x,y) position
Trap.anchorX = 0
Trap.anchorY = 0
Trap.x = 20
Trap.y = 470
Trap.width = 300
Trap.height = 270

-- Name the shape and position the (x,y)
 textObjectTrap = display.newText("Trapezium", 180, 450, nil, 50)

-- set the colour of the Pentagon
local paint = {
	type = "gradient",
	color1 = { },
	color2 = { },
	directions = "up"
 }
Pentagon.fill = paint
-- create local variable
local verticesParell = {-2, 6, -4, -2, 2, -2, 4, 6}

-- 
local Parell = display.newPolygon(display.contentWidth/2, display.contentHeight/2,verticesParell)

---- anchor the Parallelogram in the bottom left corner of the screen and set its (x,y) position
Parell.anchorX = 0
Parell.anchorY = 0
Parell.x = 600
Parell.y = 350
Parell.width = 370
Parell.height = 300

-- Name the shape
textObjectParell = display.newText("Parallelogram", 800, 700, nil, 50)

