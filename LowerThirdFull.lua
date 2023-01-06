local vbnTextReithSansBold = love.graphics.newFont("ReithSansBd.ttf",35)


LowerThirdFull = {
    WhitePart = {
        x = 0,
        y = 988,
        w = 1920,
        h = 98,
        col = {254/255, 251/255, 254/255, 0.85}
    },

    ClearPart = {
        x = 0,
        y = 940,
        w = 1920,
        h = 48,
        col = {0, 0, 0, 0.8}
    },

    ClearPartScissor = {
        x = 0,
        y = 940,
        w = 1920,
        h = 48,
    },

    PresenterNameScissor = {
        x = 270,
        y = 860,
        w = 1920,
        h = 48+32,
    },
    

    vbnBox = {
        x = 277,
        y = 940,
        w = 255,
        h = 48,
        col = ThemeColor
    },

    vbnText = {
        x = 413,
        y = 934,
        w = 255,
        h = 48,
        col = {1, 1, 1, 1},
        Text = "NEWS"
    },
    LowerThirdShowing = true,

    --Presenter Name text
    PresenterName = {
        x = 280,
        y = 940,
        w = 1920,
        h = 48,
        col = {1, 1, 1, 1},
        Text = "Big Man\nProfessional stingray"
    },

    PresenterSubtitle = {
        x = 281,
        y = 1100,
        w = 1920,
        h = 48,
        col = {1, 1, 1, 1},
        Font = love.graphics.newFont("ReithSansMd.ttf", 40),
    },
    PresenterNameShowing = false,

    --Ticker
    TickerText = {
        x = 310,
        y = 986,
        col = {0.2,0.2,0.2,0},
        Text = "bbc.co.uk/news"
    },

    TickerBlock = {
        x = 288,
        y = 1005,
        w = 10,
        h = 12,
        col = {ThemeColor[1],ThemeColor[2],ThemeColor[3],0}
    },
    TickerScissor = false,


    LowerThirdTitle = {
        x = 290,
        y = 980,
        col = {1,1,1,1},
        Text = ""
    },

    LowerThirdSubtitle1 = {
        x = 290,
        y = 1060,
        col = {1,1,1,1},
        Text = "Lower Third Subtitle 1"
    },

    LowerThirdSubtitle2 = {
        x = 290,
        y = 1110,
        col = {1,1,1,1},
        Text = "Lower Third Subtitle 2"
    },
    OnSubtitle = 1,

    LowerThirdTitleShowing = false,

    LowerThirdSubtitleFont = love.graphics.newFont("ReithSansMd.ttf",40),

    ProgramBadge = {
        x = 1430,
        y = 940,
        w = 150,
        h = 48,
        bcol = {0,0,0,0},
        tcol = {1,1,1,1},
        Text = "",
        Font = love.graphics.newFont("ReithSansMd.ttf",30)
    }
}

