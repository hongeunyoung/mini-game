-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local dialog
local i 

local function gotoStartGame()
	dialog.alpha = 0
	composer.gotoScene("game2")
end


function scene:create( event )
	local sceneGroup = self.view

	local background


	--배경화면
	background = display.newImageRect("image/background.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	local player = display.newImageRect("image/player.png", 150, 150)
	player.x = 1100
	player.y = 450

	local cute = display.newImageRect("image/cute.png", 300, 300)
	cute.x = 300
	cute.y = 350
	cute.alpha = 0

	local ruler = display.newImageRect("image/ruler.png", 200, 200)
	ruler.x = 550
	ruler.y = 400
	ruler.alpha = 0

	local circle = display.newImageRect("image/button.png", 200, 200)
	circle.x = 700
	circle.y = 400
	circle.alpha = 0

	local bridge = display.newImageRect("image/bridge.png", 100, 100)
	bridge.x = 700
	bridge.y = 400
	bridge.alpha = 0

	dialog = display.newRoundedRect(640, 600, 1100, 150, 55)
	dialog:setFillColor(0)
	dialog.alpha = 0.5

	local t = {}
	t[1] = display.newText("공룡 거기 서라~! 마을을 그만 부수란 말이야!", 640, 600, native.systemFont, 50)
	t[2] = display.newText("공룡: 크하하 나는 꿈을 지배할 거야!", 640, 600, native.systemFont, 50)
	t[2]:setFillColor(0.1, 0.2, 0.5)
	t[3] = display.newText("공룡: 영원한 꿈의 세계를 만들 거라고!", 640, 600, native.systemFont, 50)
	t[3]:setFillColor(0.1, 0.2, 0.5)
	t[4] = display.newText("말로는 안되겠군. 공룡을 직접 잡는 수밖엔 없나 봐!", 640, 600, native.systemFont, 50)
	t[5] = display.newText("앗! 저 자는 뭐지?", 640, 600, native.systemFont, 50)
	t[6] = display.newText("자랑 닿으면 네모로 변하잖아!!", 640, 600, native.systemFont, 50)
	t[7] = display.newText("자를 피해서 공룡을 잡으러 가자", 640, 600, native.systemFont, 50)
	

	for i = 2, 7, 1 do
		t[i].alpha = 0
	end

	local k = 1
	local function nextText()
		t[k].alpha = 0
		k = k + 1
		if k < 8 then
			t[k].alpha = 1
		end

		if k == 2 then
			cute.alpha = 1
		end

		if k == 5 then
			ruler.alpha = 1
			circle.alpha = 1
		end

		if k ==6 then
			circle.alpha = 0
			bridge.alpha = 1
		end
		
		if k == 8 then
			gotoStartGame()
		end		
	end

	dialog:addEventListener("tap", nextText)



	
	
end

function scene:show( event )
	
end

function scene:hide( event )
	
end

function scene:destroy( event )
	
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene