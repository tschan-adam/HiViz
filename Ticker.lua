local TTimer = require "timer"

TickerSequence = 
{
    {mode = "Head", text = "gcpsk12.org/NorthGwinnettMS", duration = 3},
    {mode = "BreakingHead", text = "BREAKING", duration = 3},
    {mode = "Breaking", text = "Fire drill set for 2:30pm this afternoon.", duration = 5},
    {mode = "Head", text = "HEADLINES", duration = 2},
    {mode = "Normal", text = "GSMST application is almost closed", duration = 5},
    {mode = "Normal", text = "See requirements and apply to GSMST on the website.", duration = 5},
    {mode = "Normal", text = "We'd like to hear your thoughts on our new graphics!", duration = 5},
    {mode = "Normal", text = "Provide feedback on the new graphics at example.com/GraphicsForm", duration = 5},
    {mode = 'BlueHead', text = "DAILY BALLOT", duration = 3},
    {mode = 'Normal', text = "Today's Daily Ballot winners: John A., Mary J., and Billy B.", duration = 7},
    {mode = "Normal", text = "Today's Daily Ballot question: Can pigs fly?", duration = 5},
    {mode = "Normal", text = "Vote in the Daily Ballot on the Media Center eClass page.", duration = 5},
}
TickerI = 0
TickerRunning = false

function ShowTickerText(text)
    --Set the text
    LowerThirdFull.TickerText.Text = text

    LowerThirdFull.TickerBlock.y = 1005 + 40
    LowerThirdFull.TickerText.y = 986 + 40

    LowerThirdFull.TickerBlock.col = {ThemeColor[1],ThemeColor[2],ThemeColor[3],0}
    LowerThirdFull.TickerText.col = {0.2,0.2,0.2,0}


    --Move the ticker block up
    Anim.to(LowerThirdFull.TickerBlock, 0.8, {y = 1005}):ease("cubicout")

    --Move the ticker text up
    Anim.to(LowerThirdFull.TickerText, 0.8, {y = 986}):ease("cubicout")

    --Fade in the ticker text
    TTimer.tween(0.5, LowerThirdFull.TickerText, {col = {0.2,0.2,0.2,1}})

    --Fade in the ticker block
    TTimer.tween(0.5, LowerThirdFull.TickerBlock, {col = {ThemeColor[1],ThemeColor[2],ThemeColor[3],1}})
end

function ShowTickerTextBreaking(text)
    --Set the text
    LowerThirdFull.TickerText.Text = text

    LowerThirdFull.TickerBlock.y = 1005 + 40
    LowerThirdFull.TickerText.y = 986 + 40

    LowerThirdFull.TickerBlock.col = {ThemeColor[1],ThemeColor[2],ThemeColor[3],0}
    LowerThirdFull.TickerText.col = {0.2,0.2,0.2,0}


    --Move the ticker block up
    Anim.to(LowerThirdFull.TickerBlock, 0.8, {y = 1005}):ease("cubicout")

    --Move the ticker text up
    Anim.to(LowerThirdFull.TickerText, 0.8, {y = 986}):ease("cubicout")

    --Fade in the ticker text
    TTimer.tween(0.5, LowerThirdFull.TickerText, {col = {0.7,0,0,1}})

    --Fade in the ticker block
    TTimer.tween(0.5, LowerThirdFull.TickerBlock, {col = {0.7,0,0,1}})
end

function ShowTickerTextBlue(text)
    --Set the text
    LowerThirdFull.TickerText.Text = text

    LowerThirdFull.TickerBlock.y = 1005 + 40
    LowerThirdFull.TickerText.y = 986 + 40

    LowerThirdFull.TickerBlock.col = {27/255, 78/255, 94/255,0}
    LowerThirdFull.TickerText.col = {0.2,0.2,0.2,0}


    --Move the ticker block up
    Anim.to(LowerThirdFull.TickerBlock, 0.8, {y = 1005}):ease("cubicout")

    --Move the ticker text up
    Anim.to(LowerThirdFull.TickerText, 0.8, {y = 986}):ease("cubicout")

    --Fade in the ticker text
    TTimer.tween(0.5, LowerThirdFull.TickerText, {col = {0.2,0.2,0.2,1}})

    --Fade in the ticker block
    TTimer.tween(0.5, LowerThirdFull.TickerBlock, {col = {27/255, 78/255, 94/255,1}})
end

function RollTickerTextOut()
    LowerThirdFull.TickerScissor = true

    --Move the ticker block up
    Anim.to(LowerThirdFull.TickerBlock, 0.5, {y = 970}):ease("cubicin")

    --Move the ticker text up
    Anim.to(LowerThirdFull.TickerText, 0.5, {y = 940}):ease("cubicin")

    TTimer.after(0.7, function()
        StartTicker()
    end)
end

function RollTickerTextIn(text)
    LowerThirdFull.TickerScissor = true

    LowerThirdFull.TickerText.Text = text

    LowerThirdFull.TickerBlock.y = 1005 + 40
    LowerThirdFull.TickerText.y = 986 + 40

    --Move the ticker block up
    Anim.to(LowerThirdFull.TickerBlock, 0.5, {y = 1005}):ease("cubicout")

    --Move the ticker text up
    Anim.to(LowerThirdFull.TickerText, 0.5, {y = 986}):ease("cubicout")

    TTimer.after(TickerSequence[TickerI].duration, function()
        RollTickerTextOut()
    end)

