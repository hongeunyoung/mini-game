-----------------------------------------------------------------------------------------
--
-- startGame.lua
--
-----------------------------------------------------------------------------------------
math.randomseed(os.time())

local widget = require( "widget")
local composer = require( "composer" )
local scene = composer.newScene()
local cTimer

local function gotoFinish()
	timer.cancel(cTimer)
	composer.gotoScene("game3")
end

local bridge = {}
local Bnum--1부터 36까지
local monsterLoacation
local monsterLoacation2
local bool = false

--GUI
local background
local gameUI = {}

function scene:create( event )
	local sceneGroup = self.view

	--배경화면
	background = display.newImageRect("image/background.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2


	--6*6로 맵 만들기, 캐릭터 위치시키기
	for i = 1, 36, 1 do
		bridge[i] = {}
		if i == 36 then
			bridge[i][1] = display.newImageRect("image/finish.png", 90, 90)
		else
			bridge[i][1] = display.newImageRect("image/bridge.png", 90, 90)
		end
		bridge[i][2] = display.newImageRect("image/player.png", 90, 90)
		bridge[i][3] = display.newImageRect("image/ruler.png", 90, 90)
	end

	--게임판 제작
	for i=1, 36, 1 do
		for j=1, 3, 1 do
			if i ~= 1 then --시작부분 제외한 나머지 플레이어 투명화
				bridge[i][2].alpha = 0
			end
			if i ~= 11 and i ~= 22 and i ~= 33 then
				bridge[i][3].alpha = 0--몬스터 있을 부분 제외한 나머지 몬스터 투명화
			end

			if i <= 6 then
				if i == 1 then
					bridge[i][j].x, bridge[i][j].y = 150, 100
				else
					bridge[i][j].x, bridge[i][j].y = bridge[i-1][j].x + 100, bridge[i-1][j].y
				end

			elseif 7 <= i and i <= 12 then
				if i == 7 then
					bridge[i][j].x, bridge[i][j].y = 150, 200
				else
					bridge[i][j].x = bridge[i-1][j].x + 100
					bridge[i][j].y  = bridge[i-1][j].y
				end

			elseif 13 <= i and i <= 18 then
				if i == 13 then
					bridge[i][j].x, bridge[i][j].y = 150, 300
				else
					bridge[i][j].x, bridge[i][j].y = bridge[i-1][j].x + 100, bridge[i-1][j].y
				end

			elseif 19 <= i and i <= 24 then
				if i == 19 then
					bridge[i][j].x, bridge[i][j].y = 150, 400
				else
					bridge[i][j].x, bridge[i][j].y = bridge[i-1][j].x + 100, bridge[i-1][j].y
				end

			elseif 25 <= i and i <= 30 then
				if i == 25 then
					bridge[i][j].x, bridge[i][j].y = 150, 500
				else
					bridge[i][j].x, bridge[i][j].y = bridge[i-1][j].x + 100, bridge[i-1][j].y
				end

			elseif 31 <= i and i <= 36 then
				if i == 31 then
					bridge[i][j].x, bridge[i][j].y = 150, 600
				else
					bridge[i][j].x, bridge[i][j].y = bridge[i-1][j].x + 100, bridge[i-1][j].y
				end
			end
		end
	end
------------------------------------------------------

--플레이어 움직이기
	Bnum = 1-- 시작
local function inputEvent(event)

	--이동하기
	if event.target.name == "L" then
		if Bnum ~= 1 and Bnum ~= 7 and Bnum ~= 13 and Bnum ~= 19 and Bnum ~= 25 and Bnum ~= 31 then
			bridge[Bnum][2].alpha = 0
			bridge[Bnum-1][2].alpha = 1
			Bnum = Bnum - 1
		end
elseif event.target.name == "R" then
		if Bnum ~= 6 and Bnum ~= 12 and Bnum ~= 18 and Bnum ~= 19 and Bnum ~= 24 and Bnum ~= 30 then
			bridge[Bnum][2].alpha = 0
			bridge[Bnum+1][2].alpha = 1
			Bnum = Bnum + 1
		end
elseif event.target.name == "U" then
		if Bnum ~= 1 and Bnum ~= 2 and Bnum ~= 3 and Bnum ~= 4 and Bnum ~= 5 and Bnum ~= 6 then
			bridge[Bnum][2].alpha = 0
			bridge[Bnum-6][2].alpha = 1
			Bnum = Bnum - 6
		end
	elseif event.target.name == "D" then
		if Bnum ~= 31 and Bnum ~= 32 and Bnum ~= 33 and Bnum ~= 34 and Bnum ~= 35 and Bnum ~= 36 then
			bridge[Bnum][2].alpha = 0
			bridge[Bnum+6][2].alpha = 1
			Bnum = Bnum + 6
		end
	end

		if bridge[Bnum][2].alpha == 1 and bridge[Bnum][3].alpha == 1 and bool == false then -- 몬스터 만났을 경우
			bridge[Bnum][2].alpha = 0 -- 현재 위치 캐릭터 투명화
			bridge[1][2].alpha = 1 --처음위치로
			Bnum = 1
		end

		if bridge[36][2].alpha == 1 and bridge[Bnum][3].alpha ~= 1 then --도착지까지 왔고 몬스터 만나지 않았을 경우
			gotoFinish()
			bool = true
		end

		return false
	end
	----------------------------------------------

 --몬스터 이동하기1
 monsterLoacation = 22--시작
 local function moveMonster(num)

	local num = math.random(1, 4)

	--이동하기
	if num == 1 then
		if monsterLoacation ~= 1 and monsterLoacation ~= 7 and monsterLoacation ~= 13 and monsterLoacation ~= 19 and monsterLoacation ~= 25 and monsterLoacation ~= 31 then
			bridge[monsterLoacation][3].alpha = 0
			bridge[monsterLoacation-1][3].alpha = 1
			monsterLoacation = monsterLoacation - 1
		end
elseif num == 2 then
		if monsterLoacation ~= 6 and monsterLoacation ~= 12 and monsterLoacation ~= 18 and monsterLoacation ~= 19 and monsterLoacation ~= 24 and monsterLoacation ~= 30 then
			bridge[monsterLoacation][3].alpha = 0
			bridge[monsterLoacation+1][3].alpha = 1
			monsterLoacation = monsterLoacation + 1
		end
elseif num == 3 then
		if monsterLoacation ~= 1 and monsterLoacation ~= 2 and monsterLoacation ~= 3 and monsterLoacation ~= 4 and monsterLoacation ~= 5 and monsterLoacation ~= 6 then
			bridge[monsterLoacation][3].alpha = 0
			bridge[monsterLoacation-6][3].alpha = 1
			monsterLoacation = monsterLoacation - 6
		end
	elseif num == 4 then
		if monsterLoacation ~= 31 and monsterLoacation ~= 32 and monsterLoacation ~= 33 and monsterLoacation ~= 34 and monsterLoacation ~= 35 and monsterLoacation ~= 36 then
			bridge[monsterLoacation][3].alpha = 0
			bridge[monsterLoacation+6][3].alpha = 1
			monsterLoacation = monsterLoacation + 6
		end
	end

	if bridge[monsterLoacation][2].alpha == 1 and bridge[monsterLoacation][3].alpha == 1 and bool == false then -- 캐릭터 잡았을 경우
		bridge[Bnum][2].alpha = 0 -- 현재 위치 캐릭터 투명화
		bridge[1][2].alpha = 1 --처음위치로
		Bnum = 1
	end
end

 --몬스터 이동하기2
 monsterLoacation2 = 33--시작
 local function moveMonster2(num)

	local num = math.random(1, 4)

	--이동하기
	if num == 1 then
		if monsterLoacation2 ~= 1 and monsterLoacation2 ~= 7 and monsterLoacation2 ~= 13 and monsterLoacation2 ~= 19 and monsterLoacation2 ~= 25 and monsterLoacation2 ~= 31 then
			bridge[monsterLoacation2][3].alpha = 0
			bridge[monsterLoacation2-1][3].alpha = 1
			monsterLoacation2 = monsterLoacation2 - 1
		end
elseif num == 2 then
		if monsterLoacation2 ~= 6 and monsterLoacation2 ~= 12 and monsterLoacation2 ~= 18 and monsterLoacation2 ~= 19 and monsterLoacation2 ~= 24 and monsterLoacation2 ~= 30 then
			bridge[monsterLoacation2][3].alpha = 0
			bridge[monsterLoacation2+1][3].alpha = 1
			monsterLoacation2 = monsterLoacation2 + 1
		end
elseif num == 3 then
		if monsterLoacation2 ~= 1 and monsterLoacation2 ~= 2 and monsterLoacation2 ~= 3 and monsterLoacation2 ~= 4 and monsterLoacation2 ~= 5 and monsterLoacation2 ~= 6 then
			bridge[monsterLoacation2][3].alpha = 0
			bridge[monsterLoacation2-6][3].alpha = 1
			monsterLoacation2 = monsterLoacation2 - 6
		end
	elseif num == 4 then
		if monsterLoacation2 ~= 31 and monsterLoacation2 ~= 32 and monsterLoacation2 ~= 33 and monsterLoacation2 ~= 34 and monsterLoacation2 ~= 35 and monsterLoacation2 ~= 36 then
			bridge[monsterLoacation2][3].alpha = 0
			bridge[monsterLoacation2+6][3].alpha = 1
			monsterLoacation2 = monsterLoacation2 + 6
		end
	end

	if bridge[monsterLoacation2][2].alpha == 1 and bridge[monsterLoacation2][3].alpha == 1 then -- 캐릭터 잡았을 경우
		bridge[Bnum][2].alpha = 0 -- 현재 위치 캐릭터 투명화
		bridge[1][2].alpha = 1 --처음위치로
		Bnum = 1
	end
end

--몬스터 이동하기3
 monsterLoacation2 = 11--시작
 local function moveMonster3(num)

	local num = math.random(1, 4)

	--이동하기
	if num == 1 then
		if monsterLoacation2 ~= 1 and monsterLoacation2 ~= 7 and monsterLoacation2 ~= 13 and monsterLoacation2 ~= 19 and monsterLoacation2 ~= 25 and monsterLoacation2 ~= 31 then
			bridge[monsterLoacation2][3].alpha = 0
			bridge[monsterLoacation2-1][3].alpha = 1
			monsterLoacation2 = monsterLoacation2 - 1
		end
elseif num == 2 then
		if monsterLoacation2 ~= 6 and monsterLoacation2 ~= 12 and monsterLoacation2 ~= 18 and monsterLoacation2 ~= 19 and monsterLoacation2 ~= 24 and monsterLoacation2 ~= 30 then
			bridge[monsterLoacation2][3].alpha = 0
			bridge[monsterLoacation2+1][3].alpha = 1
			monsterLoacation2 = monsterLoacation2 + 1
		end
elseif num == 3 then
		if monsterLoacation2 ~= 1 and monsterLoacation2 ~= 2 and monsterLoacation2 ~= 3 and monsterLoacation2 ~= 4 and monsterLoacation2 ~= 5 and monsterLoacation2 ~= 6 then
			bridge[monsterLoacation2][3].alpha = 0
			bridge[monsterLoacation2-6][3].alpha = 1
			monsterLoacation2 = monsterLoacation2 - 6
		end
	elseif num == 4 then
		if monsterLoacation2 ~= 31 and monsterLoacation2 ~= 32 and monsterLoacation2 ~= 33 and monsterLoacation2 ~= 34 and monsterLoacation2 ~= 35 and monsterLoacation2 ~= 36 then
			bridge[monsterLoacation2][3].alpha = 0
			bridge[monsterLoacation2+6][3].alpha = 1
			monsterLoacation2 = monsterLoacation2 + 6
		end
	end

	if bridge[monsterLoacation2][2].alpha == 1 and bridge[monsterLoacation2][3].alpha == 1 then -- 캐릭터 잡았을 경우
		bridge[Bnum][2].alpha = 0 -- 현재 위치 캐릭터 투명화
		bridge[1][2].alpha = 1 --처음위치로
		Bnum = 1
	end
end
----------------------------------------------------

--버튼 넣어주기
-- 왼쪽
   gameUI[1] = widget.newButton({ defaultFile = "image/left.png", width = 150, height = 150, onPress = inputEvent })
   gameUI[1].x, gameUI[1].y = display.contentWidth-200-90, display.contentHeight-150
   gameUI[1].name = "L"

-- 위쪽
   gameUI[2] = widget.newButton({ defaultFile = "image/up.png", width = 150, height = 150, onPress = inputEvent })
   gameUI[2].x, gameUI[2].y = display.contentWidth-205, display.contentHeight-150-100
   gameUI[2].name = "U"

 -- 오른쪽
   gameUI[3] = widget.newButton({ defaultFile = "image/right.png", width = 150, height = 150, onPress = inputEvent })
   gameUI[3].x, gameUI[3].y = display.contentWidth-200+90, display.contentHeight-150
   gameUI[3].name = "R"

 -- 아래쪽
   gameUI[4] = widget.newButton({ defaultFile = "image/down.png", width = 150, height = 150, onPress = inputEvent })
   gameUI[4].x, gameUI[4].y = display.contentWidth-205, display.contentHeight-150+100
   gameUI[4].name = "D"
--------------------------------------------------------


 --타이머 설정

 local time = 15
 local Text = display.newText(string.format("%02d", time), display.contentWidth*4/5, 200, "돋움", 80)
 Text:setFillColor(1, 0.2, 0.2)

 local function Timer(event)
 	time = time - 1
 	local sec = time % 60
 	local tDisplay = string.format("%02d", sec)
 	Text.text = tDisplay

 	local moveM1 = timer.performWithDelay(50, moveMonster)
 	local moveM2 = timer.performWithDelay(50, moveMonster2)
 	local moveM3 = timer.performWithDelay(50, moveMonster3)

 	if time == 0 and bool == false then --미션 실패 시 처음으로 돌아감
 		bridge[Bnum][2].alpha = 0 -- 현재 위치 캐릭터 투명화
		bridge[1][2].alpha = 1 --처음위치로
		Bnum = 1
	end

	--타이머 끝났을때 다시 시작
	if time == 0 then
		time = 15
		timer.performWithDelay(1000, Timer, time)
	end

end

 cTimer = timer.performWithDelay(1000, Timer, time)
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