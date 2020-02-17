'PROJECT: DICE ROLLER VERSION 2.0
'AUTHOT: MARK A DUNHAM
'DATE: 8.21.2018

    nomainwin

    WindowWidth = 640
    WindowHeight = 480
    UpperLeftX = int((DisplayWidth - WindowWidth)/2)
    UpperLeftY = int((DisplayHeight - WindowHeight)/2)
    BackgroundColor$ = "darkgreen"

    global version$,D4Count,D4Total,D6Count,D6Total,D8Count,D8Total,D10Count,D10Total
    global D12Count,D12Total,D20Count,D20Total,D100Count,D100Total
    version$ = "2.0.0.0"
    D4Count = 1 : D4Total = 0
    D6Count = 1 : D6Total = 0
    D8Count = 1 : D8Total = 0
    D10Count = 1 : D10Total = 0
    D12Count = 1 : D12Total = 0
    D20Count = 1 : D20Total = 0
    D100Count = 1 : D100Total = 0

    menu #DR, "File","Exit",[DR.Quit]
    menu #DR, "Edit"
    menu #DR, "Help","About",[DR.About]

    statictext #DR.st1, "Dice Type", 25, 10, 75, 25
    statictext #DR.st2, "No. of Dice", 125, 10, 90, 25
    statictext #DR.st3, "Modifier +/-", 250, 10, 100, 25
    statictext #DR.st4, "Result", 515, 10, 50, 25

'FOUR SIDED DICE
    statictext #DR.std41, "D4", 45,40,25,25
    textbox #DR.tbD4, 140,40,40,25
    bmpbutton #DR.btnD4up, "Images\Up.bmp", [D4up], UL,185,45
    bmpbutton #DR.brnD4dn, "Images\Down.bmp", [D4dn], UL,202,45
    textbox #DR.tbD4Mod, 250,40,25,25
    checkbox #DR.cbD4pos, "+ /", [D4PosSet], [D4ModReset], 290,40,40,25
    checkbox #DR.cbD4neg, "-", [D4NegSet], [D4ModReset], 335,40,30,25
    button #DR.btnRollD4, "Roll", [Roll.D4], UL,385,40,75,25
    textbox #DR.tbD4Result, 500,40,75,25
'SIX SIDED DICE
    statictext #DR.std61, "D6", 45,70,25,25
    textbox #DR.tbD6, 140,70,40,25
    bmpbutton #DR.btnD6up, "Images\Up.bmp", [D6up], UL,185,75
    bmpbutton #DR.brnD6dn, "Images\Down.bmp", [D6dn], UL,202,75
    textbox #DR.tbD6Mod, 250,70,25,25
    checkbox #DR.cbD6pos, "+ /", [D6PosSet], [D6ModReset], 290,70,40,25
    checkbox #DR.cbD6neg, "-", [D6NegSet], [D6ModReset], 335,70,30,25
    button #DR.btnRollD6, "Roll", [Roll.D6], UL,385,70,75,25
    textbox #DR.tbD6Result, 500,70,75,25
'EIGHT SIDED DICE
    statictext #DR.std81, "D8", 45,100,25,25
    textbox #DR.tbD8, 140,100,40,25
    bmpbutton #DR.btnD8up, "Images\Up.bmp", [D8up], UL,185,105
    bmpbutton #DR.brnD8dn, "Images\Down.bmp", [D8dn], UL,202,105
    textbox #DR.tbD8Mod, 250,100,25,25
    checkbox #DR.cbD8pos, "+ /", [D8PosSet], [D8ModReset], 290,100,40,25
    checkbox #DR.cbD8neg, "-", [D8NegSet], [D8ModReset], 335,100,30,25
    button #DR.btnRollD8, "Roll", [Roll.D8], UL,385,100,75,25
    textbox #DR.tbD8Result, 500,100,75,25
