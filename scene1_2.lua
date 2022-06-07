-----------------------------------------------------------------------------------------
--
-- scene1_2.lua
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
		composer.gotoScene("scene2_1")
	end

	--배경
	local background = display.newImageRect("image/prologue_2.png", display.contentWidth, display.contentHeight)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2
	
	--대화창
	b1 = display.newRoundedRect(640, 600, 1100, 150, 55)
	b1:setFillColor(0)
	b1.alpha = 0.5

 	--대사
	local t = {}
	t[1] = display.newText("후.. 재수강해야하나", 640, 600, native.systemFont, 50)
	t[2] = display.newText("매일 똑같은 하루가 지긋지긋해..", 640, 600, native.systemFont, 50)
	t[3] = display.newText("뭐 새로운 일 없을까?", 640, 600, native.systemFont, 50)
	t[4] = display.newText("공룡이 나타난다든가.. 이 학용품들이 괴물이 된다거나..", 640, 600, native.systemFont, 50)
	t[5] = display.newText("에휴 뭔생각을 하는건지 나도 모르겠다..", 640, 600, native.systemFont, 50)

	for i = 2, 5 do
		t[i].alpha = 0
	end

	-- 대사 넘기는 함수
	local function next1()
		t[j].alpha = 0
		j = j + 1

		if j < 6 then
			t[j].alpha = 1
		end

		if j == 6 then
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