-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------
math.randomseed( os.time() )

local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

local images = {}
local material
local count = 0
local t
local background

function scene:create( event )
	local sceneGroup = self.view

	--성공
	local function gotoSuccess()
		composer.gotoScene("game6")
	end

	--배경
	background = display.newImageRect("image/back.png", display.contentWidth, display.contentHeight)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2

	--주인공
	local player = display.newImageRect("image/player.png", 300, 300)
	player.x = 1050
	player.y = 500

	--구멍이 나타나는 창
	local b1 = display.newRoundedRect(500, 360, 660, 630, 55)
	b1:setFillColor(0)
	b1.alpha = 0.5

	--잡은 가위가위 수
	local tx1 = display.newText("잡은 가위가위 수", 1050, 150, native.systemFont, 50)
	tx1:setFillColor(0)

	local tx2 = display.newText("0", 1050, 230, native.systemFont, 60)
	tx2:setFillColor(0)

	--시간이 지나면 나타났던 가위/새 사라짐
	local function delete()
		material.alpha = 0
	end

	--클릭
	local function touch()
		material.alpha = 0.1
		if i == 2 then --새 클릭하면
			count = 0
			tx2.text = string.format("%d", count)
		else
			count = count + 1 -- 가위 클릭하면
			tx2.text = string.format("%d", count)
			
			if count == 5 then
				timer.cancel(t)
				gotoSuccess()
			end
		end
	end

	-- 생성
	local function create()
		images = {"image/sc.png", "image/bird.png"}
		i = math.random(1,2)
		material = display.newImage(images[i])
		material.width = 100
		material.height = 100
		material.x = math.random(250, 700)
		material.y = math.random(100, 500)
		material.alpha = 1
		material:addEventListener("tap", touch)
		timer.performWithDelay(700, delete)
	end

	t = timer.performWithDelay(900, create, 0)
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