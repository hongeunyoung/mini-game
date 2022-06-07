-----------------------------------------------------------------------------------------
--
-- afterHJGame.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")


local font = native.systemFont
local b4
function scene:create( event )
	local sceneGroup = self.view


	local function enterGame()
		b4.alpha = 0
		composer.gotoScene("scene5_1")
	end
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
	-- create a white background to fill screen

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

	-- 지우개똥 폭탄
	local bomb = display.newCircle(player.x, player.y - 200, 100)
	bomb:setFillColor(0.5)
	bomb.alpha = 1

	--대화창
	b4 = display.newRoundedRect(640, 600, 1100, 150, 55)
	b4:setFillColor(0)
	b4.alpha = 0.5

	--대사
	local t = {}
	t[1] = display.newText("예스!! 이 정도 크기면 거뜬히 이길 수 있어!!", 640, 600, font, 50)
	t[2] = display.newText("공룡: 안돼~! 내 원대한 꿈이~!!", 640, 600, font, 50)
	t[2]:setFillColor(0.1, 0.2, 0.5)
	t[3] = display.newText("", 640, 600, font, 50)
	for i = 2, 3, 1 do
		t[i].alpha = 0
	end

	local j = 1
	-- 대사 넘기는 함수
	local function next()
		if j < #t then
			t[j].alpha = 0
			j = j + 1
			t[j].alpha = 1
		end

		if j == 2 then
			transition.to(bomb, {x=-100, y=400, time = 1000})
			transition.to(dino, {rotation=360, x=-500, time = 2500})
		end

		if j == 3 then
			enterGame()
		end
	end

	b4:addEventListener("tap", next)	
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