function DrawLowerThirdFull()

    LowerThirdFull.vbnBox.w = 137 + vbnTextReithSansBold:getWidth(LowerThirdFull.vbnText.Text) + 10

    love.graphics.setScissor(LowerThirdFull.ClearPartScissor.x,LowerThirdFull.ClearPartScissor.y,LowerThirdFull.ClearPartScissor.w,LowerThirdFull.ClearPartScissor.h)
        love.graphics.setColor(LowerThirdFull.ClearPart.col)
        love.graphics.rectangle("fill",LowerThirdFull.ClearPart.x,LowerThirdFull.ClearPart.y,LowerThirdFull.ClearPart.w,LowerThirdFull.ClearPart.h)

        --Presenter name
        love.graphics.setScissor(LowerThirdFull.PresenterNameScissor.x,LowerThirdFull.PresenterNameScissor.y,LowerThirdFull.PresenterNameScissor.w,LowerThirdFull.PresenterNameScissor.h)
            love.graphics.setColor(LowerThirdFull.PresenterName.col)
            love.graphics.setFont(PresenterName)
            --Put text into array by lines
            local PresenterNameText = {}
            for line in LowerThirdFull.PresenterName.Text:gmatch("[^\n]+") do
                table.insert(PresenterNameText, line)
            end
            love.graphics.printf(PresenterNameText[1],LowerThirdFull.PresenterName.x,LowerThirdFull.PresenterName.y,LowerThirdFull.PresenterName.w,"left")

            --Presenter subtitle
            love.graphics.setColor(LowerThirdFull.PresenterSubtitle.col)
            love.graphics.setFont(LowerThirdFull.PresenterSubtitle.Font)
            if PresenterNameText[2] ~= nil then love.graphics.printf(PresenterNameText[2],LowerThirdFull.PresenterSubtitle.x,LowerThirdFull.PresenterSubtitle.y,LowerThirdFull.PresenterSubtitle.w,"left") end
            
        
        --Set scissor for subtitles
        --TO DO
        --Subtitle 1
        love.graphics.setScissor(290,930,1920,58)
            love.graphics.setColor(LowerThirdFull.LowerThirdSubtitle1.col)
            love.graphics.setFont(LowerThirdFull.LowerThirdSubtitleFont)
            love.graphics.printf(LowerThirdFull.LowerThirdSubtitle1.Text,LowerThirdFull.LowerThirdSubtitle1.x,LowerThirdFull.LowerThirdSubtitle1.y,1920,"left")

            --Subtitle 2
            if LowerThirdFull.LowerThirdSubtitle2.Text ~= nil then 
                love.graphics.setColor(LowerThirdFull.LowerThirdSubtitle2.col)
                love.graphics.setFont(LowerThirdFull.LowerThirdSubtitleFont)
                love.graphics.printf(LowerThirdFull.LowerThirdSubtitle2.Text,LowerThirdFull.LowerThirdSubtitle2.x,LowerThirdFull.LowerThirdSubtitle2.y,1920,"left")
            end


        --Reset to big scissor
        love.graphics.setScissor(LowerThirdFull.ClearPartScissor.x,LowerThirdFull.ClearPartScissor.y,LowerThirdFull.ClearPartScissor.w,LowerThirdFull.ClearPartScissor.h)

        love.graphics.setColor(LowerThirdFull.vbnBox.col)
        love.graphics.rectangle("fill",LowerThirdFull.vbnBox.x,LowerThirdFull.vbnBox.y,LowerThirdFull.vbnBox.w,LowerThirdFull.vbnBox.h)

        love.graphics.setColor(1,1,1,1)
        love.graphics.draw(VBNSmall,LowerThirdFull.vbnBox.x+13,LowerThirdFull.vbnBox.y+7, 0 , 0.045, 0.045)

        love.graphics.setColor(LowerThirdFull.vbnText.col)
        love.graphics.setFont(vbnTextReithSansBold)
        love.graphics.print(LowerThirdFull.vbnText.Text, LowerThirdFull.vbnText.x, LowerThirdFull.vbnText.y+5)

        --Lower Third Title
        love.graphics.setScissor(0,850,1920,140)
            love.graphics.setColor(LowerThirdFull.LowerThirdTitle.col)
            love.graphics.setFont(PresenterName)
            love.graphics.printf(LowerThirdFull.LowerThirdTitle.Text,LowerThirdFull.LowerThirdTitle.x,LowerThirdFull.LowerThirdTitle.y,1920,"left")


    love.graphics.setScissor()

    love.graphics.setColor(LowerThirdFull.WhitePart.col)
    love.graphics.rectangle("fill",LowerThirdFull.WhitePart.x,LowerThirdFull.WhitePart.y,LowerThirdFull.WhitePart.w,LowerThirdFull.WhitePart.h)


    --Ticker
    if LowerThirdFull.TickerScissor then
        love.graphics.setScissor(280,995,1260,40)
        
    end
        love.graphics.setColor(LowerThirdFull.TickerText.col)
        love.graphics.setFont(TickerFont)
        love.graphics.printf(LowerThirdFull.TickerText.Text, LowerThirdFull.TickerText.x, LowerThirdFull.TickerText.y+5, 1700-LowerThirdFull.TickerText.x, "left")

        love.graphics.setColor(LowerThirdFull.TickerBlock.col)
        love.graphics.rectangle("fill",LowerThirdFull.TickerBlock.x,LowerThirdFull.TickerBlock.y,LowerThirdFull.TickerBlock.w,LowerThirdFull.TickerBlock.h) 

    if LowerThirdFull.TickerScissor then
        love.graphics.setScissor()
    end

    love.graphics.setScissor()
    
    --Program Badge
    love.graphics.setScissor(0,940,1920,48)
        love.graphics.setColor(LowerThirdFull.ProgramBadge.bcol)
        love.graphics.rectangle("fill",LowerThirdFull.ProgramBadge.x,LowerThirdFull.ProgramBadge.y,LowerThirdFull.ProgramBadge.w,LowerThirdFull.ProgramBadge.h)
        love.graphics.setColor(LowerThirdFull.ProgramBadge.tcol)
        love.graphics.setFont(LowerThirdFull.ProgramBadge.Font)
        love.graphics.printf(LowerThirdFull.ProgramBadge.Text,LowerThirdFull.ProgramBadge.x,LowerThirdFull.ProgramBadge.y+3,LowerThirdFull.ProgramBadge.w,"center")

