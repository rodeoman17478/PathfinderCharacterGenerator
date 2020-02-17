    'TITLE: PF Character Gen
    'TARENNOVASTUDIOS
    'DATE: 1.29.2018
    'AUTHOR: MARK A. DUNHAM

'TODO:ADD DIETIES TO DIETY.DAT                              :: COMPLETED 9.13.2018
'TODO:ADD CLERIC ALIGNMENT FILTERING BY DEITY               :: COMPLETED 5.7.2019
'TODO:ADD DEITY TIP .DAT FILES                              :: COMPLETED 5.7.2019
'TODO:ADD ATTRIBUTES                                        :: COMPLETED 5.8.2019
'TODO:ADD ABILITIES GENERATION                              :: COMPLETED 6.11.2019
'TODO:LOAD ROLLED ABILITIES WHEN OPENED                     :: COMPLETED 6.11.2019
'TODO:ADD SKILLS
'TODO:ADD EQUIPMENT
'TODO:ADD OPEN/SAVE                                         :: IN PROGRESS
'TODO:ADD LEVEL UP
'TODO:FORMAT SAVE TO .RTF                                   :: IN PROGRESS


    nomainwin
    BackgroundColor$ = "darkgray"
    ForegroundColor$ = "black"
    print DefaultDir$



'##############################################################################################
'#GLOBAL VARIABLES                                                                            #
'##############################################################################################
    global BASEAC, CharacterPortraitCount, CharacterPortraitStepCount, PCP$, MusicPlaying$
    global str, dex, con, int, wis, cha, strMod$, dexMod$, conMod$, intMod$, wisMod$, chaMod$
    global strUp, dexUp, conUp, intUp, wisUp, chaUp, hpTotal,maxLoad, lightLoad$, mediumLoad$, heavyLoad$
    global liftOverHead$, liftOffGround$, pushOrDrag$, touchAC, flatFootedAC, sizeModifier$, xp, spellsPerDay
    global baseAttackBonus$, combatManuverBonus$, combatManuverDefense$, fortitude$, reflex$, will$
    global AC, copper, silver, gold, platinum, skillRanks, feats, bonusLanguages,assign
    global tmpSTR,tmpDEX,tmpCON,tmpINT,tmpWIS,tmpCHA
    BASEAC = 10
    CharacterPortraitCount = 18
    CharacterPortraitStepCount = 0
    PCP$ = ""
    MusicPlaying$ = "FALSE"

'##############################################################################################
'#ALL VARIABLES PERTAINING TO THE CHARACTER                                                   #
'##############################################################################################
    boolAttributesSet$ = "FALSE"
    boolAbilitiesSet$ = "FALSE"

    'ATTRIBUTES
    name$ = ""
    alignment$ = ""
    player$ = ""
    level$ = ""
    deity$ = ""
    homeland$ = ""
    campaign$ = ""
    class$ = ""
    race$ = ""
    size$ = ""
    gender$ = ""
    age$ = ""
    feet$ = ""
    inches$ = ""
    'height = 0
    weight$ = ""
    hair$ = ""
    eyes$ = ""
    scar$ = ""
    piercing$ = ""
    tattoo$ = ""
    personality$ = ""
    backstory$ = ""
    xp = 0
    spellsPerDay = 0
    skillRanks = 0
    feats = 0
    bonusLanguages = 0

    'ABILITY SCORES
    str = 0
    strUp = 0
    strMod$ = "+0"
    strTmpAdj = 0
    strTmpMod = 0
    dex = 0
    dexUp = 0
    dexMod$ = "+0"
    dexTmpAdj = 0
    dexTmpMod = 0
    con = 0
    conUp = 0
    conMod$ = "+0"
    conTmpAdj = 0
    conTmpMod = 0
    int = 0
    intUp = 0
    intMod$ = "+0"
    intTmpAdj = 0
    intTmpMod = 0
    wis = 0
    wisUp = 0
    wisMod$ = "+0"
    wisTmpAdj = 0
    wisTmpMod = 0
    cha = 0
    chaUp = 0
    chaMod$ = "+0"
    chaTmpAdj = 0
    chaTmpMod = 0
    assign = 0

    'HIT POINTS
    hitDie$ = "D0"
    hpTotal = 0
    damageReduction = 0
    'wounds = 0
    'currentHp = 0
    nonlethalDmg = 0

    'INITIATIVE
    'INIT = DEXMOD + INITMISCMOD
    initiativeTotal$ = "+0"
    initiativeMiscMod = 0

    'MOVEMENT SPEED
    speedFt = 0
    speedSq = 0
    speedArmorFt = 0
    speedArmorSq = 0
    flyFt = 0
    flyManuverability = 0
    swimFt = 0
    climbFt = 0
    burrowFt = 0
    speedTmpMod = 0

    'ARMOR CLASS
    'AC = 10 + ARMOR + SHIELD +DEXMOD + SIZE + NATARMOR + DEFMOD + MISCARMORMOD
    AC = BASEAC
    armorBonus = 0
    shieldBonus = 0
    sizeModifier$ = "0"
    naturalArmor = 0
    deflectionMod = 0
    miscArmorMod = 0
    touchAC = 0
    flatFootedAC = 0

    'SAVING THROWS
    'SAVE = BASE + ABILITY + MAGIC + MISC + TEMP
    fortitude$ = "0"
    fortitudeBase$ = "0"
    'fortitudeMagic = 0
    'fortitudeMisc = 0
    'fortitudeTemp = 0
    reflex$ = "0"
    reflexBase$ = "0"
    'reflexMagic = 0
    'reflexMisc = 0
    'reflexTemp = 0
    will$ = "0"
    willBase$ = "0"
    'willMagic = 0
    'willMisc = 0
    'willTemp = 0

    'PC MISC
    'CMB = BAB + STRMOD + SIZEMOD
    'CMD = 10 + BAB + STRMOD + DEXMOD + SIZEMOD
    spellResistance$ = "0"
    baseAttackBonus$ = "0"
    combatManuverBonus$ = "0"
    combatManuverDefense$ = "0"

    'WEIGHTS
    maxLoad = 0
    lightLoad$ = "0 lbs."
    mediumLoad$ = "0 lbs."
    heavyLoad$ = "0 lbs."
    liftOverHead$ = "0 lbs."
    liftOffGround$ = "0 lbs."
    pushOrDrag$ = "0 lbs."

    'CURRENCY
    copper = 0
    silver = 0
    gold = 0
    platinum = 0

    'RACIAL TRAITS TO ADD TO CHARACTER SHEET
    trait1$ = ""
    trait2$ = ""
    trait3$ = ""
    trait4$ = ""

    'WEAPONS
    'MELEE ATTACK BONUS = BAB + STRMOD + SIZEMOD
    'RANGED ATTACK BONUS = BAB + DEXMOD + SIZEMOD + RANGEPENALTY
    weapon1$ = ""
    w1AttackBonus = 0
    w1Critical$ = ""
    w1Type$ = ""
    w1Range$ = ""
    w1Ammunition$ = ""
    w1Damage$ = ""
    weapon2$ = ""
    w2AttackBonus = 0
    w2Critical$ = ""
    w2Type$ = ""
    w2Range$ = ""
    w2Ammunition$ = ""
    w2Damage$ = ""
    weapon3$ = ""
    w3AttackBonus = 0
    w3Critical$ = ""
    w3Type$ = ""
    w3Range$ = ""
    w3Ammunition$ = ""
    w3Damage$ = ""

    'ARMOR
    armorItem1$ = ""
    a1Bonus = 0
    a1Type$ = ""
    a1CheckPenalty = 0
    a1SpellFailure$ = ""
    a1Weight$ = ""
    a1Properties$ = ""
    armorItem2$ = ""
    a2Bonus = 0
    a2Type$ = ""
    a2CheckPenalty = 0
    a2SpellFailure$ = ""
    a2Weight$ = ""
    a2Properties$ = ""
    armorItem3$ = ""
    a3Bonus = 0
    a3Type$ = ""
    a3CheckPenalty = 0
    a3SpellFailure$ = ""
    a3Weight$ = ""
    a3Properties$ = ""

    'SKILLS 39 ON CHARACTER SHEET
    'SKILL1TB = ABILITYMOD + RANKS + MISCMOD

    'boolgenStats$ = "TRUE"

'##############################################################################################
'#COMPILE VARIABLES FOR DROP DOWN BOXES AS A REFERENCE HERE AS WELL FOR OPEN/SAVING           #
'##############################################################################################
    'selectedRace$
    'selectedSex$


'##############################################################################################
'#BEGIN LOAD BITMAPS                                                                          #
'##############################################################################################
    loadbmp "Bg", "Images\TavernBG_1024x768.bmp"
    loadbmp "CP0", "Images\CharacterPortraits\CP000.bmp"
    loadbmp "CP1", "Images\CharacterPortraits\CP001.bmp"
    loadbmp "CP2", "Images\CharacterPortraits\CP002.bmp"
    loadbmp "CP3", "Images\CharacterPortraits\CP003.bmp"
    loadbmp "CP4", "Images\CharacterPortraits\CP004.bmp"
    loadbmp "CP5", "Images\CharacterPortraits\CP005.bmp"
    loadbmp "CP6", "Images\CharacterPortraits\CP006.bmp"
    loadbmp "CP7", "Images\CharacterPortraits\CP007.bmp"
    loadbmp "CP8", "Images\CharacterPortraits\CP008.bmp"
    loadbmp "CP9", "Images\CharacterPortraits\CP009.bmp"
    loadbmp "CP10", "Images\CharacterPortraits\CP010.bmp"
    loadbmp "CP11", "Images\CharacterPortraits\CP011.bmp"
    loadbmp "CP12", "Images\CharacterPortraits\CP012.bmp"
    loadbmp "CP13", "Images\CharacterPortraits\CP013.bmp"
    loadbmp "CP14", "Images\CharacterPortraits\CP014.bmp"
    loadbmp "CP15", "Images\CharacterPortraits\CP015.bmp"
    loadbmp "CP16", "Images\CharacterPortraits\CP016.bmp"
    loadbmp "CP17", "Images\CharacterPortraits\CP017.bmp"
    loadbmp "CP18", "Images\CharacterPortraits\CP018.bmp"
    loadbmp "BG", "Images\Parchment_1024x768.bmp"
'##############################################################################################
'#END LOAD BITMAPS                                                                            #
'##############################################################################################

 'MUSIC STARTED BEFORE MAIN TO ALLOW MUTE TO WORK ALL THE TIME
    if MusicPlaying$ = "FALSE" then
        'playmidi "Music\MedievalBanquet.mid", howlong
        'MusicPlaying$ = "TRUE"
    end if
    if MusicPlaying$ = "TRUE" then
        if howlong = midipos() then
            stopmidi
            MusicPlaying$ = "FALSE"
        end if
    end if

'##############################################################################################
'#BEGIN LOAD THE MAIN WINDOW                                                                  #
'##############################################################################################
[Main.Menu]
    WindowWidth = 1024
    WindowHeight = 768
    UpperLeftX = int((DisplayWidth - WindowWidth)/2)
    UpperLeftY = int((DisplayHeight - WindowHeight)/2)

    Stylebits #Main, _WS_CAPTION, 0, 0, 0
    menu #Main, "File","New",[NewCharacter],"Open",[LoadCharacter],"Save",[SaveCharacter],"Quit",[Main.Quit]
    menu #Main, "Sound","Mute",[Mute],"Unmute",[Unmute]
    menu #Main, "Tools","Dice Bag",[Dice],"Random Name Gen",[NameGen]
    menu #Main, "About","Help",[Help]

    'bmpbutton #Main.CharacterSheetBtn, "Images\Buttons\CharacterSheetButton_150x50.bmp", [Show.CharacterSheet], UL,859,10
    'bmpbutton #Main.AttributesBtn, "Images\Buttons\CharacterAttributesButton_150x50.bmp", [Show.Attributes], UL,859,65
    'bmpbutton #Main.AbilitiesBtn, "Images\Buttons\AbilitiesButton_150x50.bmp", [Show.Abilities], UL,859,120
    'bmpbutton #Main.SkillsBtn, "Images\Buttons\SkillsButton_150x50.bmp", [Show.Skills], UL,859,175
    'bmpbutton #Main.FeatsBtn, "Images\Buttons\FeatsButton_150x50.bmp", [Show.Feats], UL, 859,230
    'bmpbutton #Main.EquipmentBtn, "Images\Buttons\EquipmentButton_150x50.bmp", [Show.Equipment], UL,859,285
    'bmpbutton #Main.ArmorBtn, "Images\Buttons\ArmorButton_150x50.bmp", [Show.Armor], UL,859,340
    'bmpbutton #Main.WeaponsBtn, "Images\Buttons\WeaponsButton_150x50.bmp", [Show.Weapons], UL,859,395
    'bmpbutton #Main.SpellsBtn, "Images\Buttons\SpellsButton_150x50.bmp", [Show.Spells], UL,859,450
    'bmpbutton #Main.SaveBtn, "Images\Buttons\SaveButton_150x50.bmp", [SaveCharacter], UL,859,505
    'bmpbutton #Main.MuteBtn, "Images\Buttons\MuteSound_150x50.bmp", [Mute], UL,859,560

    'button #Main.CharacterSheetBtn, "Character Sheet",[Show.CharacterSheet],UL,859,10,150,50
    button #Main.AttributesBtn, "Attributes",[Show.Attributes],UL,859,65,150,50
    button #Main.AbilitiesBtn, "Abilities",[Show.Abilities],UL,859,120,150,50
    'BELOW COMMENTED OUT FOR BETA BUILD
    button #Main.SkillsBtn, "Skills",[Show.Skills],UL,859,175,150,50
    'button #Main.FeatsBtn, "Feats",[Show.Feats],UL,859,230,150,50
    'button #Main.EquipmentBtn, "Equipment",[Show.Equipment],UL,859,285,150,50
    'button #Main.ArmorBtn, "Armor",[Show.Armor],UL,859,340,150,50
    'button #Main.WeaponsBtn, "Weapons",[Show.Weapons],UL,859,395,150,50
    'button #Main.SpellsBtn, "Spells",[Show.Spells],UL,859,450,150,50
    'button #Main.LoadBtn, "Load Character", [LoadCharacter], UL,859,615,150,50

    graphicbox #Main.gbx1, 10,10, 150, 200
    'graphicbox #Main.gbx2, 170,10,150,200
    bmpbutton #Main.gbxForward, "Images\Buttons\RightButton_50x25.bmp", [PC.Image.Forward], UL,85,215
    bmpbutton #Main.gbxBack, "Images\Buttons\LeftButton_50x25.bmp", [PC.Image.Back], UL,32,215


    open "Pathfinder Character Gen 1.0.0.1" for graphics_nsb_nf as #Main
    #Main, "trapclose [Main.Quit]"
    #Main, "font Arial 0 0 bold"
    #Main, "background Bg"
    #Main, "drawsprites"

    if CharacterPortraitStepCount = 0 then #Main.gbx1, "flush; drawbmp CP0 0 0; flush"
    if CharacterPortraitStepCount > 0 then #Main.gbx1, "flush; drawbmp " + PCP$ + " 0 0; flush"

    wait

