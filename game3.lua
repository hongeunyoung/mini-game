-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local dialog
local i

function scene:create( event )
	local sceneGroup = self.view

	local function gotoFinish()
		dialog.alpha = 0
		composer.gotoScene("game4")
	end	
	
	--배경화면
	local background = display.newImageRect("image/background.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	local player = display.newImageRect("image/player.png", 150, 150)
	player.x = 200
	player.y = 450

	local ruler = display.newImageRect("image/ruler.png", 200, 200)
	ruler.x = 550
	ruler.y = 400
	ruler.alpha = 0

	dialog = display.newRoundedRect(640, 600, 1100, 150, 55)
	dialog:setFillColor(0)
	dialog.alpha = 0.5

	local t = {}
	t[1] = display.newText("무사히 도망쳤어!", 640, 600, native.systemFont, 50)
	t[2] = display.newText("자: 공룡이가 양심이를 잡아 놓으라고 했는데.. 어디 갔지?", 640, 600, native.systemFont, 50)
	t[2]:setFillColor(0.1, 0.2, 0.5)
	t[3] = display.newText("자가 날 발견하기 전에 어서 빨리 공룡을 따라가자!", 640, 600, native.systemFont, 50)

	for i = 2, 3, 1 do
		t[i].alpha = 0
	end

	local j = 1 
	local function nextText2()
		t[j].alpha = 0
		j = j + 1

		if j < 4 then
			t[j].alpha = 1
		end

		if j == 2 then
			ruler.alpha = 1
		end	

		if j == 4 then
			gotoFinish()
		end
	end

	dialog:addEventListener("tap", nextText2)
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