end

function HideLowerThirdFull()
    if LowerThirdFull.LowerThirdShowing == false then return end

    LowerThirdFullShowing = false
    StopTicker()
    HideLowerThirdClock()

    Timer.after(0.5, function()
        if LowerThirdFull.PresenterNameShowing == true then
            HidePresenterName()
            Timer.after(0.7, function() HideLowerThirdFull() end)
            return
        elseif LowerThirdFull.LowerThirdTitleShowing == true then
            HideLowerThirdText()
            Timer.after(0.7, function() HideLowerThirdFull() end)
            return
        end

        --Move the White part down
        Anim.to(LowerThirdFull.WhitePart, 0.8, {y = 1080}):ease("cubicinout")

        --Move the clear part down
        Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 1080}):ease("cubicinout")

        --Move the clearpart scissor down
        Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 1036}):ease("cubicinout")

        --Move the vbn box down
        Anim.to(LowerThirdFull.vbnBox, 0.8, {y = 1080}):ease("cubicinout")

        --Move the vbn text down
        Anim.to(LowerThirdFull.vbnText, 0.8, {y = 1071}):ease("cubicinout")
    
        LowerThirdFull.LowerThirdShowing = false

    end)
end

function ShowLowerThirdFull()
    if LowerThirdFull.LowerThirdShowing == true then return end



    if TitleLogo.Showing == true then
        HideTitleLogo()
        Timer.after(1, function() ShowLowerThirdFull() end)
        return
    end

    LowerThirdFullShowing = true

    Timer.after(0.3, function () ShowLowerThirdClock() end)

    --Move the White part up
    Anim.to(LowerThirdFull.WhitePart, 0.8, {y = 988}):ease("cubicout")

    --Move the clear part up
    Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 940}):ease("cubicout")

    --Move the clearpart scissor up
    Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 940}):ease("cubicout")

    --Move the vbn box up
    Anim.to(LowerThirdFull.vbnBox, 0.8, {y = 940}):ease("cubicout")

    --Move the vbn text up
    Anim.to(LowerThirdFull.vbnText, 0.8, {y = 934}):ease("cubicout")

    Timer.after(0.5, function()
        TickerI = 0
        StartTicker()
    end)

    LowerThirdFull.LowerThirdShowing = true
end

function ShowTickerOnly()
    if LowerThirdFull.LowerThirdShowing == true then return end




    if TitleLogo.Showing == true then
        HideTitleLogo()
        Timer.after(1, function() ShowLowerThirdFull() end)
        return
    end

    LowerThirdFullShowing = true

    Timer.after(0.3, function () ShowLowerThirdClock() end)

    --Move the White part up
    Anim.to(LowerThirdFull.WhitePart, 0.8, {y = 988}):ease("cubicout")

    Timer.after(0.5, function()
        TickerI = 0
        StartTicker()
    end)

    LowerThirdFull.LowerThirdShowing = true
end


function HideTickerOnly()
    if LowerThirdFull.LowerThirdShowing == false then return end

    LowerThirdFullShowing = false
    StopTicker()
    HideLowerThirdClock()

    Timer.after(0.5, function()
        if LowerThirdFull.PresenterNameShowing == true then
            HidePresenterName()
            Timer.after(0.7, function() HideLowerThirdFull() end)
            return
        elseif LowerThirdFull.LowerThirdTitleShowing == true then
            HideLowerThirdText()
            Timer.after(0.7, function() HideLowerThirdFull() end)
            return
        end

        --Move the White part down
        Anim.to(LowerThirdFull.WhitePart, 0.8, {y = 1080}):ease("cubicinout")
    
        LowerThirdFull.LowerThirdShowing = false

    end)
end


