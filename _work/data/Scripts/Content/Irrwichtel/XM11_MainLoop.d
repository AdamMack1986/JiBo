const int XM11_DoSometimes_Delay = 1000;

func void XM11_DoSometimes() {
	/* not every frame (produces annoying print messages in zSpy) */
	Wld_SetTime(00,42);
    
	/* update settings */
    
	/* 1.) XM11_YNavRelativeToWorld;
	 *     rausgeflogen, Idee war, das man Navigation entlang der Y-Achse völlig
	 *     von der Navigation entlang anderer Achsen trennt. Aber das ist wohl weniger intuitiv. */
     
	/* 2.) Mausempfindlichkeit */
    
	if (!Hlp_StrCmp(MEM_GetGothOpt("XM11", "mouseSensitivitySet"), "1")) {
		MEM_SetGothOpt("XM11", "mouseSensitivitySet", "1");
		MEM_SetGothOpt("XM11", "mouseSensitivity", IntToString(XM11_MouseSensitivityDefault));
        
		var int menuItm; menuItm = MEM_GetMenuItemByString("MENUITEM_MAIN_MOUSESENSITIVITY_CHOICE");
		MEM_info("lol");
		MEM_Info(IntToString(menuItm));
	};
    
	var int mouseSensitivity;
	mouseSensitivity = STR_ToInt(MEM_GetGothOpt("XM11", "mouseSensitivity"));
	mouseSensitivity = sqrtf(sqrtf(mkf(1 << mouseSensitivity))); //factor of 1.18 per Value sounds resonable
    
	XM11_CamCursorPixelPerCircle = roundf(divf(mkf(XM11_CamCursorPixelPerCircleBase), mouseSensitivity));
};

func void XM11_MainLoop() {
	var int initDone;
	if (!initDone || MEM_KeyState(KEY_F2) == KEY_PRESSED) {
		if (!initDone) {
			MEM_Call(XMAS11_Startup);
			initDone = true;
		};
        
		XM11_ResetDataStructures();
        
		var int lastFrameTime;
		XM11_FrameTimeMS = 0;
		XM11_FrameTimeF  = FLOATNULL;
		lastFrameTime = MEM_GetSystemTime();
	} else {
		XM11_FrameTimeMS = MEM_GetSystemTime() - lastFrameTime;
		lastFrameTime   += XM11_FrameTimeMS;
		XM11_FrameTimeF  = divf(mkf(XM11_FrameTimeMS), mkf(1000));
	};
    
	XM11_CheckMusic(); /* music changes when in the menu, check it here */
    
	if (!MEM_Game.timeStep) {
		XM11Mov_Camera(); /* hack: Camera can be moved with the arrow keys when in the menu
                           * because the F6 mode allows that. Reset camera here. */
		return; //game is paused!
	};
    
	var int sometimesMSSum;
	sometimesMSSum += XM11_FrameTimeMS;
	if (sometimesMSSum > 0) {
		sometimesMSSum -= XM11_DoSometimes_Delay;
		XM11_DoSometimes();
	};
    
	if (XM11_PlayerDied && XM11_TimeLeftMS && XM11_LivesLeft) {
		if (MEM_KeyState(MOUSE_BUTTONLEFT) == KEY_PRESSED) {
			XM11_LivesLeft -= 1;
			XM11_ResetPlayer();
		};
	};
    
	XM11_ProcessInput();
	XM11_MoveObjects();
	XM11_StepGameLogic();
	XM11_DrawInterface();
};