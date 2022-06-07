-----------------------------------------------------------------------------------------
--
-- scene4_2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")

local i
local j = 1
local b1
local t = {}
function scene:create( event )
	local sceneGroup = self.view

	--게임 시작
	local function startGame()
		b1.alpha = 0
		composer.gotoScene("scene4_3")
	end

	--배경
	local background = display.newImageRect("image/s42.png", display.contentWidth, display.contentHeight)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2
	
	--대화창
	b1 = display.newRoundedRect(640, 600, 1100, 150, 55)
	b1:setFillColor(0)
	b1.alpha = 0.5

	local b2 = display.newRect(430, 200, 200, 100)
	b2:setFillColor(0)
	b2.alpha = 0

	local b3 = display.newRoundedRect(640, 600, 1100, 150, 55)
	b3:setFillColor(0)
	b3.alpha = 0

	local function click()
		b2.alpha = 0
		t[4].alpha = 0
		t[6].alpha = 1
		j = j + 1
		b1.alpha = 0.5
		b3.alpha = 0
	end

 	--대사
	t[1] = display.newText("이런 구구리가 수업 중에 졸면서 공룡이 생긴 거구나", 640, 600, native.systemFont, 50)
	t[2] = display.newText("이대로 계속 마을을 부수면 구구리가 푹 잠들어 버리고 말 거야", 640, 600, native.systemFont, 45)
	t[3] = display.newText("오늘 정말 중요한 내용 진도 나간다고 하셨는데!!", 640, 600, native.systemFont, 50)
	t[4] = display.newText("(구구리의 머리를 클릭해서 깨워보자)", 640, 600, native.systemFont, 50)
	t[5] = display.newText("CLICK", 430, 200, native.systemFont, 50)
	t[6] = display.newText("이런 일어나지 않잖아!", 640, 600, native.systemFont, 50)
	t[7] = display.newText("안에서 해결해야겠어", 640, 600, native.systemFont, 50)

	for i = 2, 7, 1 do
		t[i].alpha = 0
	end

	-- 대사 넘기는 함수
	local function next1()
		t[j].alpha = 0
		j = j + 1

		if j < 8 then
			t[j].alpha = 1
		end

		if j == 4 then
			b2.alpha = 0.5
			t[5].alpha = 1
			j = j + 1
			b1.alpha = 0
			b3.alpha = 0.5
		end

		if j == 5 then
			b2:addEventListener("tap", click)
		end

		if j == 8 then
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