[Mute]
    if MusicPlaying$ = "TRUE" then stopmidi
    MusicPlaying$ = "FALSE"
    wait

[Unmute]
    if MusicPlaying$ = "FALSE" then
        playmidi "Music\MedievalBanquet.mid", howlong
        MusicPlaying$ = "TRUE"
    end if
    wait

[Main.Quit]
    if MusicPlaying$ = "TRUE" then stopmidi
    unloadbmp "BG"
    close #Main
    wait
    end

[Dice]
    run "DiceRoller2.0.tkn"
    wait

[NameGen]
    run "PathfinderRandomNameGen.tkn"
    wait
'##############################################################################################
'#END LOAD THE MAIN WINDOW                                                                    #
'##############################################################################################


'##############################################################################################
'#BEGIN CHARACTER PORTRAIT CONTROLS                                                           #
'##############################################################################################
[PC.Image.Forward]
    if MusicPlaying$ = "TRUE" then playwave "Sounds\hit.wav", async
    if CharacterPortraitStepCount < CharacterPortraitCount then
        CharacterPortraitStepCount = CharacterPortraitStepCount + 1
    else
        CharacterPortraitStepCount = 1
    end if
    gosub [CycleCharacterPortrait]
    wait

[PC.Image.Back]
    if MusicPlaying$ = "TRUE" then playwave "Sounds\hit.wav", async
    if CharacterPortraitStepCount > 1 then
        CharacterPortraitStepCount = CharacterPortraitStepCount - 1
    else
        CharacterPortraitStepCount = 18
    end if
    gosub [CycleCharacterPortrait]
    wait

[CycleCharacterPortrait]
    select case CharacterPortraitStepCount
        case 1
        #Main.gbx1, "flush; drawbmp CP1 0 0; flush"
        PCP$ = "CP1"
        case 2
        #Main.gbx1, "flush; drawbmp CP2 0 0; flush"
        PCP$ = "CP2"
        case 3
        #Main.gbx1, "flush; drawbmp CP3 0 0; flush"
        PCP$ = "CP3"
        case 4
        #Main.gbx1, "flush; drawbmp CP4 0 0; flush"
        PCP$ = "CP4"
        case 5
        #Main.gbx1, "flush; drawbmp CP5 0 0; flush"
        PCP$ = "CP5"
        case 6
        #Main.gbx1, "flush; drawbmp CP6 0 0; flush"
        PCP$ = "CP6"
        case 7
        #Main.gbx1, "flush; drawbmp CP7 0 0; flush"
        PCP$ = "CP7"
        case 8
        #Main.gbx1, "flush; drawbmp CP8 0 0; flush"
        PCP$ = "CP8"
        case 9
        #Main.gbx1, "flush; drawbmp CP9 0 0; flush"
        PCP$ = "CP9"
        case 10
        #Main.gbx1, "flush; drawbmp CP10 0 0; flush"
        PCP$ = "CP10"
        case 11
        #Main.gbx1, "flush; drawbmp CP11 0 0; flush"
        PCP$ = "CP11"
        case 12
        #Main.gbx1, "flush; drawbmp CP12 0 0; flush"
        PCP$ = "CP12"
        case 13
        #Main.gbx1, "flush; drawbmp CP13 0 0; flush"
        PCP$ = "CP13"
        case 14
        #Main.gbx1, "flush; drawbmp CP14 0 0; flush"
        PCP$ = "CP14"
        case 15
        #Main.gbx1, "flush; drawbmp CP15 0 0; flush"
        PCP$ = "CP15"
        case 16
        #Main.gbx1, "flush; drawbmp CP16 0 0; flush"
        PCP$ = "CP16"
        case 17
        #Main.gbx1, "flush; drawbmp CP17 0 0; flush"
        PCP$ = "CP17"
        case 18
        #Main.gbx1, "flush; drawbmp CP18 0 0; flush"
        PCP$ = "CP18"
    end select
    wait
'##############################################################################################
'#END CHARACTER PORTRAIT CONTROLS                                                             #
'##############################################################################################



'##############################################################################################
'#BEGIN SHOW CHARACTER SHEET                                                                  #
'##############################################################################################
[Show.CharacterSheet]
    playwave "Sounds\hit.wav", async
    wait
'##############################################################################################
'#END SHOW CHARACTER SHEET                                                                    #
'##############################################################################################



