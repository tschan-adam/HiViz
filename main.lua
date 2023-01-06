--[[
    MADE BY PLAYSAMAY4 
]]


Anim = require "flux"
Timer = require "timer"
local sock = require "sock"
KeepTopText = ""
KeepBottomText = ""

server = sock.newServer("*", 22122)

ThemeColor = {185/255, 0,0}
--ThemeColor = {123/255, 15/255, 125/255}

require "Headlines"
require "PlaceName"
require "TitleLogo"
require "Transition"
require "Ticker"
require "requests"
require "LowerThirdFull"
require "BreakfastIntroClock"
require "LowerThirdClock"
require "Flash"

function love.load()
    Fader = love.graphics.newImage("HeadlineFade.png")

    VBNSmall = love.graphics.newImage("WhiteLogoTransparent.png")

    ReithSerif = love.graphics.newFont("ReithSerifRg.ttf",130)
    ReithSansBold = love.graphics.newFont("ReithSansBd.ttf",30)
    ReithSansRegular = love.graphics.newFont("ReithSansRg.ttf",30)

    TickerFont = love.graphics.newFont("ReithSansMd.ttf",32)
    PresenterName = love.graphics.newFont("ReithSerifMd.ttf",56)

end

--Fix the ticker scissore8938e098e0982093e80128039ec821930c82913ec209318e9038e9c0382ec0918c092
function love.update(dt)
    Anim.update(dt)
    Timer.update(dt)
    server:update()

    UpdateBreakfastIntroClock()
    UpdateLowerThirdClock()
end
function love.draw()
    love.graphics.setBackgroundColor(0,0,0,0)

    DrawTransition()

    DrawFlash()

    DrawLowerThirdFull()

    DrawPlaceName()

    DrawTitleLogo()

    DrawBreakfastIntroClock()

    DrawLowerThirdClock()
    
    if Single then DrawHeadlineSingle() else DrawHeadlineDouble() end


    
end
function love.keypressed(key)
    if key == "escape" then love.event.quit() end
    
    if key == "1" then
        Single = true
        ShowHeadlineSingle()
    end

    if key == "2" then
        HideHeadlineSingle()
    end

    if key == "3" then
        Single = false
        ShowHeadlineDouble()
    end

    if key == "4" then
        HideHeadlineDouble()
    end

    if key == "g" then
        AdvHeadline()
    end

    if key == "right" then
        ShowPlaceName("LIVE   BNN STUDIOS")
    end
    if key == "left" then
        HidePlaceName()
    end

    if key == "lshift" then
        ShowTitleLogo()
    end
    if key == "rshift" then
        HideTitleLogo()
    end

    if key == "space" then
        ShowTransition()
    end

    if key == "down" then
        HideLowerThirdFull()
    end

    if key == "up" then
        ShowLowerThirdFull()
    end

    if key == "=" then
        ShowPresenterName()
    end

    if key == "-" then
        HidePresenterName()
    end

    if key == "\\" then
        HideBreakfastIntroClock()
    end

    if key == ";" then
        ShowBreakfastIntroClock()
    end

    if key == "5" then
        ShowLowerThirdText("Local couple does idiot thing", {"A couple decided to go to the same movie at the same time but at different theatres"})
    end

    if key == "6" then
        HideLowerThirdText()
    end

    if key == "7" then
        ShowProgramBadge("NEWS AT NINE", {1,1,1,1}, ThemeColor)
    end

    if key == "8" then
        HideProgramBadge()
    end

    if key == "kp*" then
        ShowBG = not ShowBG
    end

    if key == "kp1" then
        ShowTickerOnly()
    end

    if key == "kp2" then
        HideTickerOnly()
    end

    if key == "9" then 
        ShowLowerThirdClock()
    end

    if key == "0" then 
        HideLowerThirdClock()
    end


end




--HideHeadlineSingle()
--HidePlaceName()

HideHeadlineInstant()
HidePlaceNameInstant()
HideLowerThirdFullInstant()
HideBreakfastIntroClockInstant()
HideLowerThirdClockInstant()
--ShowLowerThirdFull()