end


function StartTicker()
    TickerRunning = true
    TickerI = TickerI + 1
    if TickerI > #TickerSequence then
        StopTicker()
        TickerI = 1
        TTimer.after(0.5, function()
            StartTicker()
        end)
        return
    end

    if TickerSequence[TickerI].mode == "Head" then
        --Set tickerblock to normal color
        LowerThirdFull.TickerBlock.col = {ThemeColor[1],ThemeColor[2],ThemeColor[3],1}


        LowerThirdFull.TickerScissor = false
        --Show the ticker text
        ShowTickerText(TickerSequence[TickerI].text)

        --Wait the duration
        TTimer.after(TickerSequence[TickerI].duration, function()
            RollTickerTextOut()
        end)

    elseif TickerSequence[TickerI].mode == "BlueHead" then
        LowerThirdFull.TickerScissor = false
        --Show the ticker text
        ShowTickerTextBlue(TickerSequence[TickerI].text)

        --Wait the duration
        TTimer.after(TickerSequence[TickerI].duration, function()
            RollTickerTextOut()
        end)
    elseif TickerSequence[TickerI].mode == "Normal" then
        RollTickerTextIn(TickerSequence[TickerI].text)
    elseif TickerSequence[TickerI].mode == "BreakingHead" then
        LowerThirdFull.TickerScissor = false
        TTimer.clear()
        ShowTickerTextBreaking("BREAKING")
        FlashTickerText()
        TTimer.after(TickerSequence[TickerI].duration, function()
            RollTickerTextOut()
        end)
    elseif TickerSequence[TickerI].mode == "Breaking" then
        LowerThirdFull.TickerScissor = true
        RollTickerTextIn(TickerSequence[TickerI].text)
        FlashTickerBlock()
    end
end 

function KillTicker()
    if TickerRunning == false then return end

    StopTicker()
    Timer.after(0.5, function()
            --Set tickerblock to normal color
            LowerThirdFull.TickerBlock.col = {ThemeColor[1],ThemeColor[2],ThemeColor[3],1}
    
    
            LowerThirdFull.TickerScissor = false
            --Show the ticker text
            ShowTickerText("vbn.com/news")
    

    end)
end

function ResumeTicker()
    if TickerRunning == true then return end
    if LowerThirdFull.LowerThirdShowing == false then return end

    Timer.after(1, function()
        StartTicker()
    end)
end

function StopTicker()
    LowerThirdFull.TickerScissor = true
    TTimer.clear()
    TickerRunning = false

    --Fade out the ticker text
    TTimer.tween(0.3, LowerThirdFull.TickerText, {col = {0.2,0.2,0.2,0}})
    --Fade out the ticker block
    TTimer.tween(0.3, LowerThirdFull.TickerBlock, {col = {ThemeColor[1],ThemeColor[2],ThemeColor[3],0}})
end

function FlashTickerBlock()
    TTimer.after(0.6, function()
        TTimer.tween(0.2, LowerThirdFull.TickerBlock, {col = {0.7,0,0,0}})
    end)
    TTimer.after(0.9, function()
        TTimer.tween(0.2, LowerThirdFull.TickerBlock, {col = {0.7,0,0,1}})
    end)
    TTimer.after(1.2, function()
        TTimer.tween(0.2, LowerThirdFull.TickerBlock, {col = {0.7,0,0,0}})
    end)
    TTimer.after(1.5, function()
        TTimer.tween(0.2, LowerThirdFull.TickerBlock, {col = {0.7,0,0,1}})
    end)
    TTimer.after(1.8, function()
        TTimer.tween(0.2, LowerThirdFull.TickerBlock, {col = {0.7,0,0,0}})
    end)
    TTimer.after(2.1, function()
        TTimer.tween(0.2, LowerThirdFull.TickerBlock, {col = {0.7,0,0,1}})
    end)
end

function FlashTickerText()
    TTimer.after(0.6, function()
        TTimer.tween(0.2, LowerThirdFull.TickerText, {col = {0.7,0,0,0}})
    end)
    TTimer.after(0.9, function()
        TTimer.tween(0.2, LowerThirdFull.TickerText, {col = {0.7,0,0,1}})
    end)
    TTimer.after(1.2, function()
        TTimer.tween(0.2, LowerThirdFull.TickerText, {col = {0.7,0,0,0}})
    end)
    TTimer.after(1.5, function()
        TTimer.tween(0.2, LowerThirdFull.TickerText, {col = {0.7,0,0,1}})
    end)
    TTimer.after(1.8, function()
        TTimer.tween(0.2, LowerThirdFull.TickerText, {col = {0.7,0,0,0}})
    end)
    TTimer.after(2.1, function()
        TTimer.tween(0.2, LowerThirdFull.TickerText, {col = {0.7,0,0,1}})
    end)
end