'TEN SIDED DICE
    statictext #DR.std101, "D10", 45,130,30,25
    textbox #DR.tbD10, 140,130,40,25
    bmpbutton #DR.btnD10up, "Images\Up.bmp", [D10up], UL,185,135
    bmpbutton #DR.brnD10dn, "Images\Down.bmp", [D10dn], UL,202,135
    textbox #DR.tbD10Mod, 250,130,25,25
    checkbox #DR.cbD10pos, "+ /", [D10PosSet], [D10ModReset], 290,130,40,25
    checkbox #DR.cbD10neg, "-", [D10NegSet], [D10ModReset], 335,130,30,25
    button #DR.btnRollD10, "Roll", [Roll.D10], UL,385,130,75,25
    textbox #DR.tbD10Result, 500,130,75,25
'TWELVE SIDED DICE
    statictext #DR.std121, "D12", 45,160,30,25
    textbox #DR.tbD12, 140,160,40,25
    bmpbutton #DR.btnD12up, "Images\Up.bmp", [D12up], UL,185,165
    bmpbutton #DR.brnD12dn, "Images\Down.bmp", [D12dn], UL,202,165
    textbox #DR.tbD12Mod, 250,160,25,25
    checkbox #DR.cbD12pos, "+ /", [D12PosSet], [D12ModReset], 290,160,40,25
    checkbox #DR.cbD12neg, "-", [D12NegSet], [D12ModReset], 335,160,30,25
    button #DR.btnRollD12, "Roll", [Roll.D12], UL,385,160,75,25
    textbox #DR.tbD12Result, 500,160,75,25
'TWENTY SIDED DICE
    statictext #DR.std201, "D20", 45,190,30,25
    textbox #DR.tbD20, 140,190,40,25
    bmpbutton #DR.btnD20up, "Images\Up.bmp", [D20up], UL,185,195
    bmpbutton #DR.brnD20dn, "Images\Down.bmp", [D20dn], UL,202,195
    textbox #DR.tbD20Mod, 250,190,25,25
    checkbox #DR.cbD20pos, "+ /", [D20PosSet], [D20ModReset], 290,190,40,25
    checkbox #DR.cbD20neg, "-", [D20NegSet], [D20ModReset], 335,190,30,25
    button #DR.btnRollD20, "Roll", [Roll.D20], UL,385,190,75,25
    textbox #DR.tbD20Result, 500,190,75,25
'HUNDRED SIDED DICE
    statictext #DR.std1001, "D100", 45,220,40,25
    textbox #DR.tbD100, 140,220,40,25
    bmpbutton #DR.btnD100up, "Images\Up.bmp", [D100up], UL,185,225
    bmpbutton #DR.brnD100dn, "Images\Down.bmp", [D100dn], UL,202,225
    textbox #DR.tbD100Mod, 250,220,25,25
    checkbox #DR.cbD100pos, "+ /", [D100PosSet], [D100ModReset], 290,220,40,25
    checkbox #DR.cbD100neg, "-", [D100NegSet], [D100ModReset], 335,220,30,25
    button #DR.btnRollD100, "Roll", [Roll.D100], UL,385,220,75,25
    textbox #DR.tbD100Result, 500,220,75,25

