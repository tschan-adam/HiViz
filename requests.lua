

server:on("connect", function(data)
    print("PurpleViz Connected")  
end)

server:on("headline", function(data)
    if data.Type == "Show-Headline" then
        PlayoutShowHeadline(data.Text)
        KeepBottomText = data.Text
    end

    if data.Type == "Next-Headline" then
        
        PlayoutNextHeadline(data.Text)
        KeepBottomText = data.Text
    end

    if data.Type == "Hide-Headline" then 
        if Single then HideHeadlineSingle() else HideHeadlineDouble() end
    end

    if data.Type == "Show-Headline-KeepText" then
        if Single then PlayoutShowHeadlineSingle(KeepBottomText) else PlayoutShowHeadlineDouble(KeepBottomText, KeepTopText) end
    end


    if data.Type == "Show-TitleLogo" then
        ShowTitleLogo()
    end

    if data.Type == "Hide-TitleLogo" then
        HideTitleLogo()
    end

    if data.Type == "Show-TitleLogoInstant" then
        ShowTitleLogoInstant()
    end

    if data.Type == "ShowLowerThird" then
        ShowLowerThirdFull()
    end

    if data.Type == "HideLowerThird" then
        HideLowerThirdFull()
    end

    if data.Type == "Show-PlaceName" then
        ShowPlaceName(data.Text)
    end

    if data.Type == "Hide-PlaceName" then
        HidePlaceName()
    end

    if data.Type == "Show-PresenterName" then
        LowerThirdFull.PresenterName.Text = data.Text
        ShowPresenterName()
    end

    if data.Type == "Hide-PresenterName" then
        HidePresenterName()
    end

    if data.Type == "Show-BreakfastIntroClock" then
        ShowBreakfastIntroClock()
    end

    if data.Type == "Hide-BreakfastIntroClock" then
        HideBreakfastIntroClock()
    end

    if data.Type == "Flash" then
        Flash()
    end

    if data.Type == "Wipe" then
        ShowTransition()
    end

    






    if data.Type == "ToggleL3" then
        if LowerThirdFull.LowerThirdShowing == true then
            HideLowerThirdFull()
        else
            ShowLowerThirdFull()
        end
    end

    if data.Type == "KillTicker" then
        KillTicker()
    end

    if data.Type == "ResumeTicker" then
        ResumeTicker()
    end
end)

