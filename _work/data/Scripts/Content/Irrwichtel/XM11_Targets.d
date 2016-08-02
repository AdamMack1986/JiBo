/* get the properties of the targets.
 * currently only the name but there may be
 * more data nessessary */

class CTarget {
    var int timeBonus; //
    var int name;      //zString*
    var int queuePos;  //-1 für invalid
    var int vob;       //zCVob*
    var int view;      //zCViewText Handle
    var int py;        //current printing position
    var int alpha;     //current printing alpha
    var int present;   //zCVob* present lying there (will be deleted when target reenters the queue)
};

const int sizeof_CTarget = 8;

//************************************************
//   Init
//************************************************

func void XM11Trg_InitTargets() {
    /* reset score and level */
    XM11_NumParallelTargets    =    1;
    XM11_TargetsReached        =    0;
    XM11_Level                 =    1;
    XM11_MilliSecsPerTargetVal = 1000 * XM11_StartTimeAwardPercent / 100;
    XM11_TimeLeftMS            = XM11_StartTime_S * 1000;
    XM11_LivesLeft             = XM11_Lives;
    
    if (XM11_TargetQueue) { 
        MEM_Free(XM11_TargetQueue);
    };
    XM11_TargetQueue = MEM_Alloc(4 * (XM11_NumInactiveTargets + XM11_MaxNumParallelTargets));
    
    /* recreate all targets */
    if (XM11_Targets) {
        MEM_ArrayFree(XM11_Targets);
    };
    XM11_Targets = MEM_ArrayCreate();
    
    /* targets are marked in the ZEN with special Vobs
     * additional information is required in the script. */
    var int targetVobsArrPtr; targetVobsArrPtr = MEM_SearchAllVobsByName("XM11_TARGET");
    
    /* print target count */
    var zCArray targetVobs; targetVobs = MEM_PtrToInst(targetVobsArrPtr);
    if (!targetVobs.numInArray) {
        MEM_Error("No targets found!");
    } else {     
        var string s;
        s = IntToString(targetVobs.numInArray);
        s = ConcatStrings(s, " targets found.");
        MEM_Info(s);
    };
    
    /* foreach of the Vobs create the target */
    var int i; i = 0;
    var int loop; loop = MEM_StackPos.position;
    
    if (i < targetVobs.numInArray) {
        /* create the appropriate CTarget */
        var int targetVobPtr; var oCMob targetVob;
        targetVobPtr    = MEM_ReadIntArray(targetVobs.array, i);
        targetVob       = MEM_PtrToInst(targetVobPtr);
        
        if (!MEM_FindParserSymbol(targetVob.name)) {
            MEM_Error(ConcatStrings("Unknown Target: ", targetVob.name));
            i += 1;
            MEM_StackPos.position = loop;
        };
        
        /* this is supposed to initialise a CTarget and return its address */
        MEM_CallByString(targetVob.name);
        var int newTargetPtr; newTargetPtr = MEM_PopIntResult();
        
        var CTarget newTarget; newTarget = MEM_PtrToInst(newTargetPtr);
        newTarget.vob = targetVobPtr;
        MEM_ArrayInsert(XM11_Targets, newTargetPtr);
        
        /* set visual of TargetVob */
        VobSetVisual(targetVobPtr, XM11_TargetVisual);
        
        /* adjust height of TargetVob above ground */
        var int pos[3]; GetPositionWorldVec(targetVobPtr, _@(pos));
        var int ray[3]; ray[0] = 0; ray[2] = 0; ray[1] = mkf(-300);
        
        if (TraceRay(_@(pos), _@(ray), zTRACERAY_VOB_IGNORE_NO_CD_DYN)) {
            var int newY;
            newY = addf(mkf(XM11_TargetFloatingHeight), MEM_World.foundIntersection[1]);
            targetVob._zCVob_trafoObjToWorld[zCVob_trafoObjToWorld_Y] = newY;
            
             /* dont change the order here! the engine might cast  rays! */
            /* move present to location */
            SetPositionWorldVec(newTarget.present, _@(MEM_World.foundIntersection));
        
            /* and the vob is also updated */
            VobPositionUpdated(targetVobPtr);
        };
        
        i += 1;
        MEM_StackPos.position = loop;
    };
    
    MEM_ArrayFree(targetVobsArrPtr);
    targetVobsArrPtr = 0;
    
    /* fill the queue */
    MEM_Call(XM11Trg_FillQueue);
};

