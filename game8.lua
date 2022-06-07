-----------------------------------------------------------------------------------------
--
-- HJsGame.lua
--
-----------------------------------------------------------------------------------------
math.randomseed( os.time() )

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")

local flag = 1
function scene:create( event )
	local sceneGroup = self.view

	local function endGame()
		composer.gotoScene( "game9" )
	end

	local physics = require("physics")
	physics.start()
	physics.setGravity(0, 10) --아래로 향하는 중력

	-- 배경
	local background = display.newImageRect("image/back.png", display.contentWidth, display.contentHeight)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2

	local player = display.newImage("image/hand.png", display.contentWidth/2 -200, display.contentHeight/2+300)
	physics.addBody(player, "static", {density = 0})


	-- 배리어
	local barrier = display.newRect(display.contentWidth/2, display.contentHeight, display.contentWidth, 10)
	barrier:setFillColor(0)
	physics.addBody(barrier, "static", {density = 0})

	-- 지우개똥 폭탄
	local bomb = display.newCircle(display.contentWidth/2, display.contentHeight/2-300, 10)
	bomb:setFillColor(0.5)
	bomb.alpha = 1
		
	physics.addBody(bomb, "dynamic", {bounce = 1})


	-- 때린 횟수
	local count = 0	

	
	-- 키보드 입력 이벤트
	local function inputEvent( event )
		local message = "Key '" .. event.keyName .. "' was pressed " .. event.phase
    	print( message )

    	local flag = "OK"

    	if player.y > 0 then

			if event.keyName == "up" then
				player.y = player.y - 20
			end
		end

		if player.y < display.contentHeight then

			if event.keyName == "down" then
				player.y = player.y + 20
			end
		end

		if player.x > 0 then
			if event.keyName == "left" then
				player.x = player.x - 20
			end
		end

		if player.x < display.contentWidth then
			if event.keyName == "right" then
				player.x = player.x + 20
			end
		end

		return false
	end

	-- 때리기 이벤트
	local function onLocalCollision(self, event)
		local collideObject = event.other

		if ("began" == event.phase) then
			count = count + 1
			score.text = count

			--폭탄 크기가 커짐
			if(flag == 1) then
				transition.to(bomb, {xScale = bomb.xScale + 0.5, yScale = bomb.yScale + 0.5, time = 100})
			else
				transition.to(bomb, {xScale = 1, yScale = 1, time = 100})
			end
			flag = 1

			if count == 17 then
				endGame()
			end
		end

		-- display.remove(collideObject)
		collideObject = nil
	end

	--공이 밖으로 나가면 다시 시작
	local function outOfAngle(self, event)
		local collideObject = event.other

		if ("began" == event.phase) then
			count = -1
			score.text = count
			flag = 0

			print("before : ")
			print(flag)
		end
		collideObject = nil
	end

	

	-- 점수
	score = display.newText(count, 0, 0, native.systemFont, 20)
	score.anchorX, score.anchorY = 0, 0
	score.x = 10
	score.y = 690
	score:setFillColor(0)


	Runtime:addEventListener( "key", inputEvent )
	

	bomb.collision = onLocalCollision
	bomb:addEventListener("collision")

	barrier.collision = outOfAngle
	barrier:addEventListener("collision")
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
