
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

---- set up track tiles
local trackGraphicsArray =
{
	frames =
	{
		--1)regular track
		{
			x=4,
			y=17,
			width=26,
			height=24
		},
		--2)track with starting blocks
		{
			x=33,
			y=17,
			width=36,
			height=24
		},
		--3)half track block with little marker
		{
			x=72,
			y=17,
			width=14,
			height=24
		},
	}
}

---- set up backgound tiles
local backgroundGraphicsArray =
{
	frames =
	{
		--1)hills
		{
			x=113,
			y=149,
			width=25,
			height=79
		},
		--2)front grass
		{
			x=3,
			y=51,
			width=56,
			height=24
		},
		--3)back grass
		{
			x=3,
			y=42,
			width=56,
			height=8
		},
		--4)stadium wall
		{
			x=91,
			y=110,
			width=28,
			height=25
		},
		--5) pink crowd
		{
			x=120,
			y=117,
			width=28,
			height=15
		},
		--6) yellow crowd
		{
			x=149,
			y=117,
			width=28,
			height=15
		},
		--7) top of stands 1
		{
			x=120,
			y=110,
			width=28,
			height=6
		},
		--8) top of stands 2
		{
			x=149,
			y=110,
			width=28,
			height=6
		},
		--9) front grass 2
		{
			x=59,
			y=51,
			width=56,
			height=24
		},
		--10) back grass 2
		{
			x=59,
			y=42,
			width=56,
			height=8
		},
	}
}

-- frames for top of stadium animation
local stadiumTopAnimateArray =
{
	frames =
	{
		--1)normal
		{
			x=120,
			y=110,
			width=28,
			height=6
		},
		--2)normal
		{
			x=120,
			y=110,
			width=28,
			height=6
		},
		--3)normal
		{
			x=120,
			y=110,
			width=28,
			height=6
		},
		--4)normal
		{
			x=120,
			y=110,
			width=28,
			height=6
		},
		--5)normal
		{
			x=120,
			y=110,
			width=28,
			height=6
		},
		--6)normal
		{
			x=120,
			y=110,
			width=28,
			height=6
		},
		--7)normal
		{
			x=120,
			y=110,
			width=28,
			height=6
		},
		--8)normal
		{
			x=120,
			y=110,
			width=28,
			height=6
		},
		--9)normal
		{
			x=120,
			y=110,
			width=28,
			height=6
		},
		--10)special
		{
			x=149,
			y=110,
			width=28,
			height=6
		},
	}
}

-- frames for crowd animation
local crowdAnimateArray =
{
	frames =
	{
		--1) pink crowd
		{
			x=120,
			y=117,
			width=28,
			height=15
		},
		--2) yellow crowd
		{
			x=149,
			y=117,
			width=28,
			height=15
		},
	}
}

local frontGrassAnimateArray = {
	frames =
	{
		--1)front grass 1
		{
			x=3,
			y=51,
			width=56,
			height=24
		},
		--2) front grass 2
		{
			x=59,
			y=51,
			width=56,
			height=24
		},
	}
}

local backGrassAnimateArray = {
	frames =
	{
		--1)back grass 1
		{
			x=3,
			y=42,
			width=56,
			height=8
		},

		--2) back grass 2
		{
			x=59,
			y=42,
			width=56,
			height=8
		},
	}
}

-- for i=1,2,3,4,5 for 10 sec
-- for i=0 for 8 sec after initial animation
local trackAnimateArrayReg = {
	frames =
	{
		--1) marker
		{
			x=72,
			y=17,
			width=14,
			height=24
		},
		--2) regular
		{
			x=4,
			y=17,
			width=26,
			height=24
		},
	}
}

-- for i=0 for 2 sec at beginning
local trackAnimateArrayStart = {
	frames =
	{
		--1) starting blocks
		{
			x=33,
			y=17,
			width=36,
			height=24
		},
		--2) marker?? whichever is immediately ahead of it in animation
		{
			x=72,
			y=17,
			width=14,
			height=24
		},
	}
}


-- for i=6 do frames {1,3} for i=7 do frames {1,2} over two seconds
local trackAnimateArrayEnd6 = {
	frames =
	{
		--1)finishline pre
		{
			x=0,
			y=1,
			width = 22,
			height = 40
		},
		--2)finishline post
		{
			x=24,
			y=1,
			width=22,
			height=40
		},
	}
}

local trackAnimateArrayEnd7_1 = {
	frames =
	{
		--1)finishline pre
		{
			x=0,
			y=1,
			width = 22,
			height = 40
		},
	}
}


