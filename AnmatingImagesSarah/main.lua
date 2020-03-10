-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)
-- global variable
scrollSpeed = 5
-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.jpg", 2048, 1536)

-- character image with width and height
local emoji = display.newImageRect("Images/Thinking_Face_Emoji_large.png", 200, 200)

-- character image to be transparent
emoji.alpha = 0

-- set the inital x and  position of emoji
emoji.x = 0
emoji.y = display.contentHeight/3

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to te x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to x-value of the ship
	emoji.x = emoji.x + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out
	emoji.alpha = emoji.alpha + 0.01
end 

-- Moveship will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)