function HideLowerThirdFullInstant()
    --Move the White part down
    LowerThirdFull.WhitePart.y = 1080

    --Move the clear part down
    LowerThirdFull.ClearPart.y = 1080

    --Move the clearpart scissor down
    LowerThirdFull.ClearPartScissor.y = 1036

    --Move the vbn box down
    LowerThirdFull.vbnBox.y = 1080

    --Move the vbn text down
    LowerThirdFull.vbnText.y = 1071

    LowerThirdFull.LowerThirdShowing = false
end


function ShowPresenterName()
    if LowerThirdFull.PresenterNameShowing == true then return end

    --If text has one line then
    if LowerThirdFull.PresenterName.Text:find("\n") == nil then
        --Set scissor height and y
        LowerThirdFull.PresenterNameScissor.y = 860
        LowerThirdFull.PresenterNameScissor.h = 80

        LowerThirdFull.PresenterNameShowing = true

        LowerThirdFull.PresenterName.y = 940
    
        --Expand clear part up
        Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 940-75, h = 125}):ease("cubicout") 
    
        --Expand clear part scissor up
        Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 940-140, h = 190}):ease("cubicout")
    
        --Move presenter name up
        Anim.to(LowerThirdFull.PresenterName, 0.8, {y = 860}):ease("cubicout"):delay(0.1)
    else    
        --Set scissor height and y
        LowerThirdFull.PresenterNameScissor.y = 760
        LowerThirdFull.PresenterNameScissor.h = 180

        LowerThirdFull.PresenterNameShowing = true

        LowerThirdFull.PresenterName.y = 940

        --Expand clear part up
        Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 940-120, h = 170}):ease("cubicout") 

        --Expand clear part scissor up
        Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 940-180, h = 230}):ease("cubicout")

        --Move presenter name up
        Anim.to(LowerThirdFull.PresenterName, 0.8, {y = 813}):ease("cubicout"):delay(0.1)

        --Move subtitle up
        Anim.to(LowerThirdFull.PresenterSubtitle, 1, {y = 880}):ease("cubicout")

    end
    
end

function HidePresenterName()
    if LowerThirdFull.PresenterNameShowing == false then
        return
    end

    LowerThirdFull.PresenterNameShowing = false
    --Shrink clear part down
    Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 940, h = 50}):ease("cubicinout")

    --Shrink clear part scissor down
    Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 940, h = 50}):ease("cubicinout")

    --Move presenter name down
    Anim.to(LowerThirdFull.PresenterName, 0.8, {y = 932}):ease("cubicinout")

    --Move subtitle down
    Anim.to(LowerThirdFull.PresenterSubtitle, 1, {y = 1100}):ease("cubicinout")
end

--Add BREAKING
--Add COMING UP
--Add IN BRIEF
--Add Program title

function ShowLowerThirdText(Title, Subtitles)

    if LowerThirdFull.LowerThirdShowing == false then
        ShowLowerThirdFull()
        Timer.after(0.7, function() ShowLowerThirdText(Title, Subtitles) end)
        return
    elseif LowerThirdFull.PresenterNameShowing == true then
        HidePresenterName()
        Timer.after(0.8, function() ShowLowerThirdText(Title, Subtitles) end)
        return
    end

    LowerThirdFull.LowerThirdTitleShowing = true

    LowerThirdFull.LowerThirdTitle.Text = Title

    LowerThirdFull.LowerThirdSubtitle1.Text = Subtitles[1]
    LowerThirdFull.LowerThirdSubtitle2.Text = Subtitles[2]

    if Subtitles[2] ~= nil then LoopBetweenSubtitles() end

    --Move clear part up and heighen it
    Anim.to(LowerThirdFull.ClearPart, 1, {y = 940-120, h = 170}):ease("cubicinout")
    --And its scissor
    Anim.to(LowerThirdFull.ClearPartScissor, 1, {y = 940-185, h = 235}):ease("cubicinout")

    --Move vbn box up
    Anim.to(LowerThirdFull.vbnBox, 1, {y = 940-120}):ease("cubicinout")

    --Move vbn text up
    Anim.to(LowerThirdFull.vbnText, 1, {y = 934-120}):ease("cubicinout")



    --Move the title up
    Anim.to(LowerThirdFull.LowerThirdTitle, 1, {y = 940-80}):ease("cubicinout"):delay(0.02)

    --Move the subtitle 1 up
    Anim.to(LowerThirdFull.LowerThirdSubtitle1, 1, {y = 980-50}):ease("cubicinout"):delay(0.04)

    --Move the subtitle 2 up
    Anim.to(LowerThirdFull.LowerThirdSubtitle2, 1, {y = 980}):ease("cubicinout"):delay(0.06)

