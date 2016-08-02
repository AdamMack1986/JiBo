func void XM11Ctrl_ProcessMouse() {
    /* read and reset */
    var int dx; var int dy;
    
    var _Cursor cursor; cursor = MEM_PtrToInst(_Cursor_Ptr);
    dx = -cursor.relX;
    dy = -cursor.relY;
    
    var int PI2; if(!PI2) { PI2 = mulf(mkf(2), PI); };
    
    var int turn;
    /* how many turns? */
    turn = divf(mkf(dx), mkf(XM11_CamCursorPixelPerCircle));
    /* how much is this in rad? */
    turn = mulf(turn, PI2);
    /* apply change */
    XM11_CamAngleHead = addf(XM11_CamAngleHead, turn);
    
    if (XM11_CamAngleHead <   0) { XM11_CamAngleHead = addf(XM11_CamAngleHead, PI2); };
    if (XM11_CamAngleHead > PI2) { XM11_CamAngleHead = subf(XM11_CamAngleHead, PI2); };
    
    var int up;
    up = divf(mkf(dy), mkf(XM11_CamCursorPixelPerCircle));
    /* how much is this in rad? */
    up = mulf(up, PI2);
    /* apply change */
    XM11_CamAngleElev = addf(XM11_CamAngleElev, up);
    
    var int PIhalf; PIhalf = divf(PI2, mkf(4));
    
    /* clamp the angle */
    if (gf(XM11_CamAngleElev,      PIhalf )) { XM11_CamAngleElev =      PIhalf ; };
    if (lf(XM11_CamAngleElev, negf(PIhalf))) { XM11_CamAngleElev = negf(PIhalf); };
};

func void XM11Ctrl_ApplyAcceleration() {
    var int frontX; var int frontY; var int frontZ;
    var int leftX; var int leftZ;
    var int upX; var int upY; var int upZ;
    
    /* wo ist "nach vorne", "links" und "oben"? */
    var int ce; var int se;
    var int ch; var int sh;
    zSinCosApprox(XM11_CamAngleHead);
    ch = theCos; sh = theSin;
    zSinCosApprox(XM11_CamAngleElev);
    ce = theCos; se = theSin;
    
    if (!XM11_YNavRelativeToWorld) {
        frontX = mulf(ch, ce);   leftX  = negf(sh);  upX    = mulf(negf(se), ch);
        frontY = se;                                 upY    = ce;
        frontZ = mulf(sh, ce);   leftZ  = ch;        upZ    = mulf(negf(se), sh);
    } else {
        /* up is always up and not relative to the camera elev angle */
        frontX = ch;   leftX  = negf(sh);  upX    = 0;
        frontY = se;                       upY    = FLOATEINS;
        frontZ = sh;   leftZ  = ch;        upZ    = 0;
    };
    
    var int toFront; var int toLeft; var int toUp;
    toFront = 0; toLeft = 0; toUp = 0;
    
    if (MEM_KeyPressed(KEY_W))      { toFront += 1; };
    if (MEM_KeyPressed(KEY_A))      { toLeft  += 1; };
    if (MEM_KeyPressed(KEY_S))      { toFront -= 1; };
    if (MEM_KeyPressed(KEY_D))      { toLeft  -= 1; };
    if (MEM_KeyPressed(KEY_SPACE))  { toUp    += 1; };
    if (MEM_KeyPressed(KEY_LSHIFT)) { toUp    -= 1; };
    
    var int total;
    total = (toFront != 0) + (toLeft != 0) + (toUp != 0);
    
    if (!total) {
        return;
    };
    
    var int accFactor;
    accFactor = mkf(XM11_FrameTimeMS * XM11_Acceleration);
    accFactor = divf(accFactor, mkf(1000)); //ms -> sec
    accFactor = divf(accFactor, sqrtf(mkf(total))); //not faster when pressing two keys!
    
    toFront = mulf(accFactor, mkf(toFront));
    toLeft  = mulf(accFactor, mkf(toLeft));
    toUp    = mulf(accFactor, mkf(toUp));
    
    var int acc[3];
    acc[0] = addf(addf(mulf(toFront, frontX), mulf(toLeft, leftX)), mulf(toUp, upX));
    acc[1] = addf(mulf(toUp, upY), mulf(toFront, frontY));
    acc[2] = addf(addf(mulf(toFront, frontZ), mulf(toLeft, leftZ)), mulf(toUp, upZ));
    
    /* update velocity */
    AddToVec(_@(XM11_PivotVel), _@(acc));
};

