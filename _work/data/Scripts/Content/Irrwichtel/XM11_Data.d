/* Misc */
    const int XM11_TargetFloatingHeight = 100;
    const string XM11_TargetVisual = "RESURRECTION.PFX";
    const string XM11_PlayerPfx    = "XM11_IRRLICHT.PFX";
    const int XM11_CamDistToObjects = 20;

/* Game status */
    var int   XM11_Level;
    var int   XM11_NumParallelTargets;
    var int   XM11_TargetsReached;
    var int   XM11_MilliSecsPerTargetVal;
    var int   XM11_TimeLeftMS;
    var int   XM11_TargetQueue; //CTarget**
    var int   XM11_LivesLeft;
    var int   XM11_TurboCoolDownLeft;
    var int   XM11_TurboDurationLeft;
    var int   XM11_TurboStripesSpawned;
    
    var int   XM11_Highscore;
    
/* Gameplay Tuning */
    const int XM11_TargetsPerLevel        = 10;
    
    const int XM11_TargetSize             =  100; //cm radius
    const int XM11_MaxNumParallelTargets  =    5; /* ~= max level */
    const int XM11_NumInactiveTargets     =    2; /* for planning ahead */
    const int XM11_StartTimeAwardPercent  =  200; /* percentage of time bonus awarded in the beginning */
    const int XM11_SpeedUpPerLevelPercent =   25;
    const int XM11_StartTime_S            =   60; /* 60 seconds */
    const int XM11_Lives                  =    3;
    const int XM11_TurboSpeed             = 1800; /* cm / s <- speed of the turbo */
    const int XM11_TurboMinSpeed          =  600; /* cm / s <- gotta be at least this fast to start the turbo */
    const int XM11_TurboDuration          = 2000; /* ms */
    const int XM11_TurboCooldown          = 3000; /* ms */
    const int XM11_TurboStripesDelay      =  142; /* interval between colour change */
    
    const int XM11_Acceleration = 700; //cm / s²
    const int XM11_VelFalloff   =  50; //decrease speed by (XM11_VelFalloff/100)% per 10ms.
                                       //this is not equal to XM11_VelFalloff% per sec
                                       //weird unit due to lack of pow/exp.
/* Interface Constants */
    const int XM11Intf_TargetsX       =  30;
    const int XM11Intf_TargetsY       =  30;
    const int XM11Intf_TargetsYOffset =  30;
    const int XM11Intf_AlphaPerSecond = 255; /* one second for fade in */
    const int XM11Intf_PixelPerSecond =  40; /* move up one line per second */
    const int XM11Intf_ClockXRight    = 100; /* pixels from right border */
    const int XM11Intf_ClockYTop      =  10; /* pixels from top border */
    const int XM11Intf_LivesXRight    = 175; /* pixels from right border */
    const int XM11Intf_LivesYTop      =  40; /* pixels from top border */
    const int XM11Intf_ScoreXRight    = 215; /* pixels from right border */
    const int XM11Intf_ScoreYTop      =  70; /* pixels from top border */
    const int XM11Intf_HighscoreXRight= 270; /* pixels from right border */
    const int XM11Intf_HighscoreYTop  = 100; /* pixels from top border */
    
    const int XM11Intf_RightBorder    = 8000;
    
    const int XM11Intf_BaseLine_Y     = 4000;
    const int XM11Intf_LineWidth_Pixel=   30;
    const int XM11Intf_DeathMessage_Line   = 1;
    const int XM11Intf_NewHighScore_Line   = 2;
    const int XM11Intf_BonusLife_Line      = 3;
    const int XM11Intf_IntroduceLevel_Line = 4;
    
    func int XM11Intf_GetY(var int line) { return XM11Intf_BaseLine_Y - line * Print_ToVirtual(XM11Intf_LineWidth_Pixel, PS_Y); };
    
    const int XM11Intf_ActiveColour  [3] = { 100, 255, 100 };
    const int XM11Intf_InActiveColour[3] = { 150, 150, 150 };
    const int XM11Intf_LiveColour    [3] = { 255, 255, 255 };
    const int XM11Intf_TimeColour    [3] = { 255, 255, 255 };
    const int XM11Intf_ScoreColour   [3] = { 255, 255, 255 };
    func int arr2Col(var int arrPtr, var int alpha) { return RGBA(MEM_ReadInt(arrPtr), MEM_ReadInt(arrPtr+4), MEM_ReadInt(arrPtr+8), alpha); };
    