-- establish graphics sheets
local trackSheet = graphics.newImageSheet( "NES - Track & Field - Tile Set.png", trackGraphicsArray )
local backgroundSheet = graphics.newImageSheet( "NES - Track & Field - Tile Set.png", backgroundGraphicsArray )
local stadiumTopAnimateSheet = graphics.newImageSheet( "NES - Track & Field - Tile Set.png", stadiumTopAnimateArray )
local crowdAnimateSheet = graphics.newImageSheet( "NES - Track & Field - Tile Set.png", crowdAnimateArray)
local backGrassAnimateSheet = graphics.newImageSheet( "NES - Track & Field - Tile Set.png", backGrassAnimateArray)
local frontGrassAnimateSheet = graphics.newImageSheet( "NES - Track & Field - Tile Set.png", frontGrassAnimateArray)
local trackAnimateSheetStart = graphics.newImageSheet( "NES - Track & Field - Tile Set.png", trackAnimateArrayStart )
local trackAnimateSheetReg = graphics.newImageSheet( "NES - Track & Field - Tile Set.png", trackAnimateArrayReg )
local trackFinishLineAnimateSheet1 = graphics.newImageSheet( "finishline.png", trackAnimateArrayEnd6)
local trackFinishLineAnimateSheet2 = graphics.newImageSheet( "finishline.png", trackAnimateArrayEnd7_1)

-- set up top of stadium sprite sequence
local sequence_topOfStadium = {
    -- consecutive frames sequence
    {
        name = "topOfStadiumAnimate",
		-- number of frames
        start = 1,
        count = 10,
		-- time to loop through all frames in ms
        time = 2000,
		-- how many times to run it (0 means indefinite)
        loopCount = 6,
		-- forward means circular, bounce means reverse at end
        loopDirection = "forward"
    }
}

-- set up crowd animate sprite sequence
local sequence_crowd = {
    -- consecutive frames sequence
    {
        name = "crowdAnimate",
		-- number of frames
        start = 1,
        count = 2,
		-- time to loop through all frames in ms
        time = 400,
		-- how many times to run it (0 means indefinite)
        loopCount = 30,
		-- forward means circular, bounce means reverse at end
        loopDirection = "forward"
    }
}

local sequence_frontGrass = {
	--consecutive frames sequence
	{
		name = "frontGrassAnimate",
		-- number of frames
		start=1,
		count=2,
		--time to loop through all frames in ms
		time = 400,
		--how many times to run it
		loopCount=30,
		loopDirection="forward"
	}
}

local sequence_backGrass = {
	--consecutive frames sequence
	{
		name = "backGrassAnimate",
		-- number of frames
		start=1,
		count=2,
		--time to loop through all frames in ms
		time = 400,
		--how many times to run it
		loopCount=30,
		loopDirection="forward"
	}
}

-- set up intial track animate sprite sequences
local sequence_trackStarting = {
	-- consecute frames sequence
	{
		name = "startingBlocksAnimate",
		--number of frames
		start = 1,
		count = 2,
		--time to loop through all frames in ms
		time = 2000,
		--how many time to run it
		loopCount = 1,
		loopDirection = "forward"
	}
}
local sequence_trackRegMiddle = {
	--consecutive frames sequence
	{
		name = "regularTrackAnimateMiddle",
		--number of frames
		start = 1,
		count = 2,
		--time to looop through all frames in ms
		time = 2000,
		loopCount = 5,
		loopDirection = "forward"
	}
}
local sequence_trackRegFrontEnd = {
	--consecutive frames sequence
	{
		name = "regularTrackAnimateFrontEnd",
		--number of frames
		start = 1,
		count = 2,
		--time to looop through all frames in ms
		time = 2000,
		loopCount = 4,
		loopDirection = "forward"
	}
}


local sequence_trackFinishLine6 = {
	{
		name = "finishLine6",
		start= 1,
		count= 2,
		time=2000,
		loopCount = 1,
		loopDirection="forward"
	}
}

local sequence_trackFinishLine7 = {
	{
		name = "finishLine7",
		start= 1,
		count= 1,
		time=1000,
		loopCount = 1,
		loopDirection="forward"
	}
}

-- table for stadium top animates
local stadiumAnimateTable = {}
-- table for crowd animates
local crowdAnimateTable = {}
-- table for front grass animates
local frontGrassAnimateTable= {}
-- table for back grass animates
local backGrassAnimateTable= {}
-- table for track animates
local trackAnimateTable = {}

-- create stadium top, crowd, front, and back grass sprites and add to table
local newAnimate
local i = 0
while i<8 do
	newAnimate = display.newSprite(stadiumTopAnimateSheet , sequence_topOfStadium)
	stadiumAnimateTable[i] = newAnimate
	newAnimate = display.newSprite(crowdAnimateSheet, sequence_crowd)
	crowdAnimateTable[i] = newAnimate
	newAnimate = display.newSprite(frontGrassAnimateSheet, sequence_frontGrass)
	frontGrassAnimateTable[i] = newAnimate
	newAnimate = display.newSprite(backGrassAnimateSheet, sequence_backGrass)
	backGrassAnimateTable[i] = newAnimate
	-- track sprites
	-- middle of track gets reg
	if (i>0 and i<6) then
		newAnimate = display.newSprite(trackAnimateSheetReg,sequence_trackRegMiddle)
	elseif (i==0) then
		newAnimate = display.newSprite(trackAnimateSheetStart, sequence_trackStarting)
	else
		newAnimate = display.newSprite(trackAnimateSheetReg, sequence_trackRegFrontEnd)
	end
	trackAnimateTable[i] = newAnimate
	i=i+1
