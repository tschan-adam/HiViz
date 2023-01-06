TitleLogo = {
    image = love.graphics.newImage("vbnbox.png"),
    c = {1,1,1,0},
    Showing = false,
}


function DrawTitleLogo()
    love.graphics.setColor(TitleLogo.c)
    love.graphics.draw(TitleLogo.image, 287, 780, 0, 0.77,0.77)
end


function ShowTitleLogo()
    if HeadlineShowing then
        if Single then HideHeadlineSingle() else HideHeadlineDouble() end
        Timer.after(1, function() ShowTitleLogo() end)
    elseif LowerThirdFull.LowerThirdShowing then
        HideLowerThirdFull()
        Timer.after(1, function() ShowTitleLogo() end)
    else
        Anim.to(TitleLogo.c, 0.3, {1,1,1,1})
        TitleLogo.Showing = true
    end
end

function HideTitleLogo()
    Anim.to(TitleLogo.c, 0.8, {1,1,1,0})
    TitleLogo.Showing = false
end

function ShowTitleLogoInstant()
    TitleLogo.c = {1,1,1,1}
    TitleLogo.Showing = true
end