/* Globally interesting miscellaneous variables */
    var int XM11_FrameTimeMS; //ms
    var int XM11_FrameTimeF;  //sec

/* Player and camera state: */
    var int XM11_PivotPtr; //zCVob*
    var int XM11_PivotPos[3]; //cm³
    var int XM11_PivotVel[3]; //(cm/s)³

    var int XM11_CamAngleHead; //rad
    var int XM11_CamAngleElev; //rad

    var int XM11_PlayerDied;
    
/* Settings */
    const int XM11_CamDist = 300; //cm
    const int XM11_CamCursorPixelPerCircleBase = 10000; // this many pixel for 360° on Sensitivity 1
    const int XM11_CamCursorPixelPerCircle = XM11_CamCursorPixelPerCircleBase; //avoid division by zero on first frame
    const int XM11_MouseSensitivityDefault = 9; //Default value in the menu (9 == 10, because 0 is missing)
    const int XM11_YNavRelativeToWorld = 0;

/* Global arrays: */
    const int XM11_BoundingSpheres = 0;
    const int XM11_Targets = 0;

func void XM11_ResetPlayer() {
    /* reset player */
    XM11_PlayerDied = false;
    
    /* recreate player, avoid portal problems (when dying in portals he is sometimes invisible for a short time) */
    if (XM11_PivotPtr) {
        const int oCWorld__RemoveVob = 7864512; //0x7800C0
        CALL_PtrParam(XM11_PivotPtr);
        CALL__thiscall(MEM_Game._zCSession_world, oCWorld__RemoveVob);
    };
    XM11_PivotPtr = MEM_InsertVob(XM11_PlayerPfx, "TOT");
    
    var zCVob player; player = MEM_PtrToInst(XM11_PivotPtr);
    player.bitfield[0] = player.bitfield[0] | zCVob_bitfield0_showVisual;
    
    
    /* reset player speed and pos */
    var int startVobPtr; startVobPtr = MEM_SearchVobByName("XM11_STARTPOINT");
    if (!startVobPtr) {
        MEM_Error("XM11_STARTPOINT not found!");
        return;
    };
    
    GetPositionWorldVec(startVobPtr, _@(XM11_PivotPos));
    
    XM11_CamAngleHead = FLOATNULL;
    XM11_CamAngleElev = FLOATNULL;
    
    XM11_PivotVel[0] = FLOATNULL;
    XM11_PivotVel[1] = FLOATNULL;
    XM11_PivotVel[2] = FLOATNULL;
    
    XM11_TurboCoolDownLeft = 0;
    XM11_TurboDurationLeft = 0; /* important: turbo undefined when respawning! */
};

func void XM11_InitBoundingSpheres() {
    /* calculate bounding spheres */
    var zCArray arr;
    if (XM11_BoundingSpheres) {
        MEM_ArrayFree(XM11_BoundingSpheres);
    };    
    XM11_BoundingSpheres = MEM_SearchAllVobsByName("XM11_BOUNDINGSPHERE");
    arr = MEM_PtrToInst(XM11_BoundingSpheres);
    
    if (!arr.numInArray) {
        MEM_Error("No boundingspheres found!");
        MEM_ArrayFree(XM11_BoundingSpheres);
        XM11_BoundingSpheres = 0;
    };
};

func void XM11_ResetDataStructures() {
    XM11_ResetPlayer();
    XM11_InitBoundingSpheres();
    MEM_Call(XM11Trg_InitTargets);
};