end
newAnimate=nil

-- initialize variables
local speed = 0
local heatTime
local speedText
local timerText
local officialText
local swipeDirections

local backGroup
local mainGroup
local uiGroup

local runnningSound
local crowdSound
local gunSound

local gameLoopTimer
-- Declare top static track
local topStaticTrack = {}


local function endGame()
	composer.setVariable( "finalHeatTime", heatTime )
	composer.gotoScene( "toptimes" , {time=800, effect="crossFade"} )
end

local function startOfRace()
	-- specific set frames for animations
	for i=0,7 do
		if i%2==0 then
			crowdAnimateTable[i]:setFrame(2)
			backGrassAnimateTable[i]:setFrame(2)
			frontGrassAnimateTable[i]:setFrame(2)
		end
		stadiumAnimateTable[i]:setFrame(i+1)
	end
	-- separate set frames for track because tricky
	for i=1,6 do
		if(i<6 and i%2==0) then
			trackAnimateTable[i]:setFrame(2)
		elseif(i==6) then
			trackAnimateTable[i]:setFrame(2)
		end
	end

	-- do scaling and positioning
	for i=0,7 do
		if (i==0) then
			trackAnimateTable[i]:scale(3.55, 5.33)
		elseif (i>0) then
			trackAnimateTable[i]:scale(9.14, 5.33)
		end
		crowdAnimateTable[i]:scale(4.57, 4.66)
		crowdAnimateTable[i].x = 64+128*i
		crowdAnimateTable[i].y = 245
		stadiumAnimateTable[i]:scale(4.57,6.66)
		stadiumAnimateTable[i].x = 64+128*i
		stadiumAnimateTable[i].y = 190
		backGrassAnimateTable[i]:scale(2.29,10)
		backGrassAnimateTable[i].x =64+128*i
		backGrassAnimateTable[i].y =448
		frontGrassAnimateTable[i]:scale(2.29,7.08)
		frontGrassAnimateTable[i].x =64+128*i
		frontGrassAnimateTable[i].y = 701
		trackAnimateTable[i].x = 64+128*i
		trackAnimateTable[i].y = 552
		trackAnimateTable[i]:play()
		crowdAnimateTable[i]:play()
		stadiumAnimateTable[i]:play()
		backGrassAnimateTable[i]:play()
		frontGrassAnimateTable[i]:play()
	end
end


local function endGame()
	composer.setVariable( "finalHeatTime", heatTime )
    composer.gotoScene( "toptimes", { time=800, effect="crossFade" } )
end

local function endOfRace()
	-- replace starting block spot with reg track spot
	display.remove(topStaticTrack[1])
	topStaticTrack[1] = display.newImageRect( backGroup, trackSheet, 3, 128, 128)
	topStaticTrack[1].x=64+128
	topStaticTrack[1].y=552
	for i=0,7 do
		display.remove( crowdAnimateTable[i])
		display.remove( stadiumAnimateTable[i])
		display.remove( frontGrassAnimateTable[i] )
		display.remove( backGrassAnimateTable[i] )
		display.remove( trackAnimateTable[i])
		display.remove( topStaticTrack[i])
		topStaticTrack[i]=nil
		trackAnimateTable[i] = nil
		crowdAnimateTable[i] = nil
		stadiumAnimateTable[i] = nil
		frontGrassAnimateTable[i] = nil
		backGrassAnimateTable[i] = nil
	end
	-- send to top times
	timer.performWithDelay( 2000, endGame, 1 )

end

local function onYourMark()
	officialText.text = "On Your Mark!"
end

local function getSet()
	officialText.text = "Get Set!"
end

local function go()
	officialText.text = "GO!"
	swipeDirections.text = "Swipe repeatedly across screen!"
end

local function afterStartOfRace()
	officialText.text = ""
	--change i=0 track animation
	display.remove(trackAnimateTable[0])
	trackAnimateTable[0] = display.newSprite(trackAnimateSheetReg, sequence_trackRegFrontEnd)
	trackAnimateTable[0]:setFrame(2)
	trackAnimateTable[0]:scale(9.14, 5.33)
	trackAnimateTable[0].x=64+128
	trackAnimateTable[0].y=552
	trackAnimateTable[0]:play()
end

