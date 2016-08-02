func void XM11Intf_CenterView(var zCViewText view) {
	view.posX = 8192 - Print_ToVirtual(Print_GetStringWidth(view.text, FONT_Screen), PS_X);
	view.posX /= 2;
};

func void XM11Intf_AlignRight(var zCViewText view) {
	view.posx = XM11Intf_RightBorder - Print_ToVirtual(Print_GetStringWidth(view.text, FONT_Screen), PS_X);
};

/* eigentlich hat das im Interface wenig zu suchen,
 * aber Highscoreverwaltung passt nirgendwo so richtig rein */
func void XM11Intf_CheckHighscore() {
	if (XM11_TargetsReached > XM11_HighScore) {
		XM11_HighScore = XM11_TargetsReached;
		MEM_SetGothOpt("XM11", "highscore", IntToString(XM11_HighScore));
		MEM_SetGothOpt("XM11", "highscoreHash", IntToString(MEM_GetBufferCRC32(_@(XM11_HighScore), 4)));
        
		Print_Ext(-1 /* center */, XM11Intf_GetY(XM11Intf_NewHighScore_Line), "Neuer Highscore!", FONT_SCREEN, RGBA(255, 255, 255, 255), 5000);
	};
};

func void XM11Intf_DeathMessage() {
	var int deathView;
	if (XM11_PlayerDied && !deathView) {
		deathView = Print_CreateText(FONT_Screen);
		var zCViewText textView; textView = Print_GetText(deathView);
		textView.posY = XM11Intf_GetY(XM11Intf_DeathMessage_Line);
		textView.colored = true;
		textView.color = RGBA(255, 0, 0, 255);
        
		if (XM11_LivesLeft && XM11_TimeLeftMS) {
			textView.text = "Leben verloren! Klicken zum weiterspielen.";
		} else if (XM11_TimeLeftMS) {
			textView.text = "Keine Leben mehr! F2 zum neustarten.";
			XM11Intf_CheckHighscore(); /* gameover, score is final */
		} else {
			textView.text = "Zeit abgelaufen! F2 zum neustarten.";
			XM11Intf_CheckHighscore(); /* gameover, score is final */
		};
        
		XM11Intf_CenterView(textView);
	} else if (deathView && !XM11_PlayerDied) {
		Print_DeleteText(deathView);
		deathView = 0;
	};
};

func void XM11Intf_Time() {
	var int timeView;
	if (!timeView) {
		var zCViewText textView;
		timeView = Print_CreateText(FONT_Screen);
		textView = Print_GetText(timeView);
		textView.posy = Print_ToVirtual(XM11Intf_ClockYTop, PS_Y);
		textView.timed = false;
		textView.colored = true;
		textView.color = arr2Col(_@(XM11Intf_TimeColour), 255);
	} else {
		textView = Print_GetText(timeView);
	};
    
	var string timeStr;
	timeStr = IntToString(XM11_TimeLeftMS / 1000);
	timeStr = ConcatStrings(timeStr, ".");
	timeStr = ConcatStrings(timeStr, IntToString((XM11_TimeLeftMS % 1000) / 100));
    
	textView.text = timeStr;
	XM11Intf_AlignRight(textView);
};

func void XM11Intf_Lives() {
    var int lifeView;
    if (!lifeView) {
        var zCViewText textView;
        lifeView = Print_CreateText(FONT_Screen);
        textView = Print_GetText(lifeView);
        textView.posy = Print_ToVirtual(XM11Intf_LivesYTop, PS_Y);
        textView.timed = false;
        textView.colored = true;
        textView.color = arr2Col(_@(XM11Intf_LiveColour), 255);
    } else {
        textView = Print_GetText(lifeView);
    };
    
    var string livesStr;
    livesStr = ConcatStrings("Leben: ", IntToString(XM11_LivesLeft));
    textView.text = livesStr;
    XM11Intf_AlignRight(textView);
};

func void XM11Intf_Score() {
    var int scoreView;
    if (!scoreView) {
        var zCViewText textView;
        scoreView = Print_CreateText(FONT_Screen);
        textView = Print_GetText(scoreView);
        textView.posy = Print_ToVirtual(XM11Intf_ScoreYTop, PS_Y);
        textView.timed = false;
        textView.colored = true;
        textView.color = arr2Col(_@(XM11Intf_ScoreColour), 255);
    } else {
        textView = Print_GetText(scoreView);
    };
    
    var string scoreStr;
    scoreStr = ConcatStrings("Punkte: ", IntToString(XM11_TargetsReached));
    textView.text = scoreStr;
    XM11Intf_AlignRight(textView);
};

