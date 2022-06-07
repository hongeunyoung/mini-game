-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local b2
local i
function scene:create( event )
	local sceneGroup = self.view

	local function gotoFinish()
		composer.gotoScene("game7")
	end	
	
	--배경화면
	local background = display.newImageRect("image/back.png", display.contentWidth, display.contentHeight)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2

	--주인공
	local player = display.newImageRect("image/player.png", 200, 200)
	player.x = 1000
	player.y = 400

	--대화창
	b2 = display.newRoundedRect(640, 600, 1100, 150, 55)
	b2:setFillColor(0)
	b2.alpha = 0.5

	--대사
	local t = {}
	t[1] = display.newText("가위가위를 겨우 다 잡았어", 640, 600, native.systemFont, 50)
	t[2] = display.newText("다시 빨리 공룡을 따라가자", 640, 600, native.systemFont, 50)
	
	t[2].alpha = 0

	local j = 1 
	local function nextText2()
		t[j].alpha = 0
		j = j + 1

		if j < 3 then
			t[j].alpha = 1
		end	

		if j == 3 then
			b2.alpha = 0
			gotoFinish()
		end
	end

	b2:addEventListener("tap", nextText2)
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
