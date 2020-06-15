-----------------------------------------------------------------------------------------
--
-- splash_screen.lua
-- Created by: Sarah
-- Date: May 28, 2020
-- Description: This is the splash screen of the game. It displays the 
-- company logo that was designed using photoshop. It lasts on the screen for 5 seconds then goes to the level1_screen.lua.
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)


----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local grass1
local background
local dinosaur2
local dinosaurtext
local scrollXSpeed = 8
local scrollYSpeed = -3
local dinosaur = audio.loadSound("Sounds/dinosaur.mp3.mp3")
local dinosaurSoundChannel

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that moves the grass across the screen
local function movegrass1()
    grass1.alpha = grass1.alpha -0.001
end

--set the scrollSpeed
scrollSpeed = 5

-- Make the shrink var

--Making the grass grow and setting its x-value and move positoning
local function moveGrass1(event)
    -- add the scroll speed to x-value of the ship
    grass1.x = grass1.x + scrollSpeed
    -- change the transparency of the ship every time it moves so that it fades in
    grass1.alpha = grass1.alpha + 0.01
    --make the grass grow
    grass1:scale(1.007, 1.007)
end 

--Making it so the dinosaur shrinks then begins to fade out of the screen
local function moveDinosaur2(event) 
    -- add the scroll speed to x-value of the ship
    dinosaur2.x = dinosaur2.x - scrollSpeed
    -- change the transparency of the ship every time it moves so that it fades out
    dinosaur2.alpha = dinosaur2.alpha - 0.001
    -- make dinosaur shrink
    dinosaur2.xScale = dinosaur2.xScale + .002
end 
    
--Making it so the text moves above and rotates 4 times.
local function movedinosaurtext(event)
    -- add the scroll speed to x-value of the ship
    dinosaurtext.y = dinosaurtext.y - scrollSpeed
    -- change the transparency of the ship every time it moves so that it fades in
    dinosaurtext.alpha = dinosaurtext.alpha + 0.01
    -- make the text shrink
    dinosaurtext:rotate(4)
    
end 


-- The function that will go to the main menu 
local function gotoMainMenu()
    composer.gotoScene( "main_menu", {effect = "fromBottom", time = 500})
end



-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Insert the background image
    background = display.newImageRect("Images2/background.png", 1024, 768)
    background.anchorX = 0 
    background.anchorY = 0
    
    ---------------------------------------------------------------------
    ---GRASS 
    ----------------------------------------------------------------------
   -- Insert the beetleship image
    grass1 = display.newImageRect("Images2/grass1.png", 590, 490)

    --character image to be transparent
    grass1.alpha = 0

    -- set the initial x and y position of the dinosaur
    grass1.x = 100
    grass1.y = display.contentHeight/2


    -----------------------------------------------------------------------------------
    --CREATION OF THE DINOSAUR
    -----------------------------------------------------------------------------------
    dinosaur2 = display.newImageRect("Images2/dinosaur2.png", 200, 200)

    -- image to be transparent
    dinosaur2.alpha = 1

    -- set the initial x and y position of the dinosaur
    dinosaur2.x = 480
    dinosaur2.y = display.contentHeight/2

    --setting the variable so the dinosaur is able to shrink in size
    dinosaur2.xScale = .5 

    ------------------------------------------------------------------------------------
    --CREATION OF THE TEXT
    ------------------------------------------------------------------------------------
    dinosaurtext = display.newImageRect("Images2/dinosaurtext.png", 700, 500)

    --cimage to be transparent
    dinosaurtext.alpha = 1

    -- set the initial x and y position of the dinosaur
    dinosaurtext.x = 500
    dinosaurtext.y = display.contentHeight/1.5



    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( background )
    sceneGroup:insert( grass1 )
    sceneGroup:insert( dinosaur2 )
    sceneGroup:insert( dinosaurtext )
    
    
    
end -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- start the splash screen music
       dinosaurSoundChannel = audio.play( dinosaur )

        -- Call the 3 images function as soon as we enter the frame.
        Runtime:addEventListener("enterFrame", moveGrass1)
        Runtime:addEventListener("enterFrame", moveDinosaur2)
        Runtime:addEventListener("enterFrame", movedinosaurtext)
        


        -- Go to the main menu screen after the given time.
        timer.performWithDelay ( 4000, gotoMainMenu)          
        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
        -- stop the jungle sounds channel for this screen
        audio.stop(dinosaurSoundChannel)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
    --Remove the display objects( the 3 images) as soon as it enters the next frame
   Runtime:removeEventListener("enterFrame", moveGrass1)
   Runtime:removeEventListener("enterFrame", moveDinosaur2)
   Runtime:removeSEventListener("enterFrame", movedinosaurtext)

end -- function scene:destroy( event )


-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
