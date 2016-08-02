//************************************************
//   Collision
//************************************************

/* Traceray-Flags (e.g. for zCWorld::TraceRayNearestHit)
 * Die Flags die übergeben werden können sollten folgende Bedeutung haben: */
const int zTRACERAY_VOB_IGNORE_NO_CD_DYN	= 1<<0;		//Vobs ohne Kollision ignorieren
const int zTRACERAY_VOB_IGNORE				= 1<<1;		//Alle Vobs ignorieren (nur statisches Mesh beachten)
const int zTRACERAY_VOB_BBOX				= 1<<2;		//Test auf Boundingboxen von Vobs (schneller als "richtiger" Schnitttest)

const int zTRACERAY_STAT_IGNORE				= 1<<4;		//Statische Welt ignorieren (nur Vobs beachten)
const int zTRACERAY_STAT_POLY				= 1<<5;		//Ein Zeiger auf das Schnittpolygon (falls es eines gibt) wird im Tracerayreport abgelegt.
const int zTRACERAY_STAT_PORTALS			= 1<<6;		//Schnitte mit Portalen werden auch als Schnitte gewertet

const int zTRACERAY_POLY_NORMAL				= 1<<7;		//Ermittle auch normale des Schnittpolygons
const int zTRACERAY_POLY_IGNORE_TRANSP		= 1<<8;		//Ignoriere Materialien mit Alphatextur
const int zTRACERAY_POLY_TEST_WATER			= 1<<9;		//Auch Wasser ist ein Schnitt.
const int zTRACERAY_POLY_2SIDED				= 1<<10;	//Kein Backfaceculling
const int zTRACERAY_VOB_IGNORE_CHARACTER	= 1<<11;	//Ignoriere Npcs
const int zTRACERAY_FIRSTHIT				= 1<<12;	//Irgendein Schnittpunkt genügt. Schneller als den nächsten Schnittpunkt ausrechnen.
const int zTRACERAY_VOB_TEST_HELPER_VISUALS	= 1<<13;	//Auch Helpervisuals können getroffen werden
const int zTRACERAY_VOB_IGNORE_PROJECTILES	= 1<<14;    //Ignoriere Projektile

func int TraceRay(var int startVec, var int dirVec, var int flags) {
    const int zCWorld__TraceRayNearestHit = 6429568; //621B80
    
    //int __fastcall (class zVEC3 const &, class zVEC3 const &, class zCArray<class zCVob *> const *, int)
    CALL_IntParam(flags);
    CALL_PtrParam(0); //ignore no vobs
    CALL_PtrParam(dirVec);
    
    CALL__fastcall(MEM_InstGetOffset(MEM_World), startVec, zCWorld__TraceRayNearestHit);
    return CALL_RetValAsInt();
};

//************************************************
//   Clamping:
//************************************************

/* für int und float geeignet */
func int clamp(var int val, var int min, var int max) {
    if (max < min) {
        MEM_Error("clamp: max < min!");
    };
    
    if (val < min) {
        val = min;
    }; if (val > max) {
        val = max;
    };
    return val;
};

//************************************************
//   SetVisual
//************************************************

func void VobSetVisual(var int vobPtr, var string str) {
    const int zCVob__SetVisual = 6301312; //602680
    
    CALL_zStringPtrParam(str);
    CALL__thiscall(vobPtr, zCVob__SetVisual);
};

//************************************************
//   Alpha-Vob Fix
//************************************************

func void MoreAlphaVobs(var int newCount) {
    MEM_InitAll();

    /* This is an alpha vob:
    
    class zCRndAlphaSortObject_Vob {
        var int _vtbl;
        var int nextSortObject; //zCRndAlphaSortObject_Vob*
        var int zvalue;         //zREAL
        var int vob;            //zCVob*
        var int alpha;          //zREAL
    };
    
    */
    const int sizeOf_zCRndAlphaSortObject_Vob = 20;
    const int zCRndAlphaSortObject_Vob__vtbl = 8592292; //0x831BA4
    
    const int newAlphaVobPool = 0; //wird jedes Laden zurückgesetzt
    
    //nur fixen wenn noch nicht gefixt.
    if (!newAlphaVobPool) {
        //neuer Pool der angegebenen Größe
        newAlphaVobPool = MEM_Alloc(sizeOf_zCRndAlphaSortObject_Vob * newCount);
        
        //Neue Liste bauen, dabei _vtbl und vob initialsieren.
        var int i; i = 0;
        var int loop; loop = MEM_StackPos.position;
        if (i < newCount) {
            var int theSortObj; theSortObj = newAlphaVobPool + i * sizeOf_zCRndAlphaSortObject_Vob;
            MEM_WriteInt(theSortObj +  0, zCRndAlphaSortObject_Vob__vtbl);
            MEM_WriteInt(theSortObj + 12, 0);
            i += 1;
            MEM_StackPos.position = loop;
        };
        
        //Vergleichsinstruktion:
        var int ptr; ptr = 5427853; //0x52D28D
        MemoryProtectionOverride(ptr, 4);
        MEM_WriteInt(ptr, newCount);
        
        //Der Indexzugriff
        ptr = 5427979; //0x52D30B
        MemoryProtectionOverride(ptr, 4);
        MEM_WriteInt(ptr, newAlphaVobPool);
        
        //Verschobener Indexzugriff
        ptr = 5427972; //0x52D304
        MemoryProtectionOverride(ptr, 4);
        MEM_WriteInt(ptr, newAlphaVobPool + 12);
    };
};