func void XM11Intf_HighScore() {
    var int highScoreView;
    if (!highScoreView) {
        var zCViewText textView;
        highScoreView = Print_CreateText(FONT_Screen);
        textView = Print_GetText(highScoreView);
        textView.posy = Print_ToVirtual(XM11Intf_HighScoreYTop, PS_Y);
        textView.timed = false;
        textView.colored = true;
        textView.color = arr2Col(_@(XM11Intf_ScoreColour), 255);
    } else {
        textView = Print_GetText(highScoreView);
    };
    
    var string hsString;
    hsString = ConcatStrings("Highscore: ", IntToString(XM11_HighScore));
    textView.text = hsString;
    XM11Intf_AlignRight(textView);
};

func void XM11Intf_Targets() {
	var int alphaTime; alphaTime += XM11_FrameTimeMS * XM11Intf_AlphaPerSecond; /* millialpha */
	var int yTime;     yTime     += XM11_FrameTimeMS * XM11Intf_PixelPerSecond; /* millipixel */
    
	var int dAlpha; dAlpha = alphaTime / 1000;
	alphaTime -= dAlpha * 1000;
	var int dy; dy = yTime / 1000;
	yTime     -=  dy * 1000;
    
	var zCArray targets; targets = MEM_PtrToInst(XM11_Targets);
    
	var int i; i = 0;
	var int loop; loop = MEM_StackPos.position;
    
	if (i < targets.numInArray) {
		var CTarget target; target = MEM_PtrToInst(MEM_ReadIntArray(targets.array, i));
        
		/* show and unshow the pfx marker */
		var int bshow; bshow = (target.queuePos != -1) && (target.queuePos < XM11_NumParallelTargets);
		var zCVob targetVob; targetVob = MEM_PtrToInst(target.vob);
		targetVob.bitfield[0] =   (targetVob.bitfield[0] & ~ zCVob_bitfield0_showVisual)
					| (zCVob_bitfield0_showVisual * bShow);
        
		if (target.queuePos == -1 && target.view) {
			/* shown but should not be shown */
			Print_DeleteText(target.view);
			target.view = 0;
		} else if (target.queuePos != -1) {
			/* should be shown */
			if (!target.view) {
				/* not shown but should be shown */
				target.view  = Print_CreateText(FONT_Screen);
				target.py    = XM11Intf_TargetsY + (target.queuePos + 1) * XM11Intf_TargetsYOffset;
				target.alpha = 0;
                
				var zCViewText textView; textView = Print_GetText(target.view);
				textView.posX = XM11Intf_TargetsX;
				textView.text = MEM_ReadString(target.name);
				textView.timed = false;
				textView.colored = true;
			} else {
				textView = Print_GetText(target.view);
			};
            
			/* step the internal data by the discrete time: */
			target.alpha = clamp(target.alpha + dAlpha, 0, 255);
            
			var int YDestination;
			YDestination = XM11Intf_TargetsY + target.queuePos * XM11Intf_TargetsYOffset;
            
			/* careful: evil trap: If a target is reached
			 * but immediately reinserted into the queue its desired y-Position can
			 * increase! In this case, reset the y position to one line above the Destination and alpha to 0! */
			if (target.py < YDestination) {
				target.py = YDestination + XM11Intf_TargetsYOffset;
				target.alpha = 0;
			};
            
			target.py = clamp(target.py - dy, YDestination, target.py); //step upward
			textView.posY = Print_ToVirtual(target.py, PS_Y);
            
			if (target.queuePos < XM11_NumParallelTargets) {
				textView.color = arr2Col(_@(XM11Intf_ActiveColour), target.alpha);
			} else {
				textView.color = arr2Col(_@(XM11Intf_InActiveColour), target.alpha);
			};
		};
        
		i += 1;
		MEM_StackPos.position = loop;
	};
};

func void XM11_DrawInterface() {
	XM11Intf_Targets();
	XM11Intf_Lives();
	XM11Intf_Time();
	XM11Intf_Score();
	XM11Intf_HighScore();
	XM11Intf_DeathMessage();
};

func void XM11Intf_IntroduceLevel(var int level) {
	var string timeStr;
	timeStr = ConcatStrings("Level ", IntToString(level));

	Print_Ext(-1, XM11Intf_GetY(XM11Intf_IntroduceLevel_Line), timeStr, FONT_SCREEN, RGBA(255, 255, 0, 255), 3000);
};

func void XM11Intf_AquireLife() {
	Print_Ext(-1, XM11Intf_GetY(XM11Intf_BonusLife_Line), "+1 Leben", FONT_SCREEN, RGBA(150, 255, 0, 255), 3000);
};

func void XM11Intf_AwardBonusTimeMS(var int ms) {
	var string timeStr;
	timeStr = ConcatStrings("+", IntToString(ms / 1000));
	timeStr = ConcatStrings(timeStr, ".");
	timeStr = ConcatStrings(timeStr, IntToString((ms % 1000) / 100));

	PrintS_Ext(timeStr, RGBA(0, 255, 0, 255));
};