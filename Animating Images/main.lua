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

-- character image with width and height
local emoji2 = display.newImageRect("Images/emoji2.png", 200, 200)

-- character image to be transparent
emoji2.alpha = 1

-- set the inital x and  position of emoji
emoji2.x = 0
emoji2.y = display.contentHeight/9

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to te x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to x-value of the ship
	emoji2.x = emoji2.x + scrollSpeed
	emoji2.y = emoji2.y + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out
end 

-- Moveship will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-- character image to be transparent
emoji2.alpha = 1

-- set the inital x and  position of emoji
emoji2.x = 0
emoji2.y = display.contentHeight/9

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to te x-value of the ship

-- character image with width and height
local emoji3 = display.newImageRect("Images/emoji3.png", 200, 200)

-- character image to be transparent
emoji3.alpha = 0

-- set the inital x and  position of emoji
emoji3.x = 1024
emoji3.y = display.contentHeight/1.5

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to te x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to x-value of the ship
	emoji3.x = emoji3.x - scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out
	emoji3.alpha = emoji.alpha - 0.001
	-- make emoji3 spin
	emoji3:rotate(4)
end 

-- Moveship will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-- character image with width and height
local emoji4 = display.newImageRect("Images/emoji4.png", 200, 200)

-- character image to be transparent
emoji4.alpha = 1

-- set the inital x and  position of emoji
emoji4.x = 500
emoji4.y = display.contentHeight/1.5

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to te x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to x-value of the ship
	emoji4.y = emoji4.y - scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out
	emoji4.alpha = emoji4.alpha + 0.01
	-- make the emoji4 grow
	emoji4:scale(1.004, 1.004)
end 

--- add text to the program
local textObject

-- display text textObject
textObject = display.newText( "Welcome to Emoji World!", 500, 500, nil, 50 )

--set the colour of the text
textObject:setTextColor(174/255, 243/255, 250/255)

-- Moveship will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)