/* Hack: Don't insert this into the queue. Used to avoid reinserting
   of targets that were just reached */
var int XM11Trg_Avoid;

func int XM11Trg_GetNewTarget() {
    var zCArray arr; arr = MEM_PtrToInst(XM11_Targets);
    
    if (arr.numInArray < XM11_NumInactiveTargets + XM11_NumParallelTargets) {
        MEM_Error("XM11_GetNewTarget: Help, I'm trapped in an endless loop! (Not enough targets to fill queue.)");
    };
    
    var int loop; loop = MEM_StackPos.position;
    var int targetID;  targetID  = Hlp_Random(arr.numInArray);
    var int targetPtr; targetPtr = MEM_ReadIntArray(arr.array, targetID);
    var CTarget target; target = MEM_PtrToInst(targetPtr);
    
    if (target.queuePos == -1 && targetPtr != XM11Trg_Avoid) { //not in use
        /* make visible: */
        var zCVob targetVob; targetVob = MEM_PtrToInst(target.vob);
        targetVob.bitfield[0] = targetVob.bitfield[0] | zCVob_bitfield0_showVisual;
    
        return targetPtr;
    };
    
    MEM_StackPos.position = loop;
};

func void XM11Trg_FillQueue() {
    var int writeIndex; writeIndex = 0;
    var int readIndex;  readIndex  = 0;
    var int queuesize; queueSize = XM11_NumInactiveTargets + XM11_NumParallelTargets;
    var int loop; loop = MEM_StackPos.position;
    
    if (readIndex < queuesize) {
        var int targetPtr;
        targetPtr = MEM_ReadIntArray(XM11_TargetQueue, readIndex);
        
        /* there has never been an entry here; skip */
        if (!targetPtr) {
            readIndex += 1;
            MEM_StackPos.position = loop;
        };
        
        var CTarget target; target = MEM_PtrToInst(targetPtr);
        if (target.queuePos != -1) {
            /* valid, shift it upward in the queue */
            target.queuePos = writeIndex;
            MEM_WriteIntArray(XM11_TargetQueue, writeIndex, targetPtr);
            readIndex += 1;
            writeIndex += 1;
            MEM_StackPos.position = loop;
        } else {
            /* some target has become invalid, skip it */
            readIndex += 1;
            MEM_StackPos.position = loop;
        };
    } else if (writeIndex < queueSize) {
        /* reached end of queue, but it is not full.
         * create new Targets! */
        targetPtr       = XM11Trg_GetNewTarget();
        target          = MEM_PtrToInst(targetPtr);
        target.queuePos = writeIndex;
        
        /* hide presents on locations I am supposed to deliver presents to! */
        var zCVob present; present = MEM_PtrToInst(target.present);
        present.bitfield[0] = present.bitfield[0] & ~ zCVob_bitfield0_showVisual;
        
        MEM_WriteIntArray(XM11_TargetQueue, writeIndex, targetPtr);
        writeIndex += 1;
        MEM_StackPos.position = loop;
    };
};