'##############################################################################################
'#BEGIN CHARACTER ATTRIBUTES                                                                  #
'##############################################################################################
[Show.Attributes]
    close #Main
    'loadbmp "BG", "Images\Parchment_1024x768.bmp"
    if MusicPlaying$ = "TRUE" then playwave "Sounds\hit.wav", async

    WindowWidth = 1024
    WindowHeight = 768
    UpperLeftX = int((DisplayWidth - WindowWidth)/2)
    UpperLeftY = int((DisplayHeight - WindowHeight)/2)

    'ARRAYS FOR DROP DOWN BOXES. ARRAYS ARE POPULATED FROM .DAT FILES
    dim races$(7)
    open "Data\Races.dat" for input as #race
        i = 1
        while eof(#race) = 0
            line input #race, tmp$
            races$(i) = tmp$
            i = i + 1
        wend
    close #race

    dim classes$(11)
    open "Data\Classes.dat" for input as #class
        i = 1
        while eof(#class) = 0
            line input #class, tmp$
            classes$(i) = tmp$
            i = i + 1
        wend
    close #class

    dim levels$(5) 'ONLY GENERATE UP TO LEVEL 5 WILL ADD MORE IN THE FUTURE
    open "Data\Levels.dat" for input as #level
        i = 1
        while eof(#level) = 0
            line input #level, tmp$
            levels$(i) = tmp$
            i = i + 1
        wend
    close #level

    dim deity$(20)
    open "Data\Deity.dat" for input as #deity
        i = 1
        while eof(#deity) = 0
            line input #deity, tmp$
            deity$(i) = tmp$
            i = i + 1
        wend
    close #deity

    'ARRAY WILL BE REDIMENSION IN CHAR.CLASS TO FILTER ALIGNMENTS BY CLASS
    'DON'T DIM THE ARRAY IF ALIGNMENT HAS ALREADY BEEN SET OR THE ALIGNEMENT
    'WILL BE BLANK WHEN OPENING THE ATTRIBUTES WINDOW.
    if boolAttributesSet$ = "FALSE" then dim alignments$(1)

    dim feet$(5)
    open "Data\Feet.dat" for input as #feet
        i = 1
        while eof(#feet) = 0
            line input #feet, tmp$
            feet$(i) = tmp$
            i = i + 1
        wend
    close #feet

    dim inches$(11)
    open "Data\Inches.dat" for input as #inches
        i = 1
        while eof(#inches) = 0
            line input #inches, tmp$
            inches$(i) = tmp$
            i = i + 1
        wend
    close #inches

    dim weights$(74)
    open "Data\Weights.dat" for input as #weights
        i = 1
        while eof(#weights) = 0
            line input #weights, tmp$
            weights$(i) = tmp$
            i = i + 1
        wend
    close #weights

    dim genders$(2)
        genders$(1) = "Male"
        genders$(2) = "Female"

    'ROW ONE
    textbox #Attributes.tbName, 65,40,150,25
    textbox #Attributes.tbPlayer, 285,40,150,25
    textbox #Attributes.tbHomeland, 540,40,175,25
    textbox #Attributes.tbCampaign, 815,40,175,25
    'ROW TWO
    combobox #Attributes.CmbLevel, levels$(), [Char.Level], 65,70,150,125
    combobox #Attributes.CmbRace, races$(),[Char.Race], 285,70,150,125
    combobox #Attributes.CmbClass, classes$(),[Char.Class], 540,70,175,125
    combobox #Attributes.CmbDeity, deity$(),[Char.Deity], 815,70,175,125
    'ROW THREE
    combobox #Attributes.CmbAlign, alignments$(),[Char.Alignment],94,100,121,125
    textbox #Attributes.tbSize, 335,100,100,25
    combobox #Attributes.CmbFeet, feet$(),[Char.Feet], 560,100,75,125
    combobox #Attributes.CmbInches, inches$(),[Char.Inches], 640,100,75,125
    combobox #Attributes.CmbWeight, weights$(),[Char.Weight], 890,100,100,125
    'ROW FOUR
    combobox #Attributes.CmbGender, genders$(),[Char.Gender], 115,130,100,125
    textbox #Attributes.tbAge, 335,130,100,25
    textbox #Attributes.tbHair, 540,130,175,25
    textbox #Attributes.tbEyes, 815,130,175,25
    'ROW FIVE
    textbox #Attributes.tbScar, 65,160,370,25
    textbox #Attributes.tbTattoo, 540,160,450,25
    'ROW SIX
    textbox #Attributes.tbPiercing, 85,190,350,25
    textbox #Attributes.tbPersonality,540,190,450,25

    'STYLE BITS TO LIMIT TEXT IN TEXTBOXES
    Stylebits #Attributes.tbName, _ES_MULTILINE, _ES_AUTOHSCROLL OR _ES_AUTOVSCROLL, 0, 0

    textbox #Attributes.tbBackstory, 100,220,335,150
    Stylebits #Attributes.tbBackstory, _WS_VSCROLL OR _ES_MULTILINE, _ES_AUTOHSCROLL, 0, 0

    textbox #Attributes.tbTip, 65,525,600,200
    Stylebits #Attributes.tbTip, _WS_VSCROLL OR _ES_MULTILINE, _ES_AUTOHSCROLL, 0, 0


    bmpbutton #Attributes.AcceptBtn, "Images\Buttons\AcceptButton_150x50.bmp", [Attributes.Accept], UL,685,650
    'bmpbutton #Attributes.CancelBtn, "Images\Buttons\CancelButton_150x50.bmp", [Attributes.Accept], UL,845,650

    graphicbox #Attributes.gbx1, -1,-1, 1024, 768

    'stylebits #Attributes, 0, _WS_MAXIMIZEBOX or _WS_MINIMIZEBOX, _WS_EX_CLIENTEDGE or _WS_EX_TOPMOST, 0
    open "Character Attributes" for graphics_nsb_nf as #Attributes
    #Attributes, "trapclose [CharAtt.Quit]"
    #Attributes, "font Arial 14 bold"
    #Attributes.tbName, "!setfocus"
    #Attributes.gbx1, "flush; drawbmp BG 0 0; flush"
    #Attributes.tbSize, "!disable"
    #Attributes.CmbRace, "disable"
    #Attributes.CmbClass, "disable"
    #Attributes.CmbDeity, "disable"
    #Attributes.CmbAlign, "disable"

    '###################################
    '##      TRANSPARENT TEXT CALL     #
    '###################################
    hDC=GetDC(hwnd(#Attributes.gbx1))
    call SetBkMode hDC,1
    call ReleaseDC hwnd(#Attributes.gbx1),hDC

    'LABELS FOR THE CONTROLS OF THE WINDOW THEY HAVE TO BE PLACED AFTER
    'THE WINDOW HAS BEEN CREATED
    #Attributes.gbx1, "font arial 12 italic bold"
    #Attributes.gbx1, "down; color black"
    'ROW ONE
    #Attributes.gbx1, "place 10 58"
    #Attributes.gbx1, "\Name:"
    #Attributes.gbx1, "place 225 58"
    #Attributes.gbx1, "\Player:"
    #Attributes.gbx1, "place 450 58"
    #Attributes.gbx1, "\Homeland:"
    #Attributes.gbx1, "place 725 58"
    #Attributes.gbx1, "\Campaign:"
    'ROW TWO
    #Attributes.gbx1, "place 10 88"
    #Attributes.gbx1, "\Level:"
    #Attributes.gbx1, "place 225 88"
    #Attributes.gbx1, "\Race:"
    #Attributes.gbx1, "place 450 88"
    #Attributes.gbx1, "\Class:"
    #Attributes.gbx1, "place 725 88"
    #Attributes.gbx1, "\Deity:"
    'ROW THREE
    #Attributes.gbx1, "place 8 118"
    #Attributes.gbx1, "\Alignment:"
    #Attributes.gbx1, "place 225 118"
    #Attributes.gbx1, "\Size:"
    #Attributes.gbx1, "place 450 118"
    #Attributes.gbx1, "\Height:"
    #Attributes.gbx1, "place 725 118"
    #Attributes.gbx1, "\Weight:"
    'ROW FOUR
    #Attributes.gbx1, "place 10 148"
    #Attributes.gbx1, "\Gender:"
    #Attributes.gbx1, "place 225 148"
    #Attributes.gbx1, "\Age:"
    #Attributes.gbx1, "place 450 148"
    #Attributes.gbx1, "\Hair:"
    #Attributes.gbx1, "place 725 148"
    #Attributes.gbx1, "\Eyes:"

    'ROW FIVE
    #Attributes.gbx1, "place 10 178"
    #Attributes.gbx1, "\Scar:"
    #Attributes.gbx1, "place 450 178"
    #Attributes.gbx1, "\Tattoo:"
    #Attributes.gbx1, "place 10 208"
    #Attributes.gbx1, "\Piercing:"
    #Attributes.gbx1, "place 446 208"
    #Attributes.gbx1, "\Personality:"
    #Attributes.gbx1, "place 10 238"
    #Attributes.gbx1, "\BackStory:"

    #Attributes.gbx1, "place 10 540"
    #Attributes.gbx1, "\Tip:"
    #Attributes.gbx1, "flush"

    'UPDATE UI WHEN RELOADING THE WINDOW TO SHOW THE CURRENT CHARACTER
    'ATTRIBUTES SET. WILL NEED TO ADD ANY CONTROLS ADDED
    #Attributes.tbName, name$
    #Attributes.tbPlayer, player$
    #Attributes.tbHomeland, homeland$
    #Attributes.tbCampaign, campaign$
    #Attributes.CmbLevel, "select "; level$
    #Attributes.CmbRace, "select "; race$
    #Attributes.CmbClass, "select "; class$
    #Attributes.CmbDeity, "select "; deity$
    #Attributes.CmbAlign, "select "; alignment$
    #Attributes.tbSize, size$
    #Attributes.CmbFeet, "select "; feet$
    #Attributes.CmbInches, "select "; inches$
    #Attributes.CmbWeight, "select "; weight$
    #Attributes.tbAge, age$
    #Attributes.CmbGender, "select "; gender$ 
    #Attributes.tbHair, hair$
    #Attributes.tbEyes, eyes$
    #Attributes.tbScar, scar$
    #Attributes.tbPiercing, piercing$
    #Attributes.tbTattoo, tattoo$
    #Attributes.tbPersonality, personality$
    #Attributes.tbBackstory, backstory$

    wait

[Char.Level]
    #Attributes.CmbLevel, "selection? CharLevel$"
    level$ = CharLevel$
    call AttributesReset "Level"
    #Attributes.CmbRace, "enable"
    call SetFocusGraphicBox
    wait

[Char.Race]
    #Attributes.CmbRace, "selection? CharRace$"
    race$ = CharRace$

    raceTip$ = LoadTip$(race$)
    #Attributes.tbTip, raceTip$

    select case race$
        case "Dwarf"
            size$ = "Medium"
            sizeModifier$ = "+0"
            speedFt = 20
            speedSq = 4
            #Attributes.tbSize, size$
        case "Elf"
            size$ = "Medium"
            sizeModifier$ = "+0"
            speedFt = 30
            speedSq = 6
            #Attributes.tbSize, size$
        case "Gnome"
            size$ = "Small"
            sizeModifier$ = "+1"
            speedFt = 20
            speedSq = 4
            baseAttackBonus$ = "+1"
            combatManuverBonus$ = "-1"
            combatManuverDefense$ = "-1"
            #Attributes.tbSize, size$
        case "Half-Elf"
            size$ = "Medium"
            sizeModifier$ = "+0"
            speedFt = 30
            speedSq = 6
            #Attributes.tbSize, size$
        case "Half-Orc"
            size$ = "Medium"
            sizeModifier$ = "+0"
            speedFt = 30
            speedSq = 6
            #Attributes.tbSize, size$ 
        case "Halfling"
            size$ = "Small"
            sizeModifier$ = "+1"
            speedFt = 20
            speedSq = 4
            baseAttackBonus$ = "+1"
            combatManuverBonus$ = "-1"
            combatManuverDefense$ = "-1"
            #Attributes.tbSize, size$ 
        case "Human"
            size$ = "Medium"
            sizeModifier$ = "+0"
            speedFt = 30
            speedSq = 6
            #Attributes.tbSize, size$
    end select
    call AttributesReset "Race"
    #Attributes.CmbClass, "enable"
    call SetFocusGraphicBox
    wait

[Char.Class]
    #Attributes.CmbClass, "selection? CharClass$"
    class$ = CharClass$

    classTip$ = LoadTip$(class$)
    #Attributes.tbTip, classTip$

    'SET HITDIE
    select case class$
        case "Barbarian"
            hitDie$ = "D12"
        case "Bard", "Cleric", "Druid", "Monk", "Rogue"
            hitDie$ = "D8"
        case "Fighter", "Paladin", "Ranger"
            hitDie$ = "D10"
        case "Sorcerer", "Wizard"
            hitDie$ = "D6"
    end select

    'FILTER ALIGNEMENTS DEPENDING ON CLASS
    'CLERIC ALIGNMENT WILL BE FILTERED BY DEITY CHOICE
    if class$ = "Barbarian" then
        '#Attributes.CmbAlign, "enable"
        redim alignments$(6)
            alignments$(1) = "Neutral Good"
            alignments$(2) = "Chaotic Good"
            alignments$(3) = "Neutral"
            alignments$(4) = "Chaotic Neutral"
            alignments$(5) = "Neutral Evil"
            alignments$(6) = "Chaotic Evil"
        #Attributes.CmbAlign, "reload"
    end if

    if class$ = "Bard" or class$ = "Fighter" or class$ = "Ranger" or class$ = "Rogue" or class$ = "Sorcerer" or class$ = "Wizard" then
        '#Attributes.CmbAlign, "enable"
        redim alignments$(9)
        open "Data\Alignments.dat" for input as #align
            i = 1
            while eof(#align) = 0
                line input #align, tmp$
                alignments$(i) = tmp$
                i = i + 1
            wend
        close #align
        #Attributes.CmbAlign, "reload"
    end if

    'SELECTING DIETY WILL UNLOCK ALIGNMENT FOR THE CLERIC CLASS
    if class$ = "Cleric" then #Attributes.CmbAlign, "disable"

    if class$ = "Druid" then
        '#Attributes.CmbAlign, "enable"
        redim alignments$(5)
            alignments$(1) = "Neutral Good"
            alignments$(2) = "Lawful Neutral"
            alignments$(3) = "Neutral"
            alignments$(4) = "Chaotic Neutral"
            alignments$(5) = "Neutral Evil"
        #Attributes.CmbAlign, "reload"
    end if

    if class$ = "Paladin" then
        '#Attributes.CmbAlign, "selectindex 1"
        redim alignments$(1)
            alignments$(1) = "Lawful Good"
        redim deity$(3)
            deity$(1) = "Erastil (LG)"
            deity$(2) = "Iomedae (LG)"
            deity$(3) = "Torag (LG)"
        #Attributes.CmbDeity, "reload"
        #Attributes.CmbAlign, "reload"
    end if

    if class$ = "Monk" then
        '#Attributes.CmbAlign, "enable"
        redim alignments$(3)
            alignments$(1) = "Lawful Good"
            alignments$(2) = "Lawful Neutral"
            alignments$(3) = "Lawful Evil"
        #Attributes.CmbAlign, "reload"
    end if

    'RELOAD DEITYS IF PALADIN CLASS IS NOT SELECTED
    if class$ <> "Paladin" then
        redim deity$(20)
        open "Data\Deity.dat" for input as #deity
        i = 1
        while eof(#deity) = 0
            line input #deity, tmp$
            deity$(i) = tmp$
            i = i + 1
        wend
        close #deity
        #Attributes.CmbDeity, "reload"
    end if

    call AttributesReset "Class"
    #Attributes.CmbDeity, "enable"
    call SetFocusGraphicBox
    wait

[Char.Deity]
    #Attributes.CmbDeity, "selection? CharDeity$"
    deity$ = CharDeity$

    deityTip$ = LoadTip$(deity$)
    #Attributes.tbTip, deityTip$

    'FILTER CHARACTER ALIGNMENTS BY DEITY
    if class$ = "Cleric" then
        if deity$ = "Erastil (LG)" or deity$ = "Iomedae (LG)" or deity$ = "Torag (LG)" then
            '#Attributes.CmbAlign, "enable"
            redim alignments$(2)
                alignments$(1) = "Lawful Good"
                alignments$(2) = "Neutral Good"
            #Attributes.CmbAlign, "reload"
        end if

        if deity$ =  "Sarenrae (NG)" or deity$ = "Shelyn (NG)" then
            '#Attributes.CmbAlign, "enable"
            redim alignments$(3)
                alignments$(1) = "Lawful Good"
                alignments$(2) = "Neutral Good"
                alignments$(3) = "Chaotic Good"
            #Attributes.CmbAlign, "reload"
        end if

        if deity$ = "Cayden Cailean (CG)" or deity$ = "Desna (CG)" then
            '#Attributes.CmbAlign, "enable"
            redim alignments$(3)
                alignments$(1) = "Neutral Good"
                alignments$(2) = "Chaotic Good"
                alignments$(3) = "Lawful Neutral"
            #Attributes.CmbAlign, "reload"
        end if

        if deity$ = "Abadar (LN)" or deity$ = "Irori (LN)" then
            '#Attributes.CmbAlign, "enable"
            redim alignments$(3)
                alignments$(1) = "Chaotic Good"
                alignments$(2) = "Lawful Neutral"
                alignments$(3) = "Neutral"
            #Attributes.CmbAlign, "reload"
        end if

        if deity$ = "Gozreh (N)" or deity$ = "Nethys (N)" or deity$ = "Pharasma (N)" then
            '#Attributes.CmbAlign, "enable"
            redim alignments$(3)
                alignments$(1) = "Lawful Neutral"
                alignments$(2) = "Neutral"
                alignments$(3) = "Chaotic Neutral"
            #Attributes.CmbAlign, "reload"
        end if

        if deity$ = "Calistria (CN)" or deity$ = "Gorum (CN)" then
            '#Attributes.CmbAlign, "enable"
            redim alignments$(3)
                alignments$(1) = "Neutral"
                alignments$(2) = "Chaotic Neutral"
                alignments$(3) = "Lawful Evil"
            #Attributes.CmbAlign, "reload"
        end if

        if deity$ = "Asmodeus (LE)" or deity$ = "Zon-Kuthon (LE)" then
            '#Attributes.CmbAlign, "enable"
            redim alignments$(3)
                alignments$(1) = "Chaotic Neutral"
                alignments$(2) = "Lawful Evil"
                alignments$(3) = "Neutral Evil"
            #Attributes.CmbAlign, "reload"
        end if

        if deity$ = "Norgorber (NE)" or deity$ = "Urgathoa (NE)" then
            '#Attributes.CmbAlign, "enable"
            redim alignments$(3)
                alignments$(1) = "Lawful Evil"
                alignments$(2) = "Neutral Evil"
                alignments$(3) = "Chaotic Evil"
            #Attributes.CmbAlign, "reload"
        end if

        if deity$ = "Lamashtu (CE)" or deity$ = "Rovagug (CE)" then
            '#Attributes.CmbAlign, "enable"
            redim alignments$(2)
                alignments$(1) = "Neutral Evil"
                alignments$(2) = "Chaotic Evil"
            #Attributes.CmbAlign, "reload"
        end if
    end if
    call AttributesReset "Deity"
    #Attributes.CmbAlign, "enable"
    call SetFocusGraphicBox
    wait

[Char.Alignment]
    #Attributes.CmbAlign, "selection? CharAlignment$"
    alignment$ = CharAlignment$
    call SetFocusGraphicBox
    wait

[Char.Feet]
    #Attributes.CmbFeet, "selection? CharFeet$"
    feet$ = CharFeet$
    call SetFocusGraphicBox
    wait

[Char.Inches]
    #Attributes.CmbInches, "selection? CharInches$"
    inches$ = CharInches$
    call SetFocusGraphicBox
    wait

[Char.Weight]
    #Attributes.CmbWeight, "selection? CharWeight$"
    weight$ = CharWeight$
    call SetFocusGraphicBox
    wait

[Char.Gender]
    #Attributes.CmbGender, "selection? CharGender$"
    gender$ = CharGender$
    call SetFocusGraphicBox
    wait

[Attributes.Accept]
    #Attributes.tbName, "!contents? name$"
    'CHECK LEN OF NAME
    if len(name$) > 16 then

    end if
    #Attributes.tbPlayer, "!contents? player$"
    #Attributes.tbHomeland, "!contents? homeland$"
    #Attributes.tbCampaign, "!contents? campaign$"
    #Attributes.tbSize, "!contents? size$"
    #Attributes.tbAge, "!contents? age$"
    #Attributes.tbHair, "!contents? hair$"
    #Attributes.tbEyes, "!contents? eyes$"
    #Attributes.tbScar, "!contents? scar$"
    #Attributes.tbPiercing, "!contents? piercing$"
    #Attributes.tbTattoo, "!contents? tattoo$"
    #Attributes.tbPersonality, "!contents? personality$"
    #Attributes.tbBackstory, "!contents? backstory$"
    boolAttributesSet$ = "TRUE"
    'unloadbmp "AttributesBG"
    close #Attributes
    goto [Main.Menu]
    wait

[Attributes.Cancel]
    wait

[CharAtt.Quit]
    'IF X IS CLICKED AND ACCEPT CLEAR ALL VARIABLES
    if boolAttributesSet$ = "FALSE" then
        name$ = ""
        alignment$ = ""
        player$ = ""
        level$ = ""
        deity$ = ""
        homeland$ = ""
        campaign$ = ""
        class$ = ""
        race$ = ""
        size$ = ""
        gender$ = ""
        age$ = ""
        feet$ = ""
        inches$ = ""
        'height = 0
        weight$ = ""
        hair$ = ""
        eyes$ = ""
        scar$ = ""
        piercing$ = ""
        tattoo$ = ""
        personality$ = ""
        backstory$ = ""
        #Attributes.tbName, name$
        #Attributes.tbPlayer, player$
        #Attributes.tbHomeland, homeland$
        #Attributes.tbCampaign, campaign$
        #Attributes.CmbLevel, "select "; level$
        #Attributes.CmbRace, "select "; race$
        #Attributes.CmbClass, "select "; class$
        #Attributes.CmbDeity, "select "; deity$
        #Attributes.CmbAlign, "select "; alignment$
        #Attributes.tbSize, size$
        #Attributes.CmbFeet, "select "; feet$
        #Attributes.CmbInches, "select "; inches$
        #Attributes.CmbWeight, "select "; weight$
        #Attributes.tbAge, age$
        #Attributes.CmbGender, "select "; gender$ 
        #Attributes.tbHair, hair$
        #Attributes.tbEyes, eyes$
        #Attributes.tbScar, scar$
        #Attributes.tbPiercing, piercing$
        #Attributes.tbTattoo, tattoo$
        #Attributes.tbPersonality, personality$
        #Attributes.tbBackstory, backstory$
    end if

    'unloadbmp "BG"
    close #Attributes
    goto [Main.Menu]
    wait
'##############################################################################################
'#END CHARACTER ATTRIBUTES                                                                    #
'##############################################################################################



'##############################################################################################
'#BEGIN SHOW CHARACTER ABILITIES                                                              #
'##############################################################################################
[Show.Abilities]
    close #Main
    'loadbmp "BG", "Images\Parchment_1024x768.bmp"
    if MusicPlaying$ = "TRUE" then playwave "Sounds\hit.wav", async

    WindowWidth = 1024
    WindowHeight = 768
    UpperLeftX = int((DisplayWidth - WindowWidth)/2)
    UpperLeftY = int((DisplayHeight - WindowHeight)/2)

    button #Abilities.button3D6, "3D6", [button3D6], UL, 375, 210, 40, 25
    button #Abilities.button4D6, "4D6", [button4D6], UL, 420, 210, 40, 25
    button #Abilities.AssignBtn, "Reassign Rolls", [AssignRolls], UL,610,325,125,25

    if race$ = "Half-Elf" or race$ = "Half-Orc" or race$ = "Human" then
        button #Abilities.btnStrUp, "+2", [StrUp], UL, 560,250,40,25
        button #Abilities.btnDexUp, "+2", [DexUp], UL, 560,280,40,25
        button #Abilities.btnConUp, "+2", [ConUp], UL, 560,310,40,25
        button #Abilities.btnIntUp, "+2", [IntUp], UL, 560,340,40,25
        button #Abilities.btnWisUp, "+2", [WisUp], UL, 560,370,40,25
        button #Abilities.btnChaUp, "+2", [ChaUp], UL, 560,400,40,25
    end if

    'Initiative, HP, AC, REF, FORT, WILL, BASE ATTACK BONUS, CMB, CMD, SPEED
    textbox #Abilities.tbHP, 390,150,50,25
    textbox #Abilities.tbDamageReduction, 500,120,50,25
    textbox #Abilities.tbInitiative, 500, 150,50,25
    'AC
    textbox #Abilities.tbAC, 390,30,50,25
    textbox #Abilities.tbTouch, 390,60,50,25
    textbox #Abilities.tbFlatFooted, 390,90,50,25
    'ATTACK BONUS AND DEFENSE
    textbox #Abilities.tbBAB, 500,30,50,25
    textbox #Abilities.tbCMB, 500,60,50,25
    textbox #Abilities.tbCMD, 500,90,50,25
    'SAVES
    textbox #Abilities.tbFortitude, 620,30,50,25
    textbox #Abilities.tbReflex, 620,60,50,25
    textbox #Abilities.tbWill, 620,90,50,25
    'MOVEMENT
    textbox #Abilities.tbSpeed, 805,30,50,25
    textbox #Abilities.tbFly, 805,60,50,25
    textbox #Abilities.tbManuverability, 805,90,50,25
    textbox #Abilities.tbSwim, 940,30,50,25
    textbox #Abilities.tbClimb, 940,60,50,25
    textbox #Abilities.tbBurrow, 940,90,50,25

    'MISC
    textbox #Abilities.tbHitdie, 390,120,50,25
    textbox #Abilities.tbSpellResistance, 940,120,50,25

    textbox #Abilities.tbStr, 390,250,50,25
    textbox #Abilities.tbDex, 390,280,50,25
    textbox #Abilities.tbCon, 390,310,50,25
    textbox #Abilities.tbInt, 390,340,50,25
    textbox #Abilities.tbWis, 390,370,50,25
    textbox #Abilities.tbCha, 390,400,50,25
    textbox #Abilities.tbStrMod, 500,250,50,25
    textbox #Abilities.tbDexMod, 500,280,50,25
    textbox #Abilities.tbConMod, 500,310,50,25
    textbox #Abilities.tbIntMod, 500,340,50,25
    textbox #Abilities.tbWisMod, 500,370,50,25
    textbox #Abilities.tbChaMod, 500,400,50,25

    textbox #Abilities.tbLightLoad, 150,480,150,25
    textbox #Abilities.tbMediumLoad, 150,510,150,25
    textbox #Abilities.tbHeavyLoad, 150,540,150,25
    textbox #Abilities.tbLiftOverHead, 150,570,150,25
    textbox #Abilities.tbLiftOffGround, 150,600,150,25
    textbox #Abilities.tbPushOrDrag, 150,630,150,25

    textbox #Abilities.tbCopper, 390,480,100,25
    textbox #Abilities.tbSilver, 390,510,100,25
    textbox #Abilities.tbGold, 390,540,100,25
    textbox #Abilities.tbPlatinum, 390,570,100,25
    textbox #Abilities.tbExperience, 390,630,100,25

    textbox #Abilities.tbSkillRanks, 680,480,50,25
    textbox #Abilities.tbFeats, 680,510,50,25
    textbox #Abilities.tbBonusLanguages, 680,540,50,25

    bmpbutton #Abilities.AcceptBtn, "Images\Buttons\AcceptButton_150x50.bmp", [Abilities.Accept], UL,685,650

    graphicbox #Abilities.gbx1, -1,-1, 1024, 768

    open "Character Abilities" for graphics_nsb_nf as #Abilities
    #Abilities, "trapclose [Abilities.Quit]"
    #Abilities, "font Arial 0 0 bold"
    #Abilities.gbx1, "flush; drawbmp BG 0 0; flush"
    #Abilities.tbStr, "!disable"
    #Abilities.tbDex, "!disable"
    #Abilities.tbCon, "!disable"
    #Abilities.tbInt, "!disable"
    #Abilities.tbWis, "!disable"
    #Abilities.tbCha, "!disable"
    #Abilities.tbStrMod, "!disable"
    #Abilities.tbDexMod, "!disable"
    #Abilities.tbConMod, "!disable"
    #Abilities.tbIntMod, "!disable"
    #Abilities.tbWisMod, "!disable"
    #Abilities.tbChaMod, "!disable"
    #Abilities.tbHP, "!disable"
    #Abilities.tbDamageReduction, "!disable"
    #Abilities.tbInitiative, "!disable"
    #Abilities.tbAC, "!disable"
    #Abilities.tbTouch, "!disable"
    #Abilities.tbFlatFooted, "!disable"
    #Abilities.tbBAB, "!disable"
    #Abilities.tbCMB, "!disable"
    #Abilities.tbCMD, "!disable"
    #Abilities.tbFortitude, "!disable"
    #Abilities.tbReflex, "!disable"
    #Abilities.tbWill, "!disable"
    #Abilities.tbSpeed, "!disable"
    #Abilities.tbFly, "!disable"
    #Abilities.tbManuverability, "!disable"
    #Abilities.tbSwim, "!disable"
    #Abilities.tbClimb, "!disable"
    #Abilities.tbBurrow, "!disable"
    #Abilities.tbHitdie, "!disable"
    #Abilities.tbSpellResistance, "!disable"
    #Abilities.tbLightLoad, "!disable"
    #Abilities.tbMediumLoad, "!disable"
    #Abilities.tbHeavyLoad, "!disable"
    #Abilities.tbLiftOverHead, "!disable"
    #Abilities.tbLiftOffGround, "!disable"
    #Abilities.tbPushOrDrag, "!disable"
    #Abilities.tbCopper, "!disable"
    #Abilities.tbSilver, "!disable"
    #Abilities.tbGold, "!disable"
    #Abilities.tbPlatinum, "!disable"
    #Abilities.tbExperience, "!disable"
    #Abilities.tbSkillRanks, "!disable"
    #Abilities.tbFeats, "!disable"
    #Abilities.tbBonusLanguages, "!disable"

    if boolAbilitiesSet$ = "TRUE" then
        #Abilities.button3D6, "!disable"
        #Abilities.button4D6, "!disable"
        gosub [DisableAbilityUpButtons]
    end if

    '###################################
    '##      TRANSPARENT TEXT CALL     #
    '###################################
    hDC=GetDC(hwnd(#Abilities.gbx1))
    call SetBkMode hDC,1
    call ReleaseDC hwnd(#Abilities.gbx1),hDC

    'LABELS FOR THE CONTROLS OF THE WINDOW
    #Abilities.gbx1, "font arial 12 italic bold"
    #Abilities.gbx1, "down; color black"

    'SHOW NAME RACE AND CLASS FOR REFERENCE
    #Abilities.gbx1, "place 20 50"
    #Abilities.gbx1, "\Name: " + name$
    #Abilities.gbx1, "place 20 80"
    #Abilities.gbx1, "\Race: " + race$
    #Abilities.gbx1, "place 20 110"
    #Abilities.gbx1, "\Class: " + class$

    'Initiative, HP, AC, REF, FORT, WILL, BASE ATTACK BONUS, CMB, CMD, SPEED
    #Abilities.gbx1, "place 295 170"
    #Abilities.gbx1, "\HP: "
    #Abilities.gbx1, "place 450 140"
    #Abilities.gbx1, "\DR: "
    #Abilities.gbx1, "place 450 170"
    #Abilities.gbx1, "\Init: "
    #Abilities.gbx1, "place 295 50"
    #Abilities.gbx1, "\AC: "
    #Abilities.gbx1, "place 295 80"
    #Abilities.gbx1, "\Touch: "
    #Abilities.gbx1, "place 295 110"
    #Abilities.gbx1, "\Flat Footed: "
    #Abilities.gbx1, "place 450 50"
    #Abilities.gbx1, "\BAB: "
    #Abilities.gbx1, "place 450 80"
    #Abilities.gbx1, "\CMB: "
    #Abilities.gbx1, "place 450 110"
    #Abilities.gbx1, "\CMD: "
    #Abilities.gbx1, "place 560 50"
    #Abilities.gbx1, "\FORT: "
    #Abilities.gbx1, "place 560 80"
    #Abilities.gbx1, "\REF: "
    #Abilities.gbx1, "place 560 110"
    #Abilities.gbx1, "\WILL: "
    #Abilities.gbx1, "place 680 50"
    #Abilities.gbx1, "\Speed: "
    #Abilities.gbx1, "place 680 80"
    #Abilities.gbx1, "\Fly: "
    #Abilities.gbx1, "place 680 110"
    #Abilities.gbx1, "\Manuverability: "
    #Abilities.gbx1, "place 870 50"
    #Abilities.gbx1, "\Swim: "
    #Abilities.gbx1, "place 870 80"
    #Abilities.gbx1, "\Climb: "
    #Abilities.gbx1, "place 870 110"
    #Abilities.gbx1, "\Burrow: "

    'MISC
    #Abilities.gbx1, "place 295 140"
    #Abilities.gbx1, "\Hit Die: "
    #Abilities.gbx1, "place 680 140"
    #Abilities.gbx1, "\Spell Resistance: "

    'DISPLAY ABILITIES
    #Abilities.gbx1, "place 295 270"
    #Abilities.gbx1, "\STR: "
    #Abilities.gbx1, "place 295 300"
    #Abilities.gbx1, "\DEX: "
    #Abilities.gbx1, "place 295 330"
    #Abilities.gbx1, "\CON: "
    #Abilities.gbx1, "place 295 360"
    #Abilities.gbx1, "\INT: "
    #Abilities.gbx1, "place 295 390"
    #Abilities.gbx1, "\WIS: "
    #Abilities.gbx1, "place 295 420"
    #Abilities.gbx1, "\CHA: "

    'DISPLAY ABILITY MODIFIERS
    #Abilities.gbx1, "place 450 270"
    #Abilities.gbx1, "\MOD: "
    #Abilities.gbx1, "place 450 300"
    #Abilities.gbx1, "\MOD: "
    #Abilities.gbx1, "place 450 330"
    #Abilities.gbx1, "\MOD: "
    #Abilities.gbx1, "place 450 360"
    #Abilities.gbx1, "\MOD: "
    #Abilities.gbx1, "place 450 390"
    #Abilities.gbx1, "\MOD: "
    #Abilities.gbx1, "place 450 420"
    #Abilities.gbx1, "\MOD: "

    'WEIGHTS AND CARRYING LOADS
    #Abilities.gbx1, "place 20 500"
    #Abilities.gbx1, "\Light Load: "
    #Abilities.gbx1, "place 20 530"
    #Abilities.gbx1, "\Medium Load: "
    #Abilities.gbx1, "place 20 560"
    #Abilities.gbx1, "\Heavy Load: "

    #Abilities.gbx1, "place 20 590"
    #Abilities.gbx1, "\Lift Over Head:"
    #Abilities.gbx1, "place 20 620"
    #Abilities.gbx1, "\Lift Off Ground: "
    #Abilities.gbx1, "place 20 650"
    #Abilities.gbx1, "\Push Or Drag: "

    'CURRENCY XP
    #Abilities.gbx1, "place 350 500"
    #Abilities.gbx1, "\CP: "
    #Abilities.gbx1, "place 350 530"
    #Abilities.gbx1, "\SP: "
    #Abilities.gbx1, "place 350 560"
    #Abilities.gbx1, "\GP: "
    #Abilities.gbx1, "place 350 590"
    #Abilities.gbx1, "\PP: "
    #Abilities.gbx1, "place 350 650"
    #Abilities.gbx1, "\XP: "

    'SKILL RANKS/FEATS
    #Abilities.gbx1, "place 525 500"
    #Abilities.gbx1, "\Skill Ranks: "
    #Abilities.gbx1, "place 525 530"
    #Abilities.gbx1, "\Feats: "
    #Abilities.gbx1, "place 525 560"
    #Abilities.gbx1, "\Bonus Languages: "


    #Abilities.gbx1, "flush"

    gosub [ClassChecks]
    gosub [RefreshAbilitiesUI]

    wait

[StrUp]
    strUp = 2
    str = str + strUp
    gosub [DisableAbilityUpButtons]
    gosub [UpdateAbilities]
    gosub [applyModifiers]
    gosub [UpdateAbilitiesMod]
    wait
[DexUp]
    dexUp = 2
    dex = dex + dexUp
    gosub [DisableAbilityUpButtons]
    gosub [UpdateAbilities]
    gosub [applyModifiers]
    gosub [UpdateAbilitiesMod]
    wait
[ConUp]
    conUp = 2
    con = con + conUp
    gosub [DisableAbilityUpButtons]
    gosub [UpdateAbilities]
    gosub [applyModifiers]
    gosub [UpdateAbilitiesMod]
    wait
[IntUp]
    intUp = 2
    int = int + intUp
    gosub [DisableAbilityUpButtons]
    gosub [UpdateAbilities]
    gosub [applyModifiers]
    gosub [UpdateAbilitiesMod]
    wait
[WisUp]
    wisUp = 2
    wis = wis + wisUp
    gosub [DisableAbilityUpButtons]
    gosub [UpdateAbilities]
    gosub [applyModifiers]
    gosub [UpdateAbilitiesMod]
    wait
[ChaUp]
    chaUp = 2
    cha = cha + chaUp
    gosub [DisableAbilityUpButtons]
    gosub [UpdateAbilities]
    gosub [applyModifiers]
    gosub [UpdateAbilitiesMod]
    wait

'********************************************************************************
'GENERATE ABILITY SCORES
'YOU CAN USE THE 3D6 OR THE 4D6 GENERATION METHOD
'********************************************************************************
[button3D6]
    armorClass = 0 'RESET ARMOR CLASS SO IT DISPLAYS CORRECTLY
    str = (int(rnd(1) * 6) + 1) + (int(rnd(1) * 6) + 1) + (int(rnd(1) * 6) + 1) + strUp
    dex = (int(rnd(1) * 6) + 1) + (int(rnd(1) * 6) + 1) + (int(rnd(1) * 6) + 1) + dexUp
    con = (int(rnd(1) * 6) + 1) + (int(rnd(1) * 6) + 1) + (int(rnd(1) * 6) + 1) + conUp
    int = (int(rnd(1) * 6) + 1) + (int(rnd(1) * 6) + 1) + (int(rnd(1) * 6) + 1) + intUp
    wis = (int(rnd(1) * 6) + 1) + (int(rnd(1) * 6) + 1) + (int(rnd(1) * 6) + 1) + wisUp
    cha = (int(rnd(1) * 6) + 1) + (int(rnd(1) * 6) + 1) + (int(rnd(1) * 6) + 1) + chaUp

    'STARTING CURRENCY
     currencyVal = SetCurrency(class$,level$)

    gosub [UpdateAbilities]
    gosub [applyModifiers]
    gosub [UpdateAbilitiesMod]
    'NEED TO ADD RACIAL CHECKS TO ADJUST ABILITIES
    gosub [ClassChecks]
    gosub [RefreshAbilitiesUI]

    'gosub [generateGold]

    wait

[button4D6]
    armorClass = 0 'RESET ARMOR CLASS SO IT DISPLAYS CORRECTLY
    str = roll() + strUp
    dex = roll() + dexUp
    con = roll() + conUp
    int = roll() + intUp
    wis = roll() + wisUp
    cha = roll() + chaUp

    'STARTING CURRENCY
     currencyVal = SetCurrency(class$,level$)

    gosub [UpdateAbilities]
    gosub [applyModifiers]
    gosub [UpdateAbilitiesMod]
    gosub [ClassChecks]
    gosub [RefreshAbilitiesUI]

    wait

[Abilities.Accept]
    boolAbilitiesSet$ = "TRUE"
    #Abilities.button3D6, "!disable"
    #Abilities.button4D6, "!disable"
    close #Abilities
    goto [Main.Menu]
    wait

[Abilities.Quit]
    close #Abilities
    goto [Main.Menu]
    'unloadbmp "BG"
    wait

[AssignRolls]
    WindowWidth = 640
    WindowHeight = 480
    UpperLeftX = int((DisplayWidth - WindowWidth)/2)
    UpperLeftY = int((DisplayHeight - WindowHeight)/2)

    tmpSTR = str
    tmpDEX = dex
    tmpCON = con
    tmpINT = int
    tmpWIS = wis
    tmpCHA = cha

    statictext #Assign.St1, "Ability", 45,25,50,20
    statictext #Assign.St2, "Scores", 40,45,75,20
    'CURRENT
    statictext #Assign.St3, "STR: ",10,75,40,25
    statictext #Assign.St4, "DEX: ",10,105,40,25
    statictext #Assign.St5, "CON: ",10,135,40,25
    statictext #Assign.St6, "INT: ",10,165,40,25
    statictext #Assign.St7, "WIS: ",10,195,40,25
    statictext #Assign.St8, "CHA: ",10,225,40,25
    'REASSIGNED
    statictext #Assign.St9, "STR: ",210,75,40,25
    statictext #Assign.St10, "DEX: ",210,105,40,25
    statictext #Assign.St11, "CON: ",210,135,40,25
    statictext #Assign.St12, "INT: ",210,165,40,25
    statictext #Assign.St13, "WIS: ",210,195,40,25
    statictext #Assign.St14, "CHA: ",210,225,40,25

    textbox #Assign.Tb1, 60,70,50,25
    textbox #Assign.Tb2, 60,100,50,25
    textbox #Assign.Tb3, 60,130,50,25
    textbox #Assign.Tb4, 60,160,50,25
    textbox #Assign.Tb5, 60,190,50,25
    textbox #Assign.Tb6, 60,220,50,25

    button #Assign.Btn1, "Assign >", AssignEventHandler,UL,120,70,75,25
    button #Assign.Btn2, "Assign >", AssignEventHandler,UL,120,100,75,25
    button #Assign.Btn3, "Assign >", AssignEventHandler,UL,120,130,75,25
    button #Assign.Btn4, "Assign >", AssignEventHandler,UL,120,160,75,25
    button #Assign.Btn5, "Assign >", AssignEventHandler,UL,120,190,75,25
    button #Assign.Btn6, "Assign >", AssignEventHandler,UL,120,220,75,25

    textbox #Assign.Tb7, 260,70,50,25
    textbox #Assign.Tb8, 260,100,50,25
    textbox #Assign.Tb9, 260,130,50,25
    textbox #Assign.Tb10, 260,160,50,25
    textbox #Assign.Tb11, 260,190,50,25
    textbox #Assign.Tb12, 260,220,50,25

    open "Reassign Rolls" for window_nf as #Assign
    #Assign, "trapclose [Assign.Quit]"
    #Assign, "font Arial 0 0 bold"
    #Assign.Tb1, "!disable"
    #Assign.Tb2, "!disable"
    #Assign.Tb3, "!disable"
    #Assign.Tb4, "!disable"
    #Assign.Tb5, "!disable"
    #Assign.Tb6, "!disable"
    #Assign.Tb7, "!disable"
    #Assign.Tb8, "!disable"
    #Assign.Tb9, "!disable"
    #Assign.Tb10, "!disable"
    #Assign.Tb11, "!disable"
    #Assign.Tb12, "!disable"
    #Assign.Tb1, str
    #Assign.Tb2, dex
    #Assign.Tb3, con
    #Assign.Tb4, int
    #Assign.Tb5, wis
    #Assign.Tb6, cha
    wait

[Assign.Quit]
    assign = 0
    'gosub [UpdateAbilities]
    gosub [applyModifiers]
    gosub [UpdateAbilitiesMod]
    gosub [ClassChecks]
    gosub [RefreshAbilitiesUI]
    close #Assign
    wait
'##############################################################################################
'#END SHOW CHARACTER ABILITIES                                                                #
'##############################################################################################



'##############################################################################################
'#BEGIN SHOW CHARACTER SKILLS                                                                 #
'##############################################################################################
[Show.Skills]
    close #Main
    if MusicPlaying$ = "TRUE" then playwave "Sounds\hit.wav", async

    WindowWidth = 1024
    WindowHeight = 768
    UpperLeftX = int((DisplayWidth - WindowWidth)/2)
    UpperLeftY = int((DisplayHeight - WindowHeight)/2)

    checkbox #Skills.Chb1, "", [wait], [wait], 30,80,15,15
    checkbox #Skills.Chb38, "", [wait], [wait], 90,80,15,15

    textbox #Skills.Tb1, 455,75,50,25

    graphicbox #Skills.gbx1, -1,-1, 1024, 768

    open "Character Skills" for graphics_nsb_nf as #Skills
    #Skills, "trapclose [Skills.Quit]"
    #Skills, "font Arial 0 0 bold"
    #Skills.gbx1, "flush; drawbmp BG 0 0; flush"

    '###################################
    '##      TRANSPARENT TEXT CALL     #
    '###################################
    hDC=GetDC(hwnd(#Skills.gbx1))
    call SetBkMode hDC,1
    call ReleaseDC hwnd(#Skills.gbx1),hDC

    'LABELS FOR THE CONTROLS OF THE WINDOW
    #Skills.gbx1, "font arial 12 italic bold"
    #Skills.gbx1, "down; color black"

    'SKILL LABELS
    #Skills.gbx1, "place 15 25"
    #Skills.gbx1, "\SKILLS"
    #Skills.gbx1, "place 15 50"
    #Skills.gbx1, "\Class"
    #Skills.gbx1, "place 20 65"
    #Skills.gbx1, "\Skill"
    #Skills.gbx1, "place 70 65"
    #Skills.gbx1, "\Trained"
    #Skills.gbx1, "place 185 50"
    #Skills.gbx1, "\Skill"
    #Skills.gbx1, "place 180 65"
    #Skills.gbx1, "\Names"
    #Skills.gbx1, "place 380 65"
    #Skills.gbx1, "\Ability"
    #Skills.gbx1, "place 450 50"
    #Skills.gbx1, "\Ability"
    #Skills.gbx1, "place 455 65"
    #Skills.gbx1, "\Mod"


    'SKILLS
    #Skills.gbx1, "place 160 95"
    #Skills.gbx1, "\Acrobatics"
    #Skills.gbx1, "place 385 95"
    #Skills.gbx1, "\DEX"

    wait
[wait]
wait

[Skills.Quit]
    close #Skills
    goto [Main.Menu]
    wait
'##############################################################################################
'#END SHOW CHARACTER SKILLS                                                                   #
'##############################################################################################



'##############################################################################################
'#BEGIN SHOW CHARACTER FEATS                                                                  #
'##############################################################################################
[Show.Feats]
    close #Main
    if MusicPlaying$ = "TRUE" then playwave "Sounds\hit.wav", async

    WindowWidth = 1024
    WindowHeight = 768
    UpperLeftX = int((DisplayWidth - WindowWidth)/2)
    UpperLeftY = int((DisplayHeight - WindowHeight)/2)

    open "Character Feats" for graphics_nsb_nf as #Feats
    #Feats, "trapclose [Feats.Quit]"
    #Feats, "font Arial 0 0 bold"
    wait

[Feats.Quit]
    close #Feats
    goto [Main.Menu]
    wait
'##############################################################################################
'#END SHOW CHARACTER FEATS                                                                    #
'##############################################################################################



'##############################################################################################
'#BEGIN SHOW CHARACTER EQUIPMENT                                                              #
'##############################################################################################
[Show.Equipment]
    close #Main
    if MusicPlaying$ = "TRUE" then playwave "Sounds\hit.wav", async

    WindowWidth = 1024
    WindowHeight = 768
    UpperLeftX = int((DisplayWidth - WindowWidth)/2)
    UpperLeftY = int((DisplayHeight - WindowHeight)/2)

    open "Character Equipment" for graphics_nsb_nf as #Equipment
    #Equipment, "trapclose [Equipment.Quit]"
    #Equipment, "font Arial 0 0 bold"
    wait

[Equipment.Quit]
    close #Equipment
    goto [Main.Menu]
    wait
'##############################################################################################
'#END SHOW CHARACTER EQUIPMENT                                                                #
'##############################################################################################



'##############################################################################################
'#BEGIN SHOW CHARACTER ARMOR                                                                  #
'##############################################################################################
[Show.Armor]
    close #Main
    if MusicPlaying$ = "TRUE" then playwave "Sounds\hit.wav", async

    WindowWidth = 1024
    WindowHeight = 768
    UpperLeftX = int((DisplayWidth - WindowWidth)/2)
    UpperLeftY = int((DisplayHeight - WindowHeight)/2)

    open "Character Armor" for graphics_nsb_nf as #Armor
    #Armor, "trapclose [Armor.Quit]"
    #Armor, "font Arial 0 0 bold"
    wait

[Armor.Quit]
    close #Armor
    goto [Main.Menu]
    wait
'##############################################################################################
'#END SHOW CHARACTER ARMOR                                                                    #
'##############################################################################################



'##############################################################################################
'#BEGIN SHOW CHARACTER WEAPONS                                                                #
'##############################################################################################
[Show.Weapons]
    close #Main
    if MusicPlaying$ = "TRUE" then playwave "Sounds\hit.wav", async

    WindowWidth = 1024
    WindowHeight = 768
    UpperLeftX = int((DisplayWidth - WindowWidth)/2)
    UpperLeftY = int((DisplayHeight - WindowHeight)/2)

    open "Character Weapons" for graphics_nsb_nf as #Weapons
    #Weapons, "trapclose [Weapons.Quit]"
    #Weapons, "font Arial 0 0 bold"
    wait

[Weapons.Quit]
    close #Weapons
    goto [Main.Menu]
    wait
'##############################################################################################
'#END SHOW CHARACTER WEAPONS                                                                  #
'##############################################################################################



'##############################################################################################
'#BEGIN SHOW CHARACTER SPELLS                                                                 #
'##############################################################################################
[Show.Spells]
    close #Main
    if MusicPlaying$ = "TRUE" then playwave "Sounds\hit.wav", async

    WindowWidth = 1024
    WindowHeight = 768
    UpperLeftX = int((DisplayWidth - WindowWidth)/2)
    UpperLeftY = int((DisplayHeight - WindowHeight)/2)

    open "Character Spells" for graphics_nsb_nf as #Spells
    #Spells, "trapclose [Spells.Quit]"
    #Spells, "font Arial 0 0 bold"
    wait

[Spells.Quit]
    close #Spells
    goto [Main.Menu]
    wait
'##############################################################################################
'#END SHOW CHARACTER SPELLS                                                                   #
'##############################################################################################


'##############################################################################################
'#BEGIN SAVE CHARACTER                                                                        #
'##############################################################################################
[SaveCharacter]
    'boolAttributesSet$ = "FALSE"
    'name$ = ""
    'alignment$ = ""
    'player$ = ""
    'level$ = ""
    'deity$ = ""
    'homeland$ = ""
    'campaign$ = ""
    'class$ = ""
    'race$ = ""
    'size$ = ""
    'gender$ = ""
    'age$ = ""
    'feet$ = ""
    'inches$ = ""
    'height = 0
    'weight$ = ""
    'hair$ = ""
    'eyes$ = ""
    'scar$ = ""
    'piercing$ = ""
    'tattoo$ = ""
    tmpDir$ = DefaultDir$
    DefaultDir$ = DefaultDir$ + "\SavedCharacters\"
    spc3$ = "   " '3 SPACES
    spc5$ = "     " '5 SPACES
    spc10$ = "          " '10 SPACES
    if boolAttributesSet$ = "TRUE" then
        filedialog "Save Character Sheet", "*.rtf", fileName$
        'IF THE FILE EXTENSION IS MISSING ADD IT TO THE FILENAME
        if right$(fileName$,4) <> ".rtf" then
            fileName$ = fileName$ + ".rtf"
        end if

        open fileName$ for output as #Save
            #Save, "#########################################################################"
            #Save, "#                     Pathfinder Character Sheet                        #"
            #Save, "#########################################################################"
            #Save, ""
            'LINE1
            #Save, "Name: " + name$ + spc10$;
            #Save, "Player: " + player$ + spc10$
            'LINE2
            #Save, "Homeland: " + homeland$ + spc10$;
            #Save, "Campaign: " + campaign$
            'LINE3
            #Save, "Level: " + level$ + spc5$;
            #Save, "Race: " + race$ + spc5$;
            #Save, "Class: " + class$ + spc5$
            'LINE4
            #Save, "Deity: " + deity$ + spc5$;
            #Save, "Alignment: " + alignment$ + spc5$
            'LINE 5
            #Save, "Size: " + size$ + spc3$;
            #Save, "Height: " + feet$;
            #Save, " - " + inches$ + spc3$;
            #Save, "Weight: " + weight$ + "lbs"
            'LINE 6
            #Save, "Age: " + age$ + spc3$;
            #Save, "Gender: " + gender$ + spc3$;
            #Save, "Hair: " + hair$ + spc3$
            'LINE 7
            #Save, "Scar: " + scar$
            'LINE 8
            #Save, "Piercing: " + piercing$ + spc5$
            'LINE 9
            #Save, "Tattoo: " + tattoo$
            'LINE 10
            #Save "Personality: " + personality$
            'LINE 11
            #Save, "Backstory: " + backstory$

            'LINE 12
            #Save, ""
            #Save, ""
            #Save, "Ability Scores"
            if str <= 9 then #Save, "STR: 0" + str$(str) + spc3$ + "MOD: " + strMod$;
            if str >= 10 then #Save, "STR: " + str$(str) + spc3$ + "MOD: " + strMod$;

        close #Save

        'fileName$ = ""
        filedialog "Save Character", "*.pfcg", fileName$
            'IF THE FILE EXTENSION IS MISSING ADD IT TO THE FILENAME
            if right$(fileName$,5) <> ".pfcg" then
                fileName$ = fileName$ + ".pfcg"
            end if
        open fileName$ for output as #Save
            'ATTRIBUTES PAGE SAVE
            #Save, CharacterPortraitStepCount
            #Save, boolAttributesSet$
            #Save, boolAbilitiesSet$
            #Save, name$
            #Save, player$
            #Save, homeland$
            #Save, campaign$
            #Save, level$
            #Save, race$
            #Save, class$
            #Save, deity$
            #Save, alignment$
            #Save, size$
            #Save, feet$
            #Save, inches$
            #Save, weight$
            #Save, age$
            #Save, gender$ 
            #Save, hair$
            #Save, eyes$
            #Save, scar$
            #Save, piercing$
            #Save, tattoo$
            #Save, personality$
            #Save, backstory$

            'ABILITITES PAGE SAVE
            #Save, hpTotal
            #Save, damageReduction
            #Save, initiativeTotal$
            #Save, AC
            #Save, touchAC
            #Save, flatFootedAC
            #Save, baseAttackBonus$ 
            #Save, combatManuverBonus$ 
            #Save, combatManuverDefense$ 
            #Save, fortitude$ 
            #Save, reflex$
            #Save, will$
            #Save, speedFt
            #Save, flyFt
            #Save, flyManuverability
            #Save, swimFt
            #Save, climbFt
            #Save, burrowFt
            #Save, hitDie$
            #Save, spellResistance
            #Save, str
            #Save, dex
            #Save, con
            #Save, int
            #Save, wis
            #Save, cha
            #Save, strMod$
            #Save, dexMod$
            #Save, conMod$
            #Save, intMod$
            #Save, wisMod$
            #Save, chaMod$
            #Save, lightLoad$
            #Save, mediumLoad$
            #Save, heavyLoad$
            #Save, liftOverHead$ 
            #Save, liftOffGround$ 
            #Save, pushOrDrag$
            #Save, copper
            #Save, silver
            #Save, gold
            #Save, platinum
            #Save, xp
            #Save, skillRanks
            #Save, feats
            #Save, bonusLanguages

        close #Save

    end if
    DefaultDir$ = tmpDir$
    wait
'##############################################################################################
'#END SAVE CHARACTER                                                                          #
'##############################################################################################



'##############################################################################################
'#BEGIN LOAD CHARACTER                                                                        #
'##############################################################################################
[LoadCharacter]
    tmpDir$ = DefaultDir$
    DefaultDir$ = DefaultDir$ + "\SavedCharacters\"
    filedialog "Open", "*.pfcg", fileName$
    if fileName$ = "" then notice "No File Chose!" : wait

    open fileName$ for input as #Char
        'ATTRIBUTES
        line input #Char, CharacterPortraitStepCount
        line input #Char, boolAttributesSet$
        line input #Char, boolAbilitiesSet$
        line input #Char, name$
        line input #Char, player$
        line input #Char, homeland$
        line input #Char, campaign$
        line input #Char, level$
        line input #Char, race$
        line input #Char, class$
        line input #Char, deity$
        line input #Char, alignment$
        line input #Char, size$
        line input #Char, feet$
        line input #Char, inches$
        line input #Char, weight$
        line input #Char, age$
        line input #Char, gender$ 
        line input #Char, hair$
        line input #Char, eyes$
        line input #Char, scar$
        line input #Char, piercing$
        line input #Char, tattoo$
        line input #Char, personality$
        line input #Char, backstory$
        'ABILITIES
        line input #Char, hpTotal
        line input #Char, damageReduction
        line input #Char, initiativeTotal$
        line input #Char, AC
        line input #Char, touchAC
        line input #Char, flatFootedAC
        line input #Char, baseAttackBonus$ 
        line input #Char, combatManuverBonus$ 
        line input #Char, combatManuverDefense$ 
        line input #Char, fortitude$ 
        line input #Char, reflex$
        line input #Char, will$
        line input #Char, speedFt
        line input #Char, flyFt
        line input #Char, flyManuverability
        line input #Char, swimFt
        line input #Char, climbFt
        line input #Char, burrowFt
        line input #Char, hitDie$
        line input #Char, spellResistance
        line input #Char, str
        line input #Char, dex
        line input #Char, con
        line input #Char, int
        line input #Char, wis
        line input #Char, cha
        line input #Char, strMod$
        line input #Char, dexMod$
        line input #Char, conMod$
        line input #Char, intMod$
        line input #Char, wisMod$
        line input #Char, chaMod$
        line input #Char, lightLoad$
        line input #Char, mediumLoad$
        line input #Char, heavyLoad$
        line input #Char, liftOverHead$ 
        line input #Char, liftOffGround$ 
        line input #Char, pushOrDrag$
        line input #Char, copper
        line input #Char, silver
        line input #Char, gold
        line input #Char, platinum
        line input #Char, xp
        line input #Char, skillRanks
        line input #Char, feats
        line input #Char, bonusLanguages
    close #Char

    DefaultDir$ = tmpDir$
    gosub [CycleCharacterPortrait]
    wait
'##############################################################################################
'#END LOAD CHARACTER                                                                          #
'##############################################################################################



'##############################################################################################
'#BEGIN NEW CHARACTER                                                                         #
'##############################################################################################
[NewCharacter]
    #Main.gbx1, "flush; drawbmp CP0 0 0; flush"
    CharacterPortraitStepCount = 0
    'ATTRIBUTES
    boolAttributesSet$ = "FALSE"
    boolAbilitiesSet$ = "FALSE"
    name$ = ""
    alignment$ = ""
    player$ = ""
    level$ = ""
    deity$ = ""
    homeland$ = ""
    campaign$ = ""
    class$ = ""
    race$ = ""
    size$ = ""
    gender$ = ""
    age$ = ""
    feet$ = ""
    inches$ = ""
    'height = 0
    weight$ = ""
    hair$ = ""
    eyes$ = ""
    scar$ = ""
    piercing$ = ""
    tattoo$ = ""
    personality$ = ""
    backstory$ = ""
    xp = 0
    spellsPerDay = 0
    skillRanks = 0
    feats = 0
    bonusLanguages = 0

    'ABILITY SCORES
    str = 0
    strUp = 0
    strMod$ = "+0"
    strTmpAdj = 0
    strTmpMod = 0
    dex = 0
    dexUp = 0
    dexMod$ = "+0"
    dexTmpAdj = 0
    dexTmpMod = 0
    con = 0
    conUp = 0
    conMod$ = "+0"
    conTmpAdj = 0
    conTmpMod = 0
    int = 0
    intUp = 0
    intMod$ = "+0"
    intTmpAdj = 0
    intTmpMod = 0
    wis = 0
    wisUp = 0
    wisMod$ = "+0"
    wisTmpAdj = 0
    wisTmpMod = 0
    cha = 0
    chaUp = 0
    chaMod$ = "+0"
    chaTmpAdj = 0
    chaTmpMod = 0

    'HIT POINTS
    hitDie$ = "D0"
    hpTotal = 0
    damageReduction = 0
    'wounds = 0
    'currentHp = 0
    nonlethalDmg = 0

    'INITIATIVE
    'INIT = DEXMOD + INITMISCMOD
    initiativeTotal$ = "+0"
    initiativeMiscMod = 0

    'MOVEMENT SPEED
    speedFt = 0
    speedSq = 0
    speedArmorFt = 0
    speedArmorSq = 0
    flyFt = 0
    flyManuverability = 0
    swimFt = 0
    climbFt = 0
    burrowFt = 0
    speedTmpMod = 0

    'ARMOR CLASS
    'AC = 10 + ARMOR + SHIELD +DEXMOD + SIZE + NATARMOR + DEFMOD + MISCARMORMOD
    AC = BASEAC
    armorBonus = 0
    shieldBonus = 0
    sizeModifier$ = "0"
    naturalArmor = 0
    deflectionMod = 0
    miscArmorMod = 0
    touchAC = 0
    flatFootedAC = 0

    'SAVING THROWS
    'SAVE = BASE + ABILITY + MAGIC + MISC + TEMP
    fortitude$ = "0"
    fortitudeBase$ = "0"
    'fortitudeMagic = 0
    'fortitudeMisc = 0
    'fortitudeTemp = 0
    reflex$ = "0"
    reflexBase$ = "0"
    'reflexMagic = 0
    'reflexMisc = 0
    'reflexTemp = 0
    will$ = "0"
    willBase$ = "0"
    'willMagic = 0
    'willMisc = 0
    'willTemp = 0

    'PC MISC
    'CMB = BAB + STRMOD + SIZEMOD
    'CMD = 10 + BAB + STRMOD + DEXMOD + SIZEMOD
    spellResistance$ = "0"
    baseAttackBonus$ = "0"
    combatManuverBonus$ = "0"
    combatManuverDefense$ = "0"

    'WEIGHTS
    maxLoad = 0
    lightLoad$ = "0 lbs."
    mediumLoad$ = "0 lbs."
    heavyLoad$ = "0 lbs."
    liftOverHead$ = "0 lbs."
    liftOffGround$ = "0 lbs."
    pushOrDrag$ = "0 lbs."

    'CURRENCY
    copper = 0
    silver = 0
    gold = 0
    platinum = 0
    wait

'##############################################################################################
'#END NEW CHARACTER                                                                           #
'##############################################################################################


'LOAD HELP FILE
[Help]
    'run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe help.html"
    url$ = "https://sites.google.com/view/pathfindercg/home"
    run "rundll32.exe url.dll,FileProtocolHandler ";url$
    wait


'UPDATE THE ABILITIES UI WHEN RELOADING THE WINDOW
[RefreshAbilitiesUI]
    #Abilities.tbHP, hpTotal
    #Abilities.tbDamageReduction, damageReduction
    #Abilities.tbInitiative, initiativeTotal$
    'AC
    #Abilities.tbAC, AC
    #Abilities.tbTouch, touchAC
    #Abilities.tbFlatFooted, flatFootedAC
    'ATTACK BONUS AND DEFENSE
     if val(baseAttackBonus$) >= 0 then
        #Abilities.tbBAB, chr$(43)+ baseAttackBonus$
     else
        #Abilities.tbBAB, chr$(45)+ baseAttackBonus$
     end if

    if val(combatManuverBonus$) >= 0 then
        #Abilities.tbCMB, chr$(43) + combatManuverBonus$
    else
        #Abilities.tbCMB, chr$(45) + combatManuverBonus$
    end if

    if val(combatManuverDefense$) >= 0 then
        #Abilities.tbCMD, chr$(43) + combatManuverDefense$
    else
        #Abilities.tbCMD, chr$(45) + combatManuverDefense$
    end if

    'SAVES
    if val(fortitude$) >= 0 then
        #Abilities.tbFortitude, chr$(43) + fortitude$
    else
        #Abilities.tbFortitude, chr$(45) + fortitude$
    end if

    if val(reflex$) >= 0 then
        #Abilities.tbReflex, chr$(43) + reflex$
    else
        #Abilities.tbReflex, chr$(45) + reflex$
    end if

    if val(will$) >= 0 then
        #Abilities.tbWill, chr$(43) + will$
    else
        #Abilities.tbWill, chr$(45) + will$
    end if

    'MOVEMENT
    #Abilities.tbSpeed, speedFt
    #Abilities.tbFly, flyFt
    #Abilities.tbManuverability, flyManuverability
    #Abilities.tbSwim, swimFt
    #Abilities.tbClimb, climbFt
    #Abilities.tbBurrow, burrowFt

    'MISC
    #Abilities.tbHitdie, hitDie$
    #Abilities.tbSpellResistance, spellResistance

    #Abilities.tbStr, str
    #Abilities.tbDex, dex
    #Abilities.tbCon, con
    #Abilities.tbInt, int
    #Abilities.tbWis, wis
    #Abilities.tbCha, cha
    #Abilities.tbStrMod, strMod$
    #Abilities.tbDexMod, dexMod$
    #Abilities.tbConMod, conMod$
    #Abilities.tbIntMod, intMod$
    #Abilities.tbWisMod, wisMod$
    #Abilities.tbChaMod, chaMod$

    #Abilities.tbLightLoad, lightLoad$
    #Abilities.tbMediumLoad, mediumLoad$
    #Abilities.tbHeavyLoad, heavyLoad$
    #Abilities.tbLiftOverHead, liftOverHead$ 
    #Abilities.tbLiftOffGround, liftOffGround$ 
    #Abilities.tbPushOrDrag, pushOrDrag$

    #Abilities.tbCopper, copper
    #Abilities.tbSilver, silver
    #Abilities.tbGold, gold
    #Abilities.tbPlatinum, platinum
    #Abilities.tbExperience, xp

    #Abilities.tbSkillRanks, skillRanks
    #Abilities.tbFeats, feats
    #Abilities.tbBonusLanguages, bonusLanguages


    return


'##############################################################################################
'# BEGIN FUNCTIONS AND SUBROUTINES FOR TRANSPARENT TEXT                                       #
'##############################################################################################
    Sub SetBkMode hDC, flag
        '1=transparent
        '2=opaque
        CallDLL #gdi32, "SetBkMode",hDC As long,_
            flag As long, RESULT As long
    End Sub

    Function GetDC(hWnd)
        CallDLL #user32, "GetDC",hWnd As long,_
            GetDC As long
    End Function

    Sub ReleaseDC hWnd, hDC
        CallDLL#user32,"ReleaseDC",hWnd As long,_
            hDC As long,result As long
    End Sub

    function LoadTip$(text$)
        open "Tips\Tip_" + text$ + ".dat" for input as #tip
            tip$ = input$(#tip, LOF(#tip))
        close #tip
        LoadTip$ = tip$
    end function

    sub AttributesReset cAttribute$
        select case cAttribute$
            case "Level"
                #Attributes.CmbRace, "disable"
                #Attributes.CmbRace, "selectindex 0"
                #Attributes.CmbClass, "disable"
                #Attributes.CmbClass, "selectindex 0"
                #Attributes.CmbDeity, "disable"
                #Attributes.CmbDeity, "selectindex 0"
                #Attributes.CmbAlign, "disable"
                #Attributes.CmbAlign, "selectindex 0"
            case "Race"
                #Attributes.CmbClass, "disable"
                #Attributes.CmbClass, "selectindex 0"
                #Attributes.CmbDeity, "disable"
                #Attributes.CmbDeity, "selectindex 0"
                #Attributes.CmbAlign, "disable"
                #Attributes.CmbAlign, "selectindex 0"
            case "Class"
                #Attributes.CmbDeity, "disable"
                #Attributes.CmbDeity, "selectindex 0"
                #Attributes.CmbAlign, "disable"
                #Attributes.CmbAlign, "selectindex 0"
            Case "Deity"
                #Attributes.CmbAlign, "disable"
                #Attributes.CmbAlign, "selectindex 0"
        end select
    end sub

    sub SetFocusGraphicBox
        #Attributes.gbx1, "setfocus"
    end sub

'REASSIGNING ABILITY SCORES
    sub AssignEventHandler handle$
        assign = assign + 1
        ability = 0
        'print handle$
        'buttHandle$ = word$(handle$,2,".")

        'WHAT BUTTON WAS CLICKED AND WHAT ABILITY IS BEING ASSIGNED
        select case handle$
            case "#Assign.Btn1"
                ability = tmpSTR
                #Assign.Btn1, "!disable"
            case "#Assign.Btn2"
                ability = tmpDEX
                #Assign.Btn2, "!disable"
            case "#Assign.Btn3"
                ability = tmpCON
                #Assign.Btn3, "!disable"
            case "#Assign.Btn4"
                ability = tmpINT
                #Assign.Btn4, "!disable"
            case "#Assign.Btn5"
                ability = tmpWIS
                #Assign.Btn5, "!disable"
            case "#Assign.Btn6"
                ability = tmpCHA
                #Assign.Btn6, "!disable"
        end select

        select case assign
            case 1
                str = ability
                #Assign.Tb7, str
            case 2
                dex = ability
                #Assign.Tb8, dex
            case 3
                con = ability
                #Assign.Tb9, con
            case 4
                int = ability
                #Assign.Tb10, int
            case 5
                wis = ability
                #Assign.Tb11, wis
            case 6
                cha = ability
                #Assign.Tb12, cha
        end select

    end sub

'FUNCTION ROLL 4D6
function roll()
    dim rolls(4)
    for j = 1 to 4
        rolls(j) = int(rnd(1) * 6) + 1
    next j

    'BUBBLE SORT THE ARRAY HERE X IS THE LENGTH OF THE ARRAY
    x = 4
    for i = 1 to x
        for j = 1 to (x -1)
            if rolls(j) > rolls(j + 1) then
                temp(j) = rolls(j)
                rolls(j) = rolls(j + 1)
                rolls(j + 1) = temp(j)
            end if
        next j
    next i

    roll = rolls(2) + rolls(3) + rolls(4)

end function

'FUNCTION TAKES CURRENT HP, HITDIE, CONMOD AND CHARACTER LEVEL
function SetHP(CURRHP,HD$,CONMOD$,CHARLVL$)

        count = val(CHARLVL$)
        if count > 1 then count = count - 1
        conHP = createNum(CONMOD$)
        tempHP = 0

        if HD$ = "D6" then maxRoll = 6
        if HD$ = "D8" then maxRoll = 8
        if HD$ = "D10" then maxRoll = 10
        if HD$ = "D12" then maxRoll = 12

        levelOneHP = maxRoll + conHP

        dim hpRolls(count)

        for x = 1 to count
            hpRolls(count) = int(rnd(1) * maxRoll) + 1
        next x

        for j = 1 to count
            tempHP = tempHP + hpRolls(count) + conHP
        next j

        hpTotal= tempHP + levelOneHP

        'IF LEVEL 1 CHARACTER GIVE MAX HP
        if CHARLVL$ = "1" then hpTotal = maxRoll + conHP

        SetHP = 1

end function

function SetAC(ARMORCLASS,DEXMOD$)
    ARMORCLASS = BASEAC

    'TURN STRING MOD INTO NUMBER
    tmpAC = createNum(DEXMOD$)
    tmpSize = createNum(sizeModifier$)

    touchAC = ARMORCLASS + tmpAC
    flatFootedAC = ARMORCLASS
    AC = ARMORCLASS + tmpAC + tmpSize

    SetAC = 1

end function

'LONG FUNCTION NEED TO CHECK EACH CLASS EACH LEVEL 'BAB$ = "" : fortitude$ = "" : reflex$ = "" : will$ = "" : xp = 0
function SetBaseStats$(STRMOD$,DEXMOD$,CONMOD$,WISMOD$,SIZEMOD$,CLASS$,LEVEL$)
    BAB$ = "0"
    tmpStr = createNum(STRMOD$)
    tmpDex = createNum(DEXMOD$)
    tmpCon = createNum(CONMOD$)
    tmpWis = createNum(WISMOD$)
    tmpSize = createNum(SIZEMOD$)
    fortitude$ = "0"
    reflex$ = "0"
    will$ = "0"
    tmpFort = 0
    tmpReflex = 0
    tmpWill = 0

    'BARBARIAN
    if CLASS$ = "Barbarian" then
        select case LEVEL$
            case "1"
                BAB$ = "2" : fortitude$ = "2" : reflex$ = "0" : will$ = "0" : xp = 0
            case "2"
                BAB$ = "3" : fortitude$ = "3" : reflex$ = "0" : will$ = "0" : xp = 2000
            case "3"
                BAB$ = "3" : fortitude$ = "3" : reflex$ = "1" : will$ = "1" : xp = 5000
            case "4"
                BAB$ = "4" : fortitude$ = "4" : reflex$ = "1" : will$ = "1" : xp = 9000
            case "5"
                BAB$ = "4" : fortitude$ = "4" : reflex$ = "1" : will$ = "1" : xp = 15000
        end select
    end if

    'BARD NEED TO FIGURE OUT SPELLS PER DAY
    if CLASS$ = "Bard" then
        select case LEVEL$
            case "1"
                BAB$ = "0" : fortitude$ = "0" : reflex$ = "2" : will$ = "2" : xp = 0
            case "2"
                BAB$ = "1" : fortitude$ = "0" : reflex$ = "3" : will$ = "3" : xp = 2000
            case "3"
                BAB$ = "2" : fortitude$ = "1" : reflex$ = "3" : will$ = "3" : xp = 5000
            case "4"
                BAB$ = "3" : fortitude$ = "1" : reflex$ = "4" : will$ = "4" : xp = 9000
            case "5"
                BAB$ = "3" : fortitude$ = "1" : reflex$ = "4" : will$ = "4" : xp = 15000
        end select
    end if

    'CLERIC
    if CLASS$ = "Cleric" then
        select case LEVEL$
            case "1"
                BAB$ = "0" : fortitude$ = "2" : reflex$ = "0" : will$ = "2" : xp = 0
            case "2"
                BAB$ = "1" : fortitude$ = "3" : reflex$ = "0" : will$ = "3" : xp = 2000
            case "3"
                BAB$ = "2" : fortitude$ = "3" : reflex$ = "1" : will$ = "3" : xp = 5000
            case "4"
                BAB$ = "3" : fortitude$ = "4" : reflex$ = "1" : will$ = "4" : xp = 9000
            case "5"
                BAB$ = "3" : fortitude$ = "4" : reflex$ = "1" : will$ = "4" : xp = 15000
        end select
    end if

    'DRUID
    if CLASS$ = "Druid" then
        select case LEVEL$
            case "1"
                BAB$ = "0" : fortitude$ = "2" : reflex$ = "0" : will$ = "2" : xp = 0
            case "2"
                BAB$ = "1" : fortitude$ = "3" : reflex$ = "0" : will$ = "3" : xp = 2000
            case "3"
                BAB$ = "2" : fortitude$ = "3" : reflex$ = "1" : will$ = "3" : xp = 5000
            case "4"
                BAB$ = "3" : fortitude$ = "4" : reflex$ = "1" : will$ = "4" : xp = 9000
            case "5"
                BAB$ = "3" : fortitude$ = "4" : reflex$ = "1" : will$ = "4" : xp = 15000
        end select
    end if

    'FIGHTER
    if CLASS$ = "Fighter" then
        select case LEVEL$
            case "1"
                BAB$ = "1" : fortitude$ = "2" : reflex$ = "0" : will$ = "0" : xp = 0
            case "2"
                BAB$ = "2" : fortitude$ = "3" : reflex$ = "0" : will$ = "0" : xp = 2000
            case "3"
                BAB$ = "3" : fortitude$ = "3" : reflex$ = "1" : will$ = "1" : xp = 5000
            case "4"
                BAB$ = "4" : fortitude$ = "4" : reflex$ = "1" : will$ = "1" : xp = 9000
            case "5"
                BAB$ = "5" : fortitude$ = "4" : reflex$ = "1" : will$ = "1" : xp = 15000
        end select
    end if

    'MONK
    if CLASS$ = "Monk" then
        select case LEVEL$
            case "1"
                BAB$ = "0" : fortitude$ = "2" : reflex$ = "2" : will$ = "2" : xp = 0
            case "2"
                BAB$ = "1" : fortitude$ = "3" : reflex$ = "3" : will$ = "3" : xp = 2000
            case "3"
                BAB$ = "2" : fortitude$ = "3" : reflex$ = "3" : will$ = "3" : xp = 5000
            case "4"
                BAB$ = "3" : fortitude$ = "4" : reflex$ = "4" : will$ = "4" : xp = 9000
            case "5"
                BAB$ = "3" : fortitude$ = "4" : reflex$ = "4" : will$ = "4" : xp = 15000
        end select
    end if

    'PALADIN
    if CLASS$ = "Paladin" then
        select case LEVEL$
            case "1"
                BAB$ = "1" : fortitude$ = "2" : reflex$ = "0" : will$ = "2" : xp = 0
            case "2"
                BAB$ = "2" : fortitude$ = "3" : reflex$ = "0" : will$ = "3" : xp = 2000
            case "3"
                BAB$ = "3" : fortitude$ = "3" : reflex$ = "1" : will$ = "3" : xp = 5000
            case "4"
                BAB$ = "4" : fortitude$ = "4" : reflex$ = "1" : will$ = "4" : xp = 9000
            case "5"
                BAB$ = "5" : fortitude$ = "4" : reflex$ = "1" : will$ = "4" : xp = 15000
        end select
    end if

    'RANGER
    if CLASS$ = "Ranger" then
        select case LEVEL$
            case "1"
                BAB$ = "1" : fortitude$ = "2" : reflex$ = "2" : will$ = "0" : xp = 0
            case "2"
                BAB$ = "2" : fortitude$ = "3" : reflex$ = "3" : will$ = "0" : xp = 2000
            case "3"
                BAB$ = "3" : fortitude$ = "3" : reflex$ = "3" : will$ = "1" : xp = 5000
            case "4"
                BAB$ = "4" : fortitude$ = "4" : reflex$ = "4" : will$ = "1" : xp = 9000
            case "5"
                BAB$ = "5" : fortitude$ = "4" : reflex$ = "4" : will$ = "1" : xp = 15000
        end select
    end if

    'ROGUE
    if CLASS$ = "Rogue" then
        select case LEVEL$
            case "1"
                BAB$ = "0" : fortitude$ = "0" : reflex$ = "2" : will$ = "0" : xp = 0
            case "2"
                BAB$ = "1" : fortitude$ = "0" : reflex$ = "3" : will$ = "0" : xp = 2000
            case "3"
                BAB$ = "2" : fortitude$ = "1" : reflex$ = "3" : will$ = "1" : xp = 5000
            case "4"
                BAB$ = "3" : fortitude$ = "1" : reflex$ = "4" : will$ = "1" : xp = 9000
            case "5"
                BAB$ = "3" : fortitude$ = "1" : reflex$ = "4" : will$ = "1" : xp = 15000
        end select
    end if

    'SORCERER
    if CLASS$ = "Sorcerer" then
        select case LEVEL$
            case "1"
                BAB$ = "0" : fortitude$ = "0" : reflex$ = "0" : will$ = "2" : xp = 0
            case "2"
                BAB$ = "1" : fortitude$ = "0" : reflex$ = "0" : will$ = "3" : xp = 2000
            case "3"
                BAB$ = "1" : fortitude$ = "1" : reflex$ = "1" : will$ = "3" : xp = 5000
            case "4"
                BAB$ = "2" : fortitude$ = "1" : reflex$ = "1" : will$ = "4" : xp = 9000
            case "5"
                BAB$ = "2" : fortitude$ = "1" : reflex$ = "1" : will$ = "4" : xp = 15000
        end select
    end if

    'WIZARD
    if CLASS$ = "Wizard" then
        select case LEVEL$
            case "1"
                BAB$ = "0" : fortitude$ = "0" : reflex$ = "0" : will$ = "2" : xp = 0
            case "2"
                BAB$ = "1" : fortitude$ = "0" : reflex$ = "0" : will$ = "3" : xp = 2000
            case "3"
                BAB$ = "1" : fortitude$ = "1" : reflex$ = "1" : will$ = "3" : xp = 5000
            case "4"
                BAB$ = "2" : fortitude$ = "1" : reflex$ = "1" : will$ = "4" : xp = 9000
            case "5"
                BAB$ = "2" : fortitude$ = "1" : reflex$ = "1" : will$ = "4" : xp = 15000
        end select
    end if

    'SAVES
    tmpFort = val(fortitude$) + tmpCon
    fortitude$ = str$(tmpFort)

    tmpReflex = val(reflex$) + tmpDex
    reflex$ = str$(tmpReflex)

    tmpWill = val(will$) + tmpWis
    will$ = str$(tmpWill)

    BAB = val(BAB$)
    tmpBAB = BAB + tmpStr + tmpSize
    baseAttackBonus$ = str$(tmpBAB)

    CMB = BAB + tmpStr + tmpSize
    combatManuverBonus$ = str$(CMB)

    CMD = 10 + BAB + tmpStr + tmpDex + tmpSize
    combatManuverDefense$ = str$(CMD)

    SetBaseStats$ = "TRUE"

end function

function SetCarryingCapacity(STR)

    select case STR
        case 1
            lightLoad$ = "3 lbs. or less"
            mediumLoad$ = "4-6 lbs."
            heavyLoad$ = "7-10 lbs."
            maxLoad = 10
        case 2
            lightLoad$ = "6 lbs. or less"
            mediumLoad$ = "7-13 lbs."
            heavyLoad$ = "14-20 lbs."
            maxLoad = 20
        case 3
            lightLoad$ = "10 lbs. or less"
            mediumLoad$ = "11-20 lbs."
            heavyLoad$ = "21-30 lbs."
            maxLoad = 30
        case 4
            lightLoad$ = "13 lbs. or less"
            mediumLoad$ = "14-26 lbs."
            heavyLoad$ = "27-40 lbs."
            maxLoad = 40
        case 5
            lightLoad$ = "16 lbs. or less"
            mediumLoad$ = "17-33 lbs."
            heavyLoad$ = "34-50 lbs."
            maxLoad = 50
        case 6
            lightLoad$ = "20 lbs. or less"
            mediumLoad$ = "21-40 lbs."
            heavyLoad$ = "41-60 lbs."
            maxLoad = 60
        case 7
            lightLoad$ = "23 lbs. or less"
            mediumLoad$ = "24-46 lbs."
            heavyLoad$ = "47-70 lbs."
            maxLoad = 70
        case 8
            lightLoad$ = "26 lbs. or less"
            mediumLoad$ = "27-53 lbs."
            heavyLoad$ = "54-80 lbs."
            maxLoad = 80
        case 9
            lightLoad$ = "30 lbs. or less"
            mediumLoad$ = "31-60 lbs."
            heavyLoad$ = "61-90 lbs."
            maxLoad = 90
        case 10
            lightLoad$ = "33 lbs. or less"
            mediumLoad$ = "34-66 lbs."
            heavyLoad$ = "67-100 lbs."
            maxLoad = 100
        case 11
            lightLoad$ = "38 lbs. or less"
            mediumLoad$ = "39-76 lbs."
            heavyLoad$ = "77-115 lbs."
            maxLoad = 115
        case 12
            lightLoad$ = "43 lbs. or less"
            mediumLoad$ = "44-86 lbs."
            heavyLoad$ = "87-130 lbs."
            maxLoad = 130
        case 13
            lightLoad$ = "50 lbs. or less"
            mediumLoad$ = "51-100 lbs."
            heavyLoad$ = "101-150 lbs."
            maxLoad = 150
        case 14
            lightLoad$ = "58 lbs. or less"
            mediumLoad$ = "59-116 lbs."
            heavyLoad$ = "117-175 lbs."
            maxLoad = 175
        case 15
            lightLoad$ = "66 lbs. or less"
            mediumLoad$ = "67-133 lbs."
            heavyLoad$ = "134-200 lbs."
            maxLoad = 200
        case 16
            lightLoad$ = "76 lbs. or less"
            mediumLoad$ = "77-153 lbs."
            heavyLoad$ = "154-230 lbs."
            maxLoad = 230
        case 17
            lightLoad$ = "86 lbs. or less"
            mediumLoad$ = "87-173 lbs."
            heavyLoad$ = "174-260 lbs."
            maxLoad = 260
        case 18
            lightLoad$ = "100 lbs. or less"
            mediumLoad$ = "101-200 lbs."
            heavyLoad$ = "201-300 lbs."
            maxLoad = 300
        case 19
            lightLoad$ = "116 lbs. or less"
            mediumLoad$ = "117-233 lbs."
            heavyLoad$ = "234-350 lbs."
            maxLoad = 350
        case 20
            lightLoad$ = "133 lbs. or less"
            mediumLoad$ = "134-266 lbs."
            heavyLoad$ = "267-400 lbs."
            maxLoad = 400
        case 21
            lightLoad$ = "153 lbs. or less"
            mediumLoad$ = "154-306 lbs."
            heavyLoad$ = "307-460 lbs."
            maxLoad = 460
        case 22
            lightLoad$ = "173 lbs. or less"
            mediumLoad$ = "174-346 lbs."
            heavyLoad$ = "347-520 lbs."
            maxLoad = 520
        case 23
            lightLoad$ = "200 lbs. or less"
            mediumLoad$ = "201-400 lbs."
            heavyLoad$ = "401-600 lbs."
            maxLoad = 600
        case 24
            lightLoad$ = "233 lbs. or less"
            mediumLoad$ = "234-466 lbs."
            heavyLoad$ = "467-700 lbs."
            maxLoad = 700
        case 25
            lightLoad$ = "266 lbs. or less"
            mediumLoad$ = "267-533 lbs."
            heavyLoad$ = "534-800 lbs."
            maxLoad = 800
        case 26
            lightLoad$ = "306 lbs. or less"
            mediumLoad$ = "307-613 lbs."
            heavyLoad$ = "614-920 lbs."
            maxLoad = 920
        case 27
            lightLoad$ = "346 lbs. or less"
            mediumLoad$ = "347-693 lbs."
            heavyLoad$ = "694-1,040 lbs."
            maxLoad = 1040
        case 28
            lightLoad$ = "400 lbs. or less"
            mediumLoad$ = "401-800 lbs."
            heavyLoad$ = "801-1,200 lbs."
            maxLoad = 1200
        case 29
            lightLoad$ = "466 lbs. or less"
            mediumLoad$ = "467-933 lbs."
            heavyLoad$ = "934-1,400 lbs."
            maxLoad = 1400
    end select

    tmpOG = maxLoad * 2
    tmpPOD = maxLoad * 5

    liftOverHead$ = str$(maxLoad) + " lbs."
    liftOffGround$ = str$(tmpOG) + " lbs."
    pushOrDrag$ = str$(tmpPOD) + " lbs."

    SetCarryingCapacity = 1
end function

'SET STARTING WEALTH
function SetCurrency(CLASS$,LEVEL$)
    if LEVEL$ = "1" then
        select case CLASS$
            case "Barbarian"
                gold = RollD6(3)
            case "Bard"
                gold = RollD6(3)
            case "Cleric"
                gold = RollD6(4)
            case "Druid"
                gold = RollD6(2)
            case "Fighter"
                gold = RollD6(5)
            case "Monk"
                gold = RollD6(1)
            case "Paladin"
                gold = RollD6(5)
            case "Ranger"
                gold = RollD6(5)
            case "Rogue"
                gold = RollD6(4)
            case "Sorcerer"
                gold = RollD6(2)
            case "Wizard"
                gold = RollD6(2)
        end select
    end if

    if LEVEL$ = "2" then gold = 1000
    if LEVEL$ = "3" then gold = 3000
    if LEVEL$ = "4" then gold = 6000
    if LEVEL$ = "5" then gold = 10500
    if LEVEL$ = "6" then gold = 16000
    if LEVEL$ = "7" then gold = 23500
    if LEVEL$ = "8" then gold = 33000
    if LEVEL$ = "9" then gold = 46000
    if LEVEL$ = "10" then gold = 62000
    if LEVEL$ = "11" then gold = 82000
    if LEVEL$ = "12" then gold = 108000
    if LEVEL$ = "13" then gold = 140000
    if LEVEL$ = "14" then gold = 185000
    if LEVEL$ = "15" then gold = 240000
    if LEVEL$ = "16" then gold = 315000
    if LEVEL$ = "17" then gold = 410000
    if LEVEL$ = "18" then gold = 530000
    if LEVEL$ = "19" then gold = 685000
    if LEVEL$ = "20" then gold = 880000
end function

'ROLL LEVEL 1 GOLD
function RollD6(NUMTIMES)
    total = 0

    dim rolls(NUMTIMES)
    for j = 1 to NUMTIMES
        rolls(j) = int(rnd(1) * 6) + 1
    next j

    for i = 1 to NUMTIMES
        total = total + rolls(i)
    next i

    'RETURN THE TOTAL
    RollD6 = total * 10

end function

'SET SKILL RANKS
function SetSkillRanks(RACE$,CLASS$,INTMOD$)
    tmpInt = createNum(INTMOD$)
    select case CLASS$
        case "Barbarian"
            skillRanks = 4 + tmpInt
        case "Bard"
            skillRanks = 6 + tmpInt
        case "Cleric"
            skillRanks = 2 + tmpInt
        case "Druid"
            skillRanks = 4 + tmpInt
        case "Fighter"
            skillRanks = 2 + tmpInt
        case "Monk"
            skillRanks = 4 + tmpInt
        case "Paladin"
            skillRanks = 2 + tmpInt
        case "Ranger"
            skillRanks = 6 + tmpInt
        case "Rogue"
            skillRanks = 8 + tmpInt
        case "Sorcerer"
            skillRanks = 2 + tmpInt
        case "Wizard"
            skillRanks = 2 + tmpInt
    end select

    if CLASS$ = "Human" then skillRanks = skillRanks + 1

    SetSkillRanks = 1
end function

'SET FEATS
function SetFeats(RACE$,LEVEL$)
    select case LEVEL$
        case "1"
            feats = 1
        case "2"
            feats = 1
        case "3"
            feats = 2
        case "4"
        case "5"
            feats = 1
        case "6"
        case "7"
            feats = 1
        case "8"
        case "9"
            feats = 1
        case "10"
        case "11"
            feats = 1
        case "12"
        case "13"
            feats = 1
        case "14"
        case "15"
            feats = 1
        case "16"
        case "17"
            feats = 1
        case "18"
        case "19"
            feats = 1
        case "20"
    end select

    if RACE$ = "Human" then feats = feats + 1

    SetFeats = 1
end function

function SetBonusLanguages(INTMOD$)
    tmpInt = createNum(INTMOD$)
    if tmpInt > 0 then bonusLanguages = tmpInt

    SetBonusLanguages = 1
end function

function createNum(Num$)
    tmpNum = 0
    select case Num$
        case "-5"
            tmpNum = -5
        case "-4"
            tmpNum = -4
        case "-3"
            tmpNum = -3
        case "-2"
            tmpNum = -2
        case "-1"
            tmpNum = -1
        case "+0"
            tmpNum = 0
        case "+1"
            tmpNum = 1
        case "+2"
            tmpNum = 2
        case "+3"
            tmpNum = 3
        case "+4"
            tmpNum = 4
        case "+5"
            tmpNum = 5
    end select
    createNum = tmpNum
end function

'UPDATE ABILITY SCORES FOR SPECIFIC RACES
[UpdateAbilities]
    select case race$
        case "Dwarf"
            con = con + 2
            wis = wis + 2
            cha = cha - 2
        case "Elf"
            dex = dex + 2
            int = int + 2
            con = con - 2
        case "Gnome"
            con = con + 2
            cha = cha + 2
            str = str - 2
        'case "Half-Elf"
        'case "Half-Orc"
        case "Halfling"
            dex = dex + 2
            cha = cha + 2
            str = str - 2
        'case "Human"
    end select

    'UPDATE UI LAST TO SHOW PROPER VALUES
    #Abilities.tbStr, str
    #Abilities.tbDex, dex
    #Abilities.tbCon, con
    #Abilities.tbInt, int
    #Abilities.tbWis, wis
    #Abilities.tbCha, cha
    return

'UPDATE ABILITY MODIFIERS
[UpdateAbilitiesMod]
    #Abilities.tbStrMod, strMod$
    #Abilities.tbDexMod, dexMod$
    #Abilities.tbConMod, conMod$
    #Abilities.tbIntMod, intMod$
    #Abilities.tbWisMod, wisMod$
    #Abilities.tbChaMod, chaMod$
    return

'DISABLE ABILITY UP BUTTONS
[DisableAbilityUpButtons]
    'Need to add check for races
    if race$ = "Half-Elf" or race$ = "Half-Orc" or race$ = "Human" then
        #Abilities.btnStrUp, "!disable"
        #Abilities.btnDexUp, "!disable"
        #Abilities.btnConUp, "!disable"
        #Abilities.btnIntUp, "!disable"
        #Abilities.btnWisUp, "!disable"
        #Abilities.btnChaUp, "!disable"
    end if
    return

'********************************************************************************
'APPLY ABILITY MODIFIERS
'********************************************************************************
[applyModifiers]

    if str >= 2 and str <= 3 then strMod$ = "-4"
    if dex >= 2 and dex <= 3 then dexMod$ = "-4"
    if con >= 2 and con <= 3 then conMod$ = "-4"
    if int >= 2 and int <= 3 then intMod$ = "-4"
    if wis >= 2 and wis <= 3 then wisMod$ = "-4"
    if cha >= 2 and cha <= 3 then chaMod$ = "-4"

    if str >= 4 and str <= 5 then strMod$ = "-3"
    if dex >= 4 and dex <= 5 then dexMod$ = "-3"
    if con >= 4 and con <= 5 then conMod$ = "-3"
    if int >= 4 and int <= 5 then intMod$ = "-3"
    if wis >= 4 and wis <= 5 then wisMod$ = "-3"
    if cha >= 4 and cha <= 5 then chaMod$ = "-3"

    if str >= 6 and str <= 7 then strMod$ = "-2"
    if dex >= 6 and dex <= 7 then dexMod$ = "-2"
    if con >= 6 and con <= 7 then conMod$ = "-2"
    if int >= 6 and int <= 7 then intMod$ = "-2"
    if wis >= 6 and wis <= 7 then wisMod$ = "-2"
    if cha >= 6 and cha <= 7 then chaMod$ = "-2"

    if str >= 8 and str <= 9 then strMod$ = "-1"
    if dex >= 8 and dex <= 9 then dexMod$ = "-1"
    if con >= 8 and con <= 9 then conMod$ = "-1"
    if int >= 8 and int <= 9 then intMod$ = "-1"
    if wis >= 8 and wis <= 9 then wisMod$ = "-1"
    if cha >= 8 and cha <= 9 then chaMod$ = "-1"

    if str >= 10 and str <= 11 then strMod$ = "+0"
    if dex >= 10 and dex <= 11 then dexMod$ = "+0"
    if con >= 10 and con <= 11 then conMod$ = "+0"
    if int >= 10 and int <= 11 then intMod$ = "+0"
    if wis >= 10 and wis <= 11 then wisMod$ = "+0"
    if cha >= 10 and cha <= 11 then chaMod$ = "+0"

    if str >= 12 and str <= 13 then strMod$ = "+1"
    if dex >= 12 and dex <= 13 then dexMod$ = "+1"
    if con >= 12 and con <= 13 then conMod$ = "+1"
    if int >= 12 and int <= 13 then intMod$ = "+1"
    if wis >= 12 and wis <= 13 then wisMod$ = "+1"
    if cha >= 12 and cha <= 13 then chaMod$ = "+1"

    if str >= 14 and str <= 15 then strMod$ = "+2"
    if dex >= 14 and dex <= 15 then dexMod$ = "+2"
    if con >= 14 and con <= 15 then conMod$ = "+2"
    if int >= 14 and int <= 15 then intMod$ = "+2"
    if wis >= 14 and wis <= 15 then wisMod$ = "+2"
    if cha >= 14 and cha <= 15 then chaMod$ = "+2"

    if str >= 16 and str <= 17 then strMod$ = "+3"
    if dex >= 16 and dex <= 17 then dexMod$ = "+3"
    if con >= 16 and con <= 17 then conMod$ = "+3"
    if int >= 16 and int <= 17 then intMod$ = "+3"
    if wis >= 16 and wis <= 17 then wisMod$ = "+3"
    if cha >= 16 and cha <= 17 then chaMod$ = "+3"

    if str >= 18 and str <= 19 then strMod$ = "+4"
    if dex >= 18 and dex <= 19 then dexMod$ = "+4"
    if con >= 18 and con <= 19 then conMod$ = "+4"
    if int >= 18 and int <= 19 then intMod$ = "+4"
    if wis >= 18 and wis <= 19 then wisMod$ = "+4"
    if cha >= 18 and cha <= 19 then chaMod$ = "+4"

    if str >= 20 and str <= 21 then strMod$ = "+5"
    if dex >= 20 and dex <= 21 then dexMod$ = "+5"
    if con >= 20 and con <= 21 then conMod$ = "+5"
    if int >= 20 and int <= 21 then intMod$ = "+5"
    if wis >= 20 and wis <= 21 then wisMod$ = "+5"
    if cha >= 20 and cha <= 21 then chaMod$ = "+5"

    return

'********************************************************************************
'UPDATE ABILITY CLASS CHECKS THIS WILL POPULATE HP, BAB AC ETC...
'********************************************************************************
[ClassChecks]
    'LOCAL VARIABLES WITH VAL AT THE END RETURN TRUE OR 1 WHICH I PLAN ON USEING
    'FOR DEBUGGING PURPOSES

    'HP/DAMAGE-REDUCTION/INITIATIVE
    initiativeTotal$ = dexMod$
    hpVal = SetHP(hpTotal,hitDie$,conMod$,level$)
    'AC/TOUCH/FLAT-FOOTED/SPELL RESISTANCE
    armorVal = SetAC(AC,dexMod$)

    'I WILL SET THE BAB ALONG WITH SAVES AND SPECIALS
    'BAB/CMB/CMD
    'FORT/REFLEX/WILL SAVES
    'FORT/REFLEX/WILL SAVES
    'SPEED/FLY/MANUVERABILITY
    'SWIM/CLIMB/BURROW
    baseStatsVal$ = SetBaseStats$(strMod$,dexMod$,conMod$,wisMod$,sizeModifier$,class$,level$)

    'LOAD-LIGHT/MEDIUM/HEAVY
    'LIFT-OVERHEAD/OFF-GROUND/PUSH-DRAG
    weightsVal = SetCarryingCapacity(str)



    'CALCULATE SKILL RANKS
    skillVal = SetSkillRanks(race$,class$,intMod$)
    'FEATS
    featVal = SetFeats(race$,level$)
    langVal = SetBonusLanguages(intMod$)

    return

'##############################################################################################
'# END FUNCTIONS AND SUBROUTINES FOR TRANSPARENT TEXT                                         #
'##############################################################################################


'Speed

'Your speed tells you how far you can move in a round and still do something,
'such as attack or cast a spell. Your speed depends mostly on your size and your armor.

'Dwarves, gnomes, and halflings have a speed of 20 feet (4 squares), or 15 feet (3 squares)
'when wearing medium or heavy Armor (except for dwarves, who move 20 feet in any armor).

'Humans, elves, half-elves, half-orcs, and most Humanoid Monsters have a speed of 30 feet
'(6 squares), or 20 feet (4 squares) in medium or heavy armor.

'If you use two move actions in a round (sometimes called a "double move" action), you can
'move up to double your speed. If you spend the entire round running, you can move up to
'quadruple your speed (or triple if you are in heavy armor).