end


function LoopBetweenSubtitles()

    if LowerThirdFull.OnSubtitle == 1 then 
        OnSub1Timer = Timer.after(7, function()
            --Move subtitle 1 up
            Anim.to(LowerThirdFull.LowerThirdSubtitle1, 1, {y = 930-55}):ease("cubicinout")

            --Move subtitle 2 up
            Anim.to(LowerThirdFull.LowerThirdSubtitle2, 1, {y = 960-30}):ease("cubicinout")

            LowerThirdFull.OnSubtitle = 2
            OnSub1EndTimer = Timer.after(1, function() 
                --Move subtitle 1 to the bottom
                LowerThirdFull.LowerThirdSubtitle1.y = 980+20
                LoopBetweenSubtitles() 
            end)
        end)
    end

    if LowerThirdFull.OnSubtitle == 2 then 
        OnSub2Timer = Timer.after(7, function()
            --Move subtitle 1 down
            Anim.to(LowerThirdFull.LowerThirdSubtitle1, 1, {y = 980-50}):ease("cubicinout")

            --Move subtitle 2 up
            Anim.to(LowerThirdFull.LowerThirdSubtitle2, 1, {y = 980-105}):ease("cubicinout")

            LowerThirdFull.OnSubtitle = 1
            OnSub2TimerEnd = Timer.after(1, function() 
                --Move subtitle 2 to the bottom
                LowerThirdFull.LowerThirdSubtitle2.y = 980+20
                LoopBetweenSubtitles() 
            end)
        end)
    end
end


function HideLowerThirdText()



    LowerThirdFull.LowerThirdTitleShowing = false

    if OnSub1Timer ~= nil then Timer.cancel(OnSub1Timer) end
    if OnSub2Timer ~= nil then Timer.cancel(OnSub2Timer) end
    if OnSub1EndTimer ~= nil then Timer.cancel(OnSub1EndTimer) end
    if OnSub2TimerEnd ~= nil then Timer.cancel(OnSub2TimerEnd) end

    LowerThirdFull.OnSubtitle = 1


    --Move clear part down and shrink it
    Anim.to(LowerThirdFull.ClearPart, 0.8, {y = 940, h = 50}):ease("cubicinout")
    --And its scissor
    Anim.to(LowerThirdFull.ClearPartScissor, 0.8, {y = 940, h = 50}):ease("cubicinout")

    --Move vbn box down
    Anim.to(LowerThirdFull.vbnBox, 0.8, {y = 940}):ease("cubicinout")

    --Move vbn text down
    Anim.to(LowerThirdFull.vbnText, 0.8, {y = 934}):ease("cubicinout")

    --Move the title down
    Anim.to(LowerThirdFull.LowerThirdTitle, 0.8, {y = 980}):ease("cubicinout")

    --Move the subtitle 1 down
    Anim.to(LowerThirdFull.LowerThirdSubtitle1, 0.8, {y = 1060}):ease("cubicinout")

    --Move the subtitle 2 down
    Anim.to(LowerThirdFull.LowerThirdSubtitle2, 0.8, {y = 1110}):ease("cubicinout")

    Timer.after(0.8, function() 
        LowerThirdFull.LowerThirdTitle.Text = ""
    end)
    
end

function ShowProgramBadge(text, tcolor, bcolor) 
    LowerThirdFull.ProgramBadgeShowing = true
    LowerThirdFull.ProgramBadge.Text = text
    LowerThirdFull.ProgramBadge.tcol = tcolor
    LowerThirdFull.ProgramBadge.bcol = bcolor

    --Program badge X must be aligned to the right of the screen 100px from the edge
    TextWidth = LowerThirdFull.ProgramBadge.Font:getWidth(LowerThirdFull.ProgramBadge.Text)
    LowerThirdFull.ProgramBadge.w = TextWidth + 20
    LowerThirdFull.ProgramBadge.x = 1920-295 - TextWidth

    --Move program badge to the bottom
    LowerThirdFull.ProgramBadge.y = 940+48

    --Move program badge up
    Anim.to(LowerThirdFull.ProgramBadge, 0.5, {y = 940}):ease("cubicout")
end

function HideProgramBadge()
    LowerThirdFull.ProgramBadgeShowing = false
    
    Anim.to(LowerThirdFull.ProgramBadge, 0.5, {y = 892}):ease("cubicin")
end