func void XM11Trg_TargetReached(var CTarget target) {
    /* time Bonus: */
    var int BonusTime;
    BonusTime = target.timeBonus * XM11_MilliSecsPerTargetVal;
    XM11_TimeLeftMS += BonusTime;
    
    MEM_PushIntParam(BonusTime);
    MEM_Call(XM11Intf_AwardBonusTimeMS);
    
    /* new Level? */
    Snd_Play("GELDBEUTEL");
    XM11_TargetsReached += 1;
    
    if (XM11_TargetsReached >= XM11_Level * XM11_TargetsPerLevel) {
        XM11_Level += 1;
        Snd_Play("LEVELUP");
        
        MEM_PushIntParam(XM11_Level);
        MEM_Call(XM11Intf_IntroduceLevel);
        MEM_Call(XM11Intf_AquireLife);
        XM11_LivesLeft += 1;
        
        XM11_NumParallelTargets = clamp(XM11_Level, 1, XM11_MaxNumParallelTargets);
        
        /* targets are now worth less */
        XM11_MilliSecsPerTargetVal  = XM11_MilliSecsPerTargetVal * (100 - XM11_SpeedUpPerLevelPercent);
        XM11_MilliSecsPerTargetVal /= 100;
    };
    
    target.queuePos = -1; //take out of queue.
    
    /* show present */
    var zCVob present; present = MEM_PtrToInst(target.present);
    present.bitfield[0] = present.bitfield[0] | zCVob_bitfield0_showVisual;
    Wld_PlayEffect("XM11_PRESENTSPAWNED", present, present, 0, 0, 0, FALSE);
    
    XM11Trg_Avoid = MEM_InstToPtr(target); /* do not reinsert this into the queue... */
    XM11Trg_FillQueue(); //refill queue
    XM11Trg_Avoid = 0;
};

func void XM11Trg_CheckTargets() {
    var int i; i = 0;
    var int loop; loop = MEM_StackPos.position;
    
    if (i < XM11_NumParallelTargets) {
        var int targetPtr; targetPtr = MEM_ReadIntArray(XM11_TargetQueue, i);
        var CTarget target; target = MEM_PtrToInst(targetPtr);
        
        var int d[3];
        GetPositionWorldVec(target.vob, _@(d));
        SubFromVec(_@(d), _@(XM11_PivotPos));
        
        var int lenQ; lenQ = VecLenQ(_@(d));
        lenQ = roundf(lenQ);
        
        if (lenQ < XM11_TargetSize * XM11_TargetSize) {
            XM11Trg_TargetReached(target);
            /* assume only one target can be reached per frame.
             * no need to think about newly inserted targets */
            return;
        };
        
        i += 1;
        MEM_StackPos.position = loop;
    };
};

func void XM11_StepGameLogic() {
    if (XM11_PlayerDied) {
        return;
    };
    
    /* Step clock */
    
    XM11_TimeLeftMS -= XM11_FrameTimeMS;
    
    if (XM11_TimeLeftMS < 0) {
        XM11_TimeLeftMS = 0; //dont print negative numbers
        MEM_Call(XM11Mov_Die); //kill the player
        return;
    };
    
    /* check targets */
    XM11Trg_CheckTargets();
};

//************************************************
//   Build all the targets:
//************************************************

func int XM11_FillTarget(var int targetPtr, var int timeBonus, var int name, var string visual) {
    var CTarget target;
    target = MEM_PtrToInst(targetPtr);
    target.timeBonus = timeBonus;
    target.name      = name;
    target.queuePos  = -1; //default: not in queue, important for display
    target.vob       = 0;
    
    if (target.view) {
        Print_DeleteText(target.view);
    };
    target.view      = 0;
    
    if (!target.present) {
        target.present   = MEM_InsertVob(visual, "TOT");
    };
    
    var zCVob presentVob; presentVob = MEM_PtrToInst(target.present);
    presentVob.bitfield[0] = presentVob.bitfield[0] & ~ (zCVob_bitfield0_collDetectionDynamic | zCVob_bitfield0_collDetectionStatic | zCVob_bitfield0_showVisual);
    
    return targetPtr;
};

