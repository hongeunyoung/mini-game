-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")

local i
local j = 1
local b1
local b2
local t = {}
function scene:create( event )
	local sceneGroup = self.view

	--게임 시작
	local function startGame()
		b1.alpha = 0
		composer.gotoScene("game5")
	end

	--배경
	local background = display.newImageRect("image/back.png", display.contentWidth, display.contentHeight)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2

	--주인공
	local player = display.newImageRect("image/player.png", 200, 200)
	player.x = 1000
	player.y = 400

	--새
	local birds = display.newImageRect("image/bird.png", 200, 200)
	birds.x = 700
	birds.y = 200

	local function click()
		transition.to(player, {x=900, y=300, time = 1000})
		b1.alpha = 0.5
		b2.alpha = 0
		t[2].alpha = 0
		t[3].alpha = 1
		j = j + 1
	end
	--가위가위
	local scissors1 = display.newImageRect("image/sc.png", 200, 200)
	scissors1.x = 200
	scissors1.y = 400
	scissors1.alpha = 0

	local scissors2 = display.newImageRect("image/sc.png", 200, 200)
	scissors2.x = 200
	scissors2.y = 200
	scissors2.alpha = 0
	--구멍
	local crack = display.newImageRect("image/crack.png", 300, 300)
	crack.x = 500
	crack.y = 350
	crack.alpha = 0
	
	--대화창
	b1 = display.newRoundedRect(640, 600, 1100, 150, 55)
	b1:setFillColor(0)
	b1.alpha = 0.5

	b2 = display.newRoundedRect(640, 600, 1100, 150, 55)
	b2:setFillColor(0)
	b2.alpha = 0

 	--대사
	t[1] = display.newText("공룡이 도대체 어디로 간 거지?", 640, 600, native.systemFont, 50)
	t[2] = display.newText("새가 공룡을 봤을지도 몰라. 클릭해서 물어보자!", 640, 600, native.systemFont, 50)
	t[3] = display.newText("새: 뺙뺙 내 둥지!! 공룡이 밟아버렸어!", 640, 600, native.systemFont, 50)
	t[3]:setFillColor(0.9, 0.9, 0.5)
	t[4] = display.newText("새: 공룡은 왼쪽으로 도망갔어! 빨리 잡아줘 뺙..", 640, 600, native.systemFont, 50)
	t[4]:setFillColor(0.9, 0.9, 0.5)
	t[5] = display.newText("고마워~! 내가 빨리 잡아줄게!", 640, 600, native.systemFont, 50)
	t[6] = display.newText("더 많은 주민들이 피해를 입기 전에 잡아야겠어", 640, 600, native.systemFont, 50)
	t[7] = display.newText("가위가위: 싹~ 뚝! 싹~ 뚝!", 640, 600, native.systemFont, 50)
	t[7]:setFillColor(0.1, 0.2, 0.5)
	t[8] = display.newText("앗 가위가위가 나타났어!", 640, 600, native.systemFont, 50)
	t[9] = display.newText("길에 구멍을 만들고 있잖아!!", 640, 600, native.systemFont, 50)
	t[10] = display.newText("가위가위 5마리를 모두 잡아야 지나갈 수 있어", 640, 600, native.systemFont, 50)
	t[11] = display.newText("실수로 새를 잡으면 가위가위가 모두 도망가서 처음부터 다시 5마리를 잡아야 해", 640, 600, native.systemFont, 35)
	t[12] = display.newText("빨리 잡고 계속해서 공룡을 쫓아가자!", 640, 600, native.systemFont, 50)

	for i = 2, 12, 1 do
		t[i].alpha = 0
	end

	-- 대사 넘기는 함수
	local function next1()
		t[j].alpha = 0
		j = j + 1

		if j < 13 then
			t[j].alpha = 1
		end

		if j == 2 then
			b1.alpha = 0
			b2.alpha = 0.5
			birds:addEventListener("tap", click)
		end

		if j == 7 then
			scissors1.alpha = 1
			scissors2.alpha = 1
		end


		if j == 9 then
			crack.alpha = 1
		end

		if j == 13 then
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