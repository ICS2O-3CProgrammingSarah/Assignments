-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
-- create local variable
local verticesTri = {0, 160, 130, -230, -300, 130}

-- 
local triangle = display.newPolygon(display.contentWidth/2, display.contentHeight/2,verticesTri)

-- set colour of triangle
triangle:setFillColor(240/255,255/255,240/255)
-- set background
display.setDefault("background", 112/255, 128/255, 144/255)

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

--  a
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

-- create local variable
local verticesPentagon = {0, 40, 30, 20, 20, -10, -20, -10, -30, 20}

-- 
local Pentagon = display.newPolygon(display.contentWidth/2, display.contentHeight/2,verticesPentagon)

Pentagon.anchorX = 0
Pentagon.anchorY = 0
Pentagon.x = 700
Pentagon.y = 20
Pentagon.width = 300
Pentagon.height = 230