/* bluish present (texture not that nice...) */
func int CONSTANTINO   () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 10, MEM_GetStringAddress("Constantino")       , "XM11_PRESENT01.3DS"); };
func int IGNAZ         () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 10, MEM_GetStringAddress("Ignaz")             , "XM11_PRESENT01.3DS"); };
func int SKIP          () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 15, MEM_GetStringAddress("Skip (Strand)")     , "XM11_PRESENT01.3DS"); };

/* Present with ice-like texture */
func int VATRAS        () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 10, MEM_GetStringAddress("Vatras")            , "XM11_PRESENT02.3DS"); };
func int ANDRE         () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 20, MEM_GetStringAddress("Lord Hagen")        , "XM11_PRESENT02.3DS"); };

/* beautiful, fancy present */
func int NADJA         () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 30, MEM_GetStringAddress("Nadja (Zimmer)")    , "XM11_PRESENT03.3DS"); };
func int HEROLD        () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 10, MEM_GetStringAddress("Herold")            , "XM11_PRESENT03.3DS"); };
func int GERBRANDT     () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 10, MEM_GetStringAddress("Herr Gerbrandt")    , "XM11_PRESENT03.3DS"); };
func int LUTERO        () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 10, MEM_GetStringAddress("Lutero")            , "XM11_PRESENT03.3DS"); };
func int ABUYIN        () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 10, MEM_GetStringAddress("Abuyin")            , "XM11_PRESENT03.3DS"); };

/* Nice, simple present */
func int HANNA         () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 12, MEM_GetStringAddress("Hanna")             , "XM11_PRESENT04.3DS"); };
func int JOE           () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 10, MEM_GetStringAddress("Joe (Turm)")        , "XM11_PRESENT04.3DS"); };
func int MATTEO        () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 10, MEM_GetStringAddress("Matteo")            , "XM11_PRESENT04.3DS"); };
func int CORAGON       () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 10, MEM_GetStringAddress("Coragon")           , "XM11_PRESENT04.3DS"); };

/* Good ol' black wrapping */
func int JORA          () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 13, MEM_GetStringAddress("Jora")              , "XM11_PRESENT05.3DS"); };
func int WULFGAR       () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 13, MEM_GetStringAddress("Wulfgar")           , "XM11_PRESENT05.3DS"); };
func int FELLAN        () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 10, MEM_GetStringAddress("Fellan")            , "XM11_PRESENT05.3DS"); };
func int ALRIK         () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 10, MEM_GetStringAddress("Alrik (Kampfplatz)"), "XM11_PRESENT05.3DS"); };
func int HALVOR        () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 10, MEM_GetStringAddress("Halvor")            , "XM11_PRESENT05.3DS"); };
func int LARES         () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf),  8, MEM_GetStringAddress("Lares")             , "XM11_PRESENT06.3DS"); };

/* Brownish paper, take it for craftsmen */
func int HAKON         () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 12, MEM_GetStringAddress("Harad")             , "XM11_PRESENT06.3DS"); };
func int BOSPER        () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 10, MEM_GetStringAddress("Bosper")            , "XM11_PRESENT06.3DS"); };
func int MATTEO_LAGER  () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 12, MEM_GetStringAddress("Matteo (Lager)")    , "XM11_PRESENT06.3DS"); };
func int GAERTNER      () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 12, MEM_GetStringAddress("Gärtner")           , "XM11_PRESENT06.3DS"); };
func int KARDIF        () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 10, MEM_GetStringAddress("Kardif")            , "XM11_PRESENT06.3DS"); };
func int THORBEN       () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 10, MEM_GetStringAddress("Thorben")           , "XM11_PRESENT06.3DS"); };

/* evil wrapping for evil guys */
func int CANTHAR       () { var int buf[sizeof_CTarget]; return XM11_FillTarget(_@(buf), 25, MEM_GetStringAddress("Canthar (Knast)")   , "XM11_present_canthar.3ds"); };