-----------------------------------------------------------------------------------------
--
-- beforeHJGame.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")


local font = native.systemFont
local b3

function scene:create( event )
	local sceneGroup = self.view


	local function enterGame()
		b3.alpha = 0
		composer.gotoScene( "game8" )
	end
	
	--배경
	local background = display.newImageRect("image/back.png", display.contentWidth, display.contentHeight)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2

	--주인공
	local player = display.newImageRect("image/player.png", 200, 200)
	player.x = 1000
	player.y = 400

	--우주최강귀요미공룡
	local dino = display.newImageRect("image/cute.png", 650, 650)
	dino.x = 400
	dino.y = 280

	--대화창
	b3 = display.newRoundedRect(640, 600, 1100, 150, 55)
	b3:setFillColor(0)
	b3.alpha = 0.5

	--대사
	local t = {}
	t[1] = display.newText("앗 그새 공룡이 더 커졌잖아!", 640, 600, font, 50)
	t[2] = display.newText("구구리가 더 깊게 잠들고 있나 봐", 640, 600, font, 50)
	t[3] = display.newText("미리 준비해 온 지우개똥 폭탄으로는 못 잡을 거야", 640, 600,font, 50)
	t[4] = display.newText("한 방에 끝낼 수 있도록 지우개똥 폭탄 크기를 키우자!!", 640, 600, font, 50)
	t[5] = display.newText("지우개똥 폭탄을 공중에 많이 띄울수록 커져!", 640, 600, font, 50)
	t[6] = display.newText("떨어트리면 처음부터 다시 해야 해!", 640, 600, font, 50)
	t[7] = display.newText("키보드 방향키로 손을 움직여봐!", 640, 600, font, 50)

	for i = 2, #t, 1 do
		t[i].alpha = 0
	end

	local j = 1
	local temp = #t+1
	-- 대사 넘기는 함수
	local function next()
		if j < temp then
			t[j].alpha = 0
			j = j + 1

			if j < temp then
				t[j].alpha = 1
			end

			if j == temp then
				enterGame()
			end
		end

		
	end

	b3:addEventListener("tap", next)	
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