func void XM11Ctrl_ApplyVelocityFalloff() {
    /* velocity falloff
     * Normally one would want to implement exponential falloff here.
     * But there is no exp / pow function working with doubles
     * and I am to lazy to implement one. Instead we will have
     * the velocity drop by some constant factor every 10ms. */
    
    //time we have to brake for:
    var int brakeMS; brakeMS += XM11_FrameTimeMS;
    //factor per brakeing iteration:
    var int brakeFacIter;
    if (!brakeFacIter) {
        brakeFacIter = divf(mkf(XM11_VelFalloff), mkf(100 * 100));
        brakeFacIter = subf(FLOATEINS, brakeFacIter);
    };
    
    var int brakeFac; brakeFac = FLOATEINS;
    var int loop; loop = MEM_StackPos.position;
    
    if (brakeMS >= 10) {
        brakeFac = mulf(brakeFac, brakeFacIter);
        brakeMS -= 10;
        MEM_StackPos.position = loop;
    };
    
    ScaleVec(_@(XM11_PivotVel), brakeFac);
};

func void XM11Ctrl_ApplyTurbo() {
    XM11_TurboDurationLeft = clamp(XM11_TurboDurationLeft - XM11_FrameTimeMS, 0, XM11_TurboDurationLeft);
    XM11_TurboCoolDownLeft = clamp(XM11_TurboCoolDownLeft - XM11_FrameTimeMS, 0, XM11_TurboCoolDownLeft);
    
    /* invocation detection */
    if (!XM11_TurboCoolDownLeft) && (MEM_KeyState(MOUSE_BUTTONLEFT) == KEY_PRESSED) {
        var int lenQ; lenQ = VecLenQ(_@(XM11_PivotVel));
        
        /* fast enough to start Turbo? */
        if (roundf(lenQ) > XM11_TurboMinSpeed * XM11_TurboMinSpeed) {
            XM11_TurboCoolDownLeft = XM11_TurboCooldown;
            XM11_TurboDurationLeft = XM11_TurboDuration;
            
            /* three things: 
                * rainbow trail
                * nyan cat music
                * MFX_FIRESTORM_COLLIDE as "ignition sound" */
            
            /* 1 */
            XM11_TurboStripesSpawned = 0;
            
            /* 2 */
            Snd_Play("XM11_NYANNYANNYAN");
            
            /* 3 */
            Snd_Play("MFX_FIRESTORM_COLLIDE");
        };
    };
    
    /* stripes */
    if (XM11_TurboDurationLeft) {
        if ((XM11_TurboDuration - XM11_TurboDurationLeft) / XM11_TurboStripesDelay >= XM11_TurboStripesSpawned) {
            var string effect; effect = ConcatStrings("XM11_RAINBOWTRAIL_", IntToString(XM11_TurboStripesSpawned % 6));
            
            var zCVob player;
            player = MEM_PtrToInst(XM11_PivotPtr);
            
            Wld_PlayEffect(effect, player, player, 0, 0, 0, FALSE);
            
            XM11_TurboStripesSpawned += 1;
        };
    };
    
    /* actual physical effect */
    if (XM11_TurboDurationLeft) {
        lenQ = VecLenQ(_@(XM11_PivotVel));
        
        if (lenQ == FLOATNULL) {
            MEM_Warn("XM11Ctrl_ApplyTurbo: Velocity was null?!");
            XM11_TurboDurationLeft = 0;
            return;
        };
        
        var int fac; fac = invf(sqrtf(lenQ));
        fac = mulf(fac, mkf(XM11_TurboSpeed));
        ScaleVec(_@(XM11_PivotVel), fac);
    };
};

func void XM11Ctrl_CameraDistanceKeys() {
    if (MEM_KeyState(KEY_ADD)      == KEY_PRESSED) { XM11_CamDist = XM11_CamDist * 4 / 3; };
    if (MEM_KeyState(KEY_SUBTRACT) == KEY_PRESSED) { XM11_CamDist = XM11_CamDist * 3 / 4; };
    XM11_CamDist = clamp(XM11_CamDist, 50, 1500);
};

func void XM11_ProcessInput() {
    XM11Ctrl_ProcessMouse();
    
    if (!XM11_PlayerDied) {
        XM11Ctrl_ApplyAcceleration();
        XM11Ctrl_ApplyVelocityFalloff();
        XM11Ctrl_ApplyTurbo();
    };
    
    XM11Ctrl_CameraDistanceKeys();
};