-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-------------------------------
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 255/255, 255/255, 210/255)

-----------------------------------------------------
-- LOCAL VARIABLE
-------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local randomOperator
local randonOperator2
local HideCorrect
local incorrectObject

---------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between 1-20
	randomOperator = math.random(1,4)
  
  -- generate two random numbers
  randomNumber1 = math.random(0, 20)
  randomNumber2 = math.random(0, 20)

  -- if the random operator is 1, then do addition
    if (randomOperator == 1) then

  	  -- calculate the correct answer
  	  correctAnswer =  randomNumber1 + randomNumber2

      -- create question in text object
        questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

   --if the random operator is 2, do subtraction
   elseif (randomOperator == 2) then
   	 -- calculate the correct answer
   	    if (randomNumber1 - randomNumber2 < 0) then
          correctAnswer = randomNumber2 - randomNumber1
          questionObject = randomNumber2 .. " - " .. randomNumber1
        else
          correctAnswer = randomNumber1 - randomNumber2
       end 
       

   	  
  	-- if the random operator is 3, then do multiplication
   elseif (randomOperator == 1) then

     	-- calculate the correct answer
     	correctAnswer = randomNumber1 * randomNumber2

     	-- create question in text object
     	questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

   -- otherwise, if random operator is 4, do division
   elseif (randomOperator == 4) then
   	   -- calculate the correct answer
   	   correctAnswer = randomNumber1 / randomNumber2


   	   -- create question in text obkect
   	 questionObject.text = randomNumber1 .. " / " .. randomNumber2
   
   end
end 

local function HideCorrect()
 correctObject.isVisible = false
 AskQuestion()
end 


local function NumericFieldListener( event )
	-- User begins editing the "numericField"
	if (event.phase == "began" ) then
  -- clear text field
		event.target.text = ""
   
   elseif event.phase == "submitted" then
   	-- when the answer is submitted (enter key is pressed) set user input to user's answer
   	userAnswer = tonumber(event.target.text)

   	   -- if the users answer and the correct answers are the same:
   	   if (userAnswer == correctAnswer) then
   		 correctObject.isVisible = true
   		 timer.performWithDelay(2000, HideCorrect)
      else
      AskQuestion()
      if (userAnswer == incorrectAnswer) then
       incorrectObject.isVisible = true
       timer.performWithDelay(2000, HideInCorrect)
     end
    event.target.text = ""
   end
end



------------------------------------------------------------------
-- OBJECT CREATION
------------------------------------------------------------------

-- displays a question & colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(0/255, 0/255, 0/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(165/255, 42/255, 42/255)
correctObject.isVisible = false 

-- create the correct text object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(165/255, 42/255, 42/255)
incorrectObject.isVisible = false 


-- create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "demical"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

----------------------------------------------------------------------------
-- FUNCTION CALLS
----------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()
