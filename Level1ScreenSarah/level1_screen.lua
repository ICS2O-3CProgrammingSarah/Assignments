-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image
local backButton
local sauropod
local dinosaurland

-------------------------------------------------------------------
---SOUNDS 
-------------------------------------------------------------------

local level1Sound = audio.loadSound("Sounds/level1.mp3")
local level1SoundChannel

local correctdino = audio.loadSound("Sounds/correctdino1.mp3")
local correctdinoSoundChannel

-------------------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------------------
-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "flip", time = 500})
end

--Making it so the dinosaur image goes above (ANIMATION)
local function movesdinosaurland(event)
  -- add the scroll speed to x-value of the dinosaurland
  dinosaurland.y = dinosaurland.y - scrollSpeed
  -- change the transparency of the ship every time it moves so that it fades in
  dinosaurland.alpha = dinosaurland.alpha + 0.01
end  
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImageRect("Images2/level1Screen.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    --Create the correct dinosaur image
    sauropod = display.newImageRect("Images2/sauropod.png", 480, 315)
    
    -- set the initial x and y position of the sauropod and make it visible
    sauropod.x = 800
    sauropod.y = display.contentHeight/1.3
    sauropod.isVisible = true
    
    
    --Create the congrats image. Once it is clicked, it'll appear on the screen and replace the sauropod imagge
   congratstext = display.newImageRect("Images2/congratstext.png", 480, 315)
    
    -- set the initial x and y position of the sauropod and make it invisible
    congratstext.x = 800
    congratstext.y = display.contentHeight/1.3
    congratstext.isVisible = false 

   
   --When the sauropod is clicked, the image congrats will appear.
   local function sauropodListener(touch)
        if (touch.phase == "began") then
          sauropod.isVisible = false
          congratstext.isVisible = true
           correctdinoSoundChannel = audio.play( correctdino )
       end
    
       if (touch.phase == "ended") then
          sauropod.isVisible = true
          congratstext.isVisible = false
      end 
  end

  --add the listeners to each object
  sauropod:addEventListener("touch", sauropodListener)

  --After the user releases the mouses, it'll return back to the sauropod image.
  local function congratstextListener(touch)
       if (touch.phase == "began") then
          sauropod.isVisible = true
          congratstext.isVisible = false
       end

        if (touch.phase == "ended") then
         sauropod.isVisible = true
         congratstext.isVisible = false
       end 
   end

   --add the listener to each object
   congratstext:addEventListener("touch", congratstextListener)


   ---------------------------------------------------------------
   --CREATION OF THE ANIMATED IMAGE   
   ---------------------------------------------------------------
    dinosaurland = display.newImageRect("Images2/dinosaurland.png", 200, 200)

    --set the image to be transparent
    dinosaurland.alpha = 1

    -- set the initial x and y position of the dinosaur
    dinosaurland.x = 500
    dinosaurland.y = display.contentHeight/1.5

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )
    sceneGroup:insert( sauropod )
    sceneGroup:insert( congratstext )
    sceneGroup:insert( dinosaurland )

 --function scene:create( event )


-----------------------------------------------------------------------
--BUTTON WIDGETS
-----------------------------------------------------------------------

-- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*1/8,
        y = display.contentHeight*15/16,

        -- Setting Dimensions
        -- width = 1000,
        -- height = 106,

        -- Setting Visual Properties
        defaultFile = "Images/Back Button Unpressed.png",
        overFile = "Images/Back Button Pressed.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )

    -----------------------------------------------------------------------------------------

    -- Associating Buttons with this scene
    sceneGroup:insert( backButton )
    
end --function scene:create( event )



-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        --This is where you begin to play the audio for the level1 screen
        level1SoundChannel = audio.play( level1Sound )

        -- Call the image function as soon as we enter the frame.
        Runtime:addEventListener("enterFrame", movesdinosaurland)

    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        --Once you click on another scene, the audio from the level1 screen stops playing
      audio.stop(level1SoundChannel)

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
    Runtime:removeEventListener("enterFrame", movesdinosaurland)

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