local function finishRaceBlock7()
	-- this happens at 8 seconds for 1 second
	display.remove( trackAnimateTable[7] )
	trackAnimateTable[7] = display.newSprite(trackFinishLineAnimateSheet2, sequence_trackFinishLine7)
	trackAnimateTable[7]:scale(5.81,5.33)
	trackAnimateTable[7].x=64+128*7
	trackAnimateTable[7].y=510
	trackAnimateTable[7]:play()

end

local function finishRaceBlock6()
	-- this happens at 9 seconds
	display.remove(trackAnimateTable[6])
	display.remove(trackAnimateTable[7])
	trackAnimateTable[6] = display.newSprite(trackFinishLineAnimateSheet1, sequence_trackFinishLine6)
	trackAnimateTable[6]:scale(5.81, 5.33)
	trackAnimateTable[6].x=64+128*6
	trackAnimateTable[6].y=510
	trackAnimateTable[6]:play()
end




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	-- pause the audio
	audio.pause( 1 )
	-- Set up display groups
	backGroup = display.newGroup()
	sceneGroup:insert(backGroup)

	mainGroup = display.newGroup()
	sceneGroup:insert(mainGroup)

	uiGroup = display.newGroup()
	sceneGroup:insert(uiGroup)



	-- Load the background for the race
	local sky = display.newImageRect(backGroup, "sky.png", 1024, 786)
	sky.x=display.contentCenterX
	sky.y=display.contentCenterY

	-- Load static front grass
	local staticFrontGrass = display.newImageRect(backGroup, backgroundSheet, 2, 1024, 170)

	staticFrontGrass.x = display.contentCenterX
	staticFrontGrass.y = display.contentHeight-85

	-- Load bottom static track to make up for blanks between track tiles
	local bottomStaticTrack = display.newImageRect(backGroup, trackSheet, 1, 1024, 128)
	bottomStaticTrack.x = display.contentCenterX
	bottomStaticTrack.y = 552

	-- load top track for detailed track
	for i=0,7 do
		local newStaticTrack
		--reg track on evens
		if (i == 0 or i%2==0) then
			newStaticTrack = display.newImageRect( backGroup, trackSheet, 1, 128, 128)
		-- starting block
		elseif (i == 1) then
			newStaticTrack = display.newImageRect( backGroup, trackSheet, 2, 128, 128)
		-- marked track on odds
		elseif (i%2 ~= 0) then
			newStaticTrack = display.newImageRect( backGroup, trackSheet, 3, 128, 128)
		end
		newStaticTrack.x = 64+128*i
		newStaticTrack.y = 552
		table.insert(topStaticTrack, newStaticTrack)
	end

	-- Load static back grass
	local staticBackGrass = display.newImageRect(backGroup, backgroundSheet, 3, 1024,80)
	staticBackGrass.x = display.contentCenterX
	staticBackGrass.y = 448

	-- Load stadium wall
	local stadiumWall = {}
	for i=0,8 do
		local newStadiumWall = display.newImageRect(backGroup, backgroundSheet, 4, 128,128)
		newStadiumWall.x = 64+128*i
		newStadiumWall.y = 344
		table.insert(stadiumWall, newStadiumWall)
	end

	-- Load crowd
	local crowd = {}
	for i=0,8 do
		local newCrowd
		if i%2==0 then
			newCrowd= display.newImageRect(backGroup, backgroundSheet, 5, 128, 70)
		else
			newCrowd= display.newImageRect(backGroup, backgroundSheet, 6, 128, 70)
		end
		newCrowd.x = 64+128*i
		newCrowd.y = 245
		table.insert(crowd, newCrowd)
	end

	-- Load top of stadium
	local stadiumTop = {}
	for i=0,8 do
		local newStadiumTop = display.newImageRect(backGroup, backgroundSheet, 7, 128, 40)
		newStadiumTop.x = 64+128*i
		newStadiumTop.y = 190
		table.insert(stadiumTop, newStadiumTop)
	end

	-- Load space for official text
	officialText = display.newText(uiGroup, "", 900, 344, native.systemFont, 36 )
	-- Load space for "SWIPE REPEATEDLY ACROSS SCREEN" message
	swipeDirections = display.newText(uiGroup, "", display.contentCenterX, 100, native.systemFont, 44)

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
		timer.performWithDelay( 1000, onYourMark, 1 )
		timer.performWithDelay( 2000, getSet, 1 )
		timer.performWithDelay( 3000, go, 1 )
		timer.performWithDelay( 3000, startOfRace, 1)
		timer.performWithDelay( 5000, afterStartOfRace, 1 )
		timer.performWithDelay( 11000, finishRaceBlock7, 1)
		timer.performWithDelay( 12000, finishRaceBlock6, 1)
		timer.performWithDelay( 15000, endOfRace, 1)
	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		composer.removeScene( "game" )
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