'TEXTEDITOR OUTPUT ELEMENTS
    texteditor #DR.teditOut, 46,260,530,100
    stylebits #DR.teditOut, 0,_WS_HSCROLL,0,0

    'OPEN THE MAIN WINDOW
    open "Dice Roller " + version$ for window_nf as #DR
    #DR, "trapclose [DR.Quit]"
    #DR, "font georgia 10 point bold"
    #DR.teditOut, "!disable"
    #DR.tbD4, "!disable"
    #DR.tbD4Result, "!disable"
    #DR.tbD6, "!disable"
    #DR.tbD6Result, "!disable"
    #DR.tbD8, "!disable"
    #DR.tbD8Result, "!disable"
    #DR.tbD10, "!disable"
    #DR.tbD10Result, "!disable"
    #DR.tbD12, "!disable"
    #DR.tbD12Result, "!disable"
    #DR.tbD20, "!disable"
    #DR.tbD20Result, "!disable"
    #DR.tbD100, "!disable"
    #DR.tbD100Result, "!disable"

    #DR.tbD4, D4Count
    #DR.tbD6, D6Count
    #DR.tbD8, D8Count
    #DR.tbD10, D10Count
    #DR.tbD12, D12Count
    #DR.tbD20, D20Count
    #DR.tbD100, D100Count

    hMain=hWnd(#DR)
    hMainMenu=GetMenu(hMain)
    hMainEdit=GetSubMenu(hMainMenu,1)
    result=RemoveMenu(hMainMenu,hMainEdit)
    Call DrawMenuBar hWnd(#DR)

    wait

'ALL HANDLERS FOR D4 DICE ROLLS
[D4up]
    if D4Count < 20 then D4Count = D4Count + 1
    #DR.tbD4, D4Count
    wait

[D4dn]
    if D4Count > 1 then D4Count = D4Count - 1
    #DR.tbD4, D4Count
    wait

[D4PosSet]
    #DR.cbD4neg, "reset"
    wait

[D4NegSet]
    #DR.cbD4pos, "reset"
    wait

[D4ModReset]
    #DR.tbD4Mod, " "
    wait

[Roll.D4]
    D4Total = 0
    #DR.teditOut, "!cls"
    #DR.cbD4pos, "value? pResult$"
    #DR.cbD4neg, "value? nResult$"

    'CALL FUNCTION TO ROLL DICE
    D4Total = RollDice(4,D4Count,pResult$,nResult$)

    #DR.tbD4Result, D4Total
    wait

'ALL HANDLERS FOR D6 DICE ROLLS
[D6up]
    if D6Count < 20 then D6Count = D6Count + 1
    #DR.tbD6, D6Count
    wait

[D6dn]
    if D6Count > 1 then D6Count = D6Count - 1
    #DR.tbD6, D6Count
    wait

[D6PosSet]
    #DR.cbD6neg, "reset"
    wait

[D6NegSet]
    #DR.cbD6pos, "reset"
    wait

[D6ModReset]
    #DR.tbD6Mod, " "
    wait

[Roll.D6]
    D6Total = 0
    #DR.teditOut, "!cls"
    #DR.cbD6pos, "value? pResult$"
    #DR.cbD6neg, "value? nResult$"

    'CALL FUNCTION TO ROLL DICE
    D6Total = RollDice(6,D6Count,pResult$,nResult$)

    #DR.tbD6Result, D6Total
    wait

'ALL HANDLERS FOR D8 DICE ROLLS
[D8up]
    if D8Count < 20 then D8Count = D8Count + 1
    #DR.tbD8, D8Count
    wait

[D8dn]
    if D8Count > 1 then D8Count = D8Count - 1
    #DR.tbD8, D8Count
    wait

[D8PosSet]
    #DR.cbD8neg, "reset"
    wait

[D8NegSet]
    #DR.cbD8pos, "reset"
    wait

[D8ModReset]
    #DR.tbD8Mod, " "
    wait

[Roll.D8]
    D8Total = 0
    #DR.teditOut, "!cls"
    #DR.cbD8pos, "value? pResult$"
    #DR.cbD8neg, "value? nResult$"

    'CALL FUNCTION TO ROLL DICE
    D8Total = RollDice(8,D8Count,pResult$,nResult$)

    #DR.tbD8Result, D8Total
    wait

'ALL HANDLERS FOR D10 DICE ROLLS
[D10up]
    if D10Count < 20 then D10Count = D10Count + 1
    #DR.tbD10, D10Count
    wait

[D10dn]
    if D10Count > 1 then D10Count = D10Count - 1
    #DR.tbD10, D10Count
    wait

[D10PosSet]
    #DR.cbD10neg, "reset"
    wait

[D10NegSet]
    #DR.cbD10pos, "reset"
    wait

[D10ModReset]
    #DR.tbD10Mod, " "
    wait

[Roll.D10]
    D10Total = 0
    #DR.teditOut, "!cls"
    #DR.cbD10pos, "value? pResult$"
    #DR.cbD10neg, "value? nResult$"

    'CALL FUNCTION TO ROLL DICE
    D10Total = RollDice(10,D10Count,pResult$,nResult$)

    #DR.tbD10Result, D10Total
    wait

'ALL HANDLERS FOR D12 DICE ROLLS
[D12up]
    if D12Count < 20 then D12Count = D12Count + 1
    #DR.tbD12, D12Count
    wait

[D12dn]
    if D12Count > 1 then D12Count = D12Count - 1
    #DR.tbD12, D12Count
    wait

[D12PosSet]
    #DR.cbD12neg, "reset"
    wait

[D12NegSet]
    #DR.cbD12pos, "reset"
    wait

[D12ModReset]
    #DR.tbD12Mod, " "
    wait

[Roll.D12]
    D12Total = 0
    #DR.teditOut, "!cls"
    #DR.cbD12pos, "value? pResult$"
    #DR.cbD12neg, "value? nResult$"

    'CALL FUNCTION TO ROLL DICE
    D12Total = RollDice(12,D12Count,pResult$,nResult$)

    #DR.tbD12Result, D12Total
    wait

'ALL HANDLERS FOR D20 DICE ROLLS
[D20up]
    if D20Count < 20 then D20Count = D20Count + 1
    #DR.tbD20, D20Count
    wait

[D20dn]
    if D20Count > 1 then D20Count = D20Count - 1
    #DR.tbD20, D20Count
    wait

[D20PosSet]
    #DR.cbD20neg, "reset"
    wait

[D20NegSet]
    #DR.cbD20pos, "reset"
    wait

[D20ModReset]
    #DR.tbD20Mod, " "
    wait

[Roll.D20]
    D20Total = 0
    #DR.teditOut, "!cls"
    #DR.cbD20pos, "value? pResult$"
    #DR.cbD20neg, "value? nResult$"

    'CALL FUNCTION TO ROLL DICE
    D20Total = RollDice(20,D20Count,pResult$,nResult$)

    #DR.tbD20Result, D20Total
    wait

'ALL HANDLERS FOR D100 DICE ROLLS
[D100up]
    if D100Count < 20 then D100Count = D100Count + 1
    #DR.tbD100, D100Count
    wait

[D100dn]
    if D100Count > 1 then D100Count = D100Count - 1
    #DR.tbD100, D100Count
    wait

[D100PosSet]
    #DR.cbD100neg, "reset"
    wait

[D100NegSet]
    #DR.cbD100pos, "reset"
    wait

[D100ModReset]
    #DR.tbD100Mod, " "
    wait

[Roll.D100]
    D100Total = 0
    #DR.teditOut, "!cls"
    #DR.cbD100pos, "value? pResult$"
    #DR.cbD100neg, "value? nResult$"

    'CALL FUNCTION TO ROLL DICE
    D100Total = RollDice(100,D100Count,pResult$,nResult$)

    #DR.tbD100Result, D100Total
    wait

[DR.About]
    url$ = "https://sites.google.com/view/tarennovastudiosdiceroller2"
    run "rundll32.exe url.dll,FileProtocolHandler ";url$
    wait

'END PROGRAM AND CLOSE HANDLE
[DR.Quit]
    close #DR
    end

'FUNCTIONS AND SUBROUTINES

'ROLL DICE AND OUTPUT RESULTS
function RollDice(die,dieCount,pResult$,nResult$)
    dim Rolls(dieCount)
    temp = 0

    'CHECK WHAT SIDE DIE IS ROLLED AND IF POSITVE OR NEGATIVE
    'SET THE MODIFIER AND ASSIGN IT TO TEMP
    select case die
        case 4
            if pResult$ = "set" then
                #DR.tbD4Mod, "!contents? rMod"
                temp = temp + rMod
            end if

            if nResult$ = "set" then
                #DR.tbD4Mod, "!contents? rMod"
                temp = temp - rMod
            end if
        case 6
            if pResult$ = "set" then
                #DR.tbD6Mod, "!contents? rMod"
                temp = temp + rMod
            end if

            if nResult$ = "set" then
                #DR.tbD6Mod, "!contents? rMod"
                temp = temp - rMod
            end if
        case 8
            if pResult$ = "set" then
                #DR.tbD8Mod, "!contents? rMod"
                temp = temp + rMod
            end if

            if nResult$ = "set" then
                #DR.tbD8Mod, "!contents? rMod"
                temp = temp - rMod
            end if
        case 10
            if pResult$ = "set" then
                #DR.tbD10Mod, "!contents? rMod"
                temp = temp + rMod
            end if

            if nResult$ = "set" then
                #DR.tbD10Mod, "!contents? rMod"
                temp = temp - rMod
            end if
        case 12
            if pResult$ = "set" then
                #DR.tbD12Mod, "!contents? rMod"
                temp = temp + rMod
            end if

            if nResult$ = "set" then
                #DR.tbD12Mod, "!contents? rMod"
                temp = temp - rMod
            end if
        case 20
            if pResult$ = "set" then
                #DR.tbD20Mod, "!contents? rMod"
                temp = temp + rMod
            end if

            if nResult$ = "set" then
                #DR.tbD20Mod, "!contents? rMod"
                temp = temp - rMod
            end if
        case 100
            if pResult$ = "set" then
                #DR.tbD100Mod, "!contents? rMod"
                temp = temp + rMod
            end if

            if nResult$ = "set" then
                #DR.tbD100Mod, "!contents? rMod"
                temp = temp - rMod
            end if
    end select

    'GENERATE ROLLS AND POPULATE THE ROLLS ARRAY
    for i = 1 to dieCount
        if i <= dieCount then
            roll = int(rnd(1) * die) + 1
            temp = temp + roll
            Rolls(i) = roll
        end if
    next i

    'FORMAT OUTPUT FOR POSITIVE NEGATIVE OR NONE
    if pResult$ = "set" then
        #DR.teditOut, "You have Rolled (" + str$(dieCount) + "d" + str$(die)+ " + " + str$(rMod)+ "):  " + str$(temp)
    else
        if nResult$ = "set" then
            #DR.teditOut, "You have Rolled (" + str$(dieCount) + "d" + str$(die)+ " - " + str$(rMod)+ "):  " + str$(temp)
    else
        if pResult$ = "reset" and nResult$ = "reset" then
            #DR.teditOut, "You have Rolled (" + str$(dieCount) + "d" + str$(die)+ "):  " + str$(temp)
        end if
        end if
    end if

    'CHECK WHAT DIE WAS ROLLED AND PRINT THE DIE ROLLS TO THE TEXTEDITOR WINDOW
    #DR.teditOut, "Rolled: ";

    for i = 1 to dieCount
        #DR.teditOut, str$(Rolls(i)) + "  ";
    next i

    RollDice = temp
end function


'FUNCTIONS TO REMOVE EDIT ON THE MENU BAR
Sub DrawMenuBar hWnd
    CallDLL #user32, "DrawMenuBar",_
    hWnd As ulong, r As boolean
    End Sub

Function GetSubMenu(hMenuBar,nPos)
    CallDLL #user32, "GetSubMenu",_
    hMenuBar As ulong, nPos As long,_
    GetSubMenu As ulong
    End Function

Function GetMenu(hWnd)
    CallDLL #user32, "GetMenu",hWnd As ulong,_
    GetMenu As ulong
    End Function

Function RemoveMenu(hMenu,hSubMenu)
    CallDLL #user32, "RemoveMenu", hMenu As ulong,_
    hSubMenu As ulong, _MF_BYCOMMAND As ulong,_
    RemoveMenu As boolean
    End Function
