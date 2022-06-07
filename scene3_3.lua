-----------------------------------------------------------------------------------------
--
-- scene3_3.lua
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
		composer.gotoScene("scene4_1")
	end

	--배경
	local background = display.newImageRect("image/s32.png", display.contentWidth, display.contentHeight)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2
	
	--대화창
	b1 = display.newRoundedRect(640, 600, 1100, 150, 55)
	b1:setFillColor(0)
	b1.alpha = 0.8

 	--대사
	local t = {}
	t[1] = display.newText("공룡: 크하하하하 다 부숴버리겠다! 가자 친구들~!", 640, 600, native.systemFont, 50)
	t[1]:setFillColor(0.1, 0.2, 1)
	t[2] = display.newText("마을 사람들: 으악!! 공룡이다 공룡이 나타났다!", 640, 600, native.systemFont, 50)
	t[2]:setFillColor(0.9, 0.9, 0.5)
	t[3] = display.newText("마을 사람들: 안돼~! 내 집이!!", 640, 600, native.systemFont, 50)
	t[3]:setFillColor(0.9, 0.9, 0.5)

	for i = 2, 3, 1 do
		t[i].alpha = 0
	end

	-- 대사 넘기는 함수
	local function next1()
		t[j].alpha = 0
		j = j + 1

		if j < 4 then
			t[j].alpha = 1
		end

		if j == 4 then
			startGame()
		end
	end

	b1:addEventListener("tap", next1)

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