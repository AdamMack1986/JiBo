func int XM11Mov_CheckWithinBounds() {
    /* disabled */
    return true;

    if (!XM11_BoundingSpheres) {
        /* non present? */
        return true;
    };
    
    /* Player has to be within at least one boundingball */
    var zCArray arr; arr = MEM_PtrToInst(XM11_BoundingSpheres);
    var int i; i = 0;
    var int loop; loop = MEM_StackPos.position;
    
    if (i < arr.numInArray) {
        var int spherePtr; spherePtr = MEM_ReadIntArray(arr.array, i);
        var zCVobLight sphere; sphere = MEM_PtrToInst(spherePtr);
        
        var int rangeQ; rangeQ = mulf(sphere.range, sphere.range);
        var int distQ; distQ = FLOATNULL;
        
        var int d[3];
        GetPositionWorldVec(spherePtr, _@(d));
        SubFromVec(_@(d), _@(XM11_PivotPos));
        
        /* found sphere I am in range of: */
        if (lf(VecLenQ(_@(d)), rangeQ)) {
            return true;
        };
        
        i += 1;
        MEM_StackPos.position = loop;
    };
    
    return false;
};

func void XM11Mov_Die() {
    var zCVob player;
    player = MEM_PtrToInst(XM11_PivotPtr);
    Wld_PlayEffect("spellFX_Firestorm_SPREAD", player, player, 0, 0, 0, FALSE);
    player.bitfield[0] = player.bitfield[0] & ~ zCVob_bitfield0_showVisual;
    XM11_PlayerDied = true;
};

func void XM11Mov_MovePlayer() {
    if (!XM11_PivotPtr) {
        MEM_Error("Could not find player vob!");
        return;
    };
    
    /* update position */
    var int d[3];
    d[0] = mulf(XM11_FrameTimeF, XM11_PivotVel[0]);
    d[1] = mulf(XM11_FrameTimeF, XM11_PivotVel[1]);
    d[2] = mulf(XM11_FrameTimeF, XM11_PivotVel[2]);
    
    if(TraceRay(_@(XM11_PivotPos), _@(d),
                zTRACERAY_VOB_IGNORE_NO_CD_DYN | zTRACERAY_POLY_TEST_WATER | zTRACERAY_POLY_NORMAL | zTRACERAY_POLY_IGNORE_TRANSP)) {
        MEM_Info(IntToString(MEM_World.foundVob));
        MEM_Info(IntToString(MEM_World.foundPoly));
                
        /* get away from the intersection (with the normal) */
        AddToVec(_@(MEM_World.foundIntersection), _@(MEM_World.foundPolyNormal));
        SetPositionWorldVec(XM11_PivotPtr, _@(MEM_World.foundIntersection));
        
        XM11Mov_Die();
    } else {
        AddToVec(_@(XM11_PivotPos), _@(d));
        SetPositionWorldVec(XM11_PivotPtr, _@(XM11_PivotPos));
        
        if (!XM11Mov_CheckWithinBounds()) {
            XM11Mov_Die();
        };
    };
};

func void XM11Mov_Camera() {
    if(!MEM_Camera.connectedVob) {
        MEM_Error("Could not find and update camera?");
        return;
    };
    
    /* In the case XM11_CamAngleHead == 0 && XM11_CamAngleElev == 0 there is some
     * serious bullshit going down. I have NO idea what it could be. I know:
     * The Matrix (cam.trafoObjToWorld) that I calculate is correct:
     *
     * ( 0 0 1)
     * ( 0 1 0)
     * (-1 0 0)
     *
     * But sometimes (not always!) setting this matrix will unleash hell:
     * -For at least one frame the screen will have a brownish colour.
     * -From this point on every frame will take very long (~1 sec) to render
     * -SetPositionWorldVec will take very long (~1 sec) to complete on the camera vob (why???)
     *
     * This bug is bugging me and my "fix" is an evil hack that
     * seems to work but may not be sufficient (avoids looking along the x-axis,
     * but how do I know this is the only problematic situation?)
     */
    
    if (XM11_CamAngleHead == 0) { XM11_CamAngleHead = fracf(1, 10000); };
    if (XM11_CamAngleElev == 0) { XM11_CamAngleElev = fracf(1, 10000); };
    
    var int ce; var int se;
    var int ch; var int sh;
    zSinCosApprox(XM11_CamAngleHead);
    ch = theCos; sh = theSin;
    zSinCosApprox(XM11_CamAngleElev);
    ce = theCos; se = theSin;
    
    /* set rotation mat */
    var zCVob cam; cam = MEM_PtrToInst(MEM_Camera.connectedVob);
    /* right                           up                                           front */
    cam.trafoObjToWorld[0] = sh;       cam.trafoObjToWorld[1] = mulf(negf(se), ch); cam.trafoObjToWorld[ 2] = mulf(ch, ce); 
    cam.trafoObjToWorld[4] = 0;        cam.trafoObjToWorld[5] = ce;                 cam.trafoObjToWorld[ 6] = se; 
    cam.trafoObjToWorld[8] = negf(ch); cam.trafoObjToWorld[9] = mulf(negf(se), sh); cam.trafoObjToWorld[10] = mulf(sh, ce); 
    
    /* set position */
    var int d[3]; /* - front */
    d[0] = negf(mulf(ce, ch));
    d[1] = negf(se);
    d[2] = negf(mulf(sh, ce));
    ScaleVec(_@(d), mkf(XM11_CamDist + XM11_CamDistToObjects));
    
    if (TraceRay(_@(XM11_PivotPos), _@(d),
                 zTRACERAY_POLY_TEST_WATER | zTRACERAY_VOB_IGNORE_NO_CD_DYN | zTRACERAY_POLY_NORMAL)) {
        /* get away from the intersection (with the normal) */
        ScaleVec(_@(MEM_World.foundPolyNormal), mkf(XM11_CamDistToObjects));
        AddToVec(_@(MEM_World.foundIntersection), _@(MEM_World.foundPolyNormal));
        SetPositionWorldVec(MEM_Camera.connectedVob, _@(MEM_World.foundIntersection));
    } else {
        AddToVec(_@(d), _@(XM11_PivotPos));
        SetPositionWorldVec(MEM_Camera.connectedVob, _@(d));
    };
};

func void XM11_MoveObjects() {
    if (!XM11_PlayerDied) {
        
        XM11Mov_MovePlayer();
    };
    
    //if (XM11_CamAngleElev != 0 && XM11_CamAngleHead != 0) {
        XM11Mov_Camera();
    //};
    
    /*
    MEM_Info(IntToString(roundf(XM11_PivotPos[0])));
    MEM_Info(IntToString(roundf(XM11_PivotPos[1])));
    MEM_Info(IntToString(roundf(XM11_PivotPos[2])));*/
};