//************************************************
//   Alpha-Poly Fix
//************************************************

func void MoreAlphaPolys(var int newCount) {
    MEM_InitAll();

    const int sizeOf_zD3D_alphaPoly = 260; //die Teile sind recht groß! Man kriegt nur 4000 pro MB
    const int zD3D_alphaPoly__vtbl = 8631300; //0x83B404
    
    //nur anlegen wenn noch nicht geschehen.
    const int newAlphaPolyPool = 0;
    if (!newAlphaPolyPool) {
        newAlphaPolyPool = MEM_Alloc(sizeOf_zD3D_alphaPoly * newCount);
        
        //Neue Liste bauen (vtbl initialisieren).
        var int i; i = 0;
        var int loop; loop = MEM_StackPos.position;
        if (i < newCount) {
            MEM_WriteInt(newAlphaPolyPool + i * sizeOf_zD3D_alphaPoly, zD3D_alphaPoly__vtbl);
            i += 1;
            MEM_StackPos.position = loop;
        };
        
        //Den Vergleich fixen:
        var int ptr; ptr = 6605188; //0x64C984
        MemoryProtectionOverride(ptr, 4);
        MEM_WriteInt(ptr, newCount - 300); //warning-level (ab hier werden keine neuen Vobs angenommen).
        
        //Noch ein Vergleich
        ptr = 6605201; //0x64C991
        MemoryProtectionOverride(ptr, 4);
        MEM_WriteInt(ptr, newCount); //limit (ab hier: Fehlermeldung)
        
        //Fix XD3D_AlphaBlendPoly
        ptr = 6605403; //0x064CA5B
        
        //lea ebx, [ebx + newAlphaPolyPool]
        MemoryProtectionOverride(ptr, 7);
        MEM_WriteByte(ptr, 141); ptr += 1; //0x8D
        MEM_WriteByte(ptr, 155); ptr += 1; //0x9B
        MEM_WriteInt(ptr, newAlphaPolyPool); ptr += 4;
        MEM_WriteByte(ptr, 144); //0x90 = nop
        
        //Fix AddAlphaPoly
        ptr = 6607092; //0x064D0F4
        //lea ebx, [edx+newAlphaPolyPool
        MemoryProtectionOverride(ptr, 7);
        MEM_WriteByte(ptr, 141); ptr += 1; //0x8D
        MEM_WriteByte(ptr, 154); ptr += 1; //0x9A
        MEM_WriteInt(ptr, newAlphaPolyPool); ptr += 4;
        MEM_WriteByte(ptr, 144); //0x90 = nop
    };
};

//************************************************
//   Weniger Strenger External Test
//************************************************

const int _ExternalAcceptVobsCount = 0;
const int _oCNpcTypeInfo = 8983472;  //0x8913B0
const int _zCVobTypeInfo = 8970208;  //0x88DFE0

func void ExternalAcceptVobs() {
    if (!_ExternalAcceptVobsCount) {
        const int once = 0;
    
        var int ptr; ptr = 7188726; //0x6DB0F6
        if (!once) { MemoryProtectionOverride(ptr, 4); };
        MEM_WriteInt(ptr, _zCVobTypeInfo); //0x88DFE0
        
        ptr = 7188773; //0x6DB125
        if (!once) { MemoryProtectionOverride(ptr, 4); };
        MEM_WriteInt(ptr, _zCVobTypeInfo); //0x88DFE0
        
        once = true;
    };
    
    _ExternalAcceptVobsCount += 1;
};

func void ExternalDenyVobs() {
    _ExternalAcceptVobsCount -= 1;
    
    if (!_ExternalAcceptVobsCount) {
        var int ptr; ptr = 7188726; //0x6DB0F6
        MEM_WriteInt(ptr, _oCNpcTypeInfo); //0x88DFE0
        
        ptr = 7188773; //0x6DB125
        MEM_WriteInt(ptr, _oCNpcTypeInfo); //0x88DFE0
    };
};

//************************************************
//   Set Position of Vob
//************************************************

func void GetPositionWorldVec(var int vobPtr, var int vecPtr) {
    var zCVob vob; vob = MEM_PtrToInst(vobPtr);
    MEM_WriteIntArray(vecPtr, 0, vob.trafoObjToWorld[zCVob_trafoObjToWorld_X]);
    MEM_WriteIntArray(vecPtr, 1, vob.trafoObjToWorld[zCVob_trafoObjToWorld_Y]);
    MEM_WriteIntArray(vecPtr, 2, vob.trafoObjToWorld[zCVob_trafoObjToWorld_Z]);
};

func void SetPositionWorldVec(var int vobPtr, var int vecPtr) {
    const int zCVob_SetPositionWorld = 6404976; //0x61BB70

    CALL_PtrParam(vecPtr);
    CALL__thiscall(vobPtr, zCVob_SetPositionWorld);
};

//Wenn manuell an der Position rumgeschmiert wird, werden Bounding Box usw. nicht angepasst.
//Vobs flackern oder haben Fokusnamen an der falschen Stelle etc.
func void VobPositionUpdated(var int vobPtr) {
    var int pos[3];
    GetPositionWorldVec(vobPtr, _@(pos));
    SetPositionWorldVec(vobPtr, _@(pos));
};

//************************************************
//   Add Vectors
//************************************************

func void AddToVec(var int vec1Ptr, var int vec2Ptr) {
    MEM_WriteInt(vec1Ptr + 0, addf(MEM_ReadInt(vec1Ptr + 0), MEM_ReadInt(vec2Ptr + 0)));
    MEM_WriteInt(vec1Ptr + 4, addf(MEM_ReadInt(vec1Ptr + 4), MEM_ReadInt(vec2Ptr + 4)));
    MEM_WriteInt(vec1Ptr + 8, addf(MEM_ReadInt(vec1Ptr + 8), MEM_ReadInt(vec2Ptr + 8)));
};

func void SubFromVec(var int vec1Ptr, var int vec2Ptr) {
    MEM_WriteInt(vec1Ptr + 0, subf(MEM_ReadInt(vec1Ptr + 0), MEM_ReadInt(vec2Ptr + 0)));
    MEM_WriteInt(vec1Ptr + 4, subf(MEM_ReadInt(vec1Ptr + 4), MEM_ReadInt(vec2Ptr + 4)));
    MEM_WriteInt(vec1Ptr + 8, subf(MEM_ReadInt(vec1Ptr + 8), MEM_ReadInt(vec2Ptr + 8)));
};

func void ScaleVec(var int vec1Ptr, var int fac) {
    MEM_WriteInt(vec1Ptr + 0, mulf(MEM_ReadInt(vec1Ptr + 0), fac));
    MEM_WriteInt(vec1Ptr + 4, mulf(MEM_ReadInt(vec1Ptr + 4), fac));
    MEM_WriteInt(vec1Ptr + 8, mulf(MEM_ReadInt(vec1Ptr + 8), fac));
};

func int VecLenQ(var int vecPtr) {
    var int tmp;
    var int distQ; distQ = FLOATNULL;
    
    tmp = MEM_ReadIntArray(vecPtr, 0); distQ = addf(distQ, mulf(tmp, tmp));
    tmp = MEM_ReadIntArray(vecPtr, 1); distQ = addf(distQ, mulf(tmp, tmp));
    tmp = MEM_ReadIntArray(vecPtr, 2); distQ = addf(distQ, mulf(tmp, tmp));
    return distQ;
};

//************************************************
//   Sinus Cosinus
//************************************************

var int theCos; var int theSin;
func void zSinCosApprox(var int angle) {
    const int zSinCosApprox_Ptr = 6269632; //0x5FAAC0
    const int mem = 0;
    if (!mem) {
        mem = MEM_Alloc(8);
    };
    
    CALL_PtrParam(mem + 4);
    CALL_PtrParam(mem);
    CALL_FloatParam(angle);
    CALL__cdecl(zSinCosApprox_Ptr);
    
    theCos = MEM_ReadInt(mem + 4);
    theSin = MEM_ReadInt(mem);
};
