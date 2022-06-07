-----------------------------------------------------------------------------------------
--
-- scene4_3.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")

local i
local j = 1
local b1
function scene:create( event )
	local sceneGroup = self.view

	--게임 시작
	local function startGame()
		b1.alpha = 0
		composer.gotoScene("scene4_4")
	end

	--배경
	local background = display.newImageRect("image/s43.png", display.contentWidth, display.contentHeight)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2
	
	--대화창
	b1 = display.newRoundedRect(640, 600, 1100, 150, 55)
	b1:setFillColor(0)
	b1.alpha = 0.5

 	--대사
	local t = {}
	t[1] = display.newText("저 공룡이 학용품 괴물들을 데리고 다니는구나!", 640, 600, native.systemFont, 50)
	
	b1:addEventListener("tap", startGame)

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene