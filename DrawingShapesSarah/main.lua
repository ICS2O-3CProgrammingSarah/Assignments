-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
-- create local variable
local verticesTri = {0, 160, 130, -230, -300, 130}

-- Display the shape unto the screen with the content witdh and height
local triangle = display.newPolygon(display.contentWidth/2, display.contentHeight/2,verticesTri)


-- set background
display.setDefault("background", 147/255,112/255,219/255)

-- set color of the triangle 

paint = {
	type = "gradient",
	color1 = {152/255, 251/255, 152/255}, color2 = {135/255, 206/255, 235/255},
	directions = "up",
 }
triangle.fill = paint

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

-- name the shape and position the (x,y)
textObject = display.newText(" Triangle", 100, 270, nil, 50)

-- create local variable
local verticesPentagon = {0, 40, 30, 20, 20, -10, -20, -10, -30, 20}

-- Display the shape unto the screen with the content witdh and height
local Pentagon = display.newPolygon(display.contentWidth/2, display.contentHeight/2,verticesPentagon)

-- --anchor the Pentagon in the top left corner of the screen and set its (x,y) position
Pentagon.anchorX = 0
Pentagon.anchorY = 0
Pentagon.x = 700
Pentagon.y = 250
Pentagon.width = 300
Pentagon.height = 230

-- scale the pentagon so it flips 
Pentagon:scale (1, -1)

-- set the pentagon width border
Pentagon.strokeWidth = 5

-- name the shape and position the (x,y)
textObjectPent = display.newText("Pentagon", 850, 270, nil, 50)
 
-- set the colour of the Pentagon

paint = {
	type = "gradient",
	color1 = { 255/255, 255/255, 244/255}, color2 = {0/255, 255/255, 255/255},
	directions = "up",
 }
Pentagon.fill = paint

-- create local variable
local verticesTrap = {-100, 100, 50, 100, 100, -50, -150, -50}

-- Display the shape unto the screen with the content witdh and height
local Trap = display.newPolygon(display.contentWidth/2, display.contentHeight/2,verticesTrap)


--anchor the Trapezium in the bottom right corner of the screen and set its (x,y) position
Trap.anchorX = 0
Trap.anchorY = 0
Trap.x = 20
Trap.y = 470
Trap.width = 300
Trap.height = 270

-- Name the shape and position the (x,y)
textObjectTrapezium = display.newText("Trapezium", 180, 450, nil, 50)
-- set the pentagon width border
Trap.strokeWidth = 10

-- set the colour of the Pentagon

paint = {
	type = "gradient",
	color1 = {65/255, 105/255, 255/255}, color2 = {230/255, 230/255, 250/255},
	directions = "up",
 }
Trap.fill = paint


-- create local variable
local verticesParell = {-2, 6, -4, -2, 2, -2, 4, 6}

-- Display the shape unto the screen with the content witdh and height
local Parell = display.newPolygon(display.contentWidth/2, display.contentHeight/2,verticesParell)

---- anchor the Parallelogram in the bottom left corner of the screen and set its (x,y) position
Parell.anchorX = 0
Parell.anchorY = 0
Parell.x = 600
Parell.y = 350
Parell.width = 330
Parell.height = 270

-- Name the shape
textObjectParallelogram = display.newText("Parallelogram", 800, 690, nil, 50)

--set the pentagon width border
Parell.strokeWidth = 1


paint = {
	type = "gradient",
	color1 = {255/255, 248/255, 220/255}, color2 = {255/255, 240/255, 245/255},
	directions = "up",
 }
Parell.fill = paint