/***********************************\
              INTERFACE
\***********************************/
 
//========================================
// Modifikatoren für PrintS
//========================================
const int PF_PrintX     = 4000;   // X-Koordinate auf dem Screen (0..8192)
const int PF_PrintY     = 3000;  // Minimale Y-Position (0..8192)
const int PF_FadeTime   = 500;   // Zeit zum einblenden/ausblenden der Textzeilen (in ms)
const int PF_MoveYTime  = 3000;   // Zeit in der Y bewegt wird. (Oder so.)
const int PF_WaitTime   = 2000;  // Zeit die gewartet wird, bis wieder ausgeblendet wird (in ms)
const int PF_TextHeight = 2000;   // Abstand zwischen einzelnen Zeilen

const string PF_Font    = "FONT_OLD_20_WHITE.TGA"; //Verwendete Schriftart



//========================================
// Vergangene Zeit seit Systemstart
//========================================
// Danke an Sektenspinner
func int sysGetTime() {
    const int sysGetTimePtr = 5264000; //0x505280;
    CALL__cdecl(sysGetTimePtr);
    return CALL_RetValAsInt();
};

//========================================
// Farbhandling
//========================================
func int RGBA(var int r, var int g, var int b, var int a) {
	if(!r+!g+!b == 3) { r = 1; g = 1; b = 1; };
    return ((r&zCOLOR_CHANNEL)<<zCOLOR_SHIFT_RED)
          |((g&zCOLOR_CHANNEL)<<zCOLOR_SHIFT_GREEN)
          |((b&zCOLOR_CHANNEL)<<zCOLOR_SHIFT_BLUE)
          |((a&zCOLOR_CHANNEL)<<zCOLOR_SHIFT_ALPHA);
};

func int ChangeAlpha(var int zCol, var int a) {
    return ((zCol & ~(zCOLOR_CHANNEL<<zCOLOR_SHIFT_ALPHA)) | ((a&zCOLOR_CHANNEL)<<zCOLOR_SHIFT_ALPHA));
};

func int GetAlpha(var int zCol) {
    return (zCol&(zCOLOR_CHANNEL<<zCOLOR_SHIFT_ALPHA))>>zCOLOR_SHIFT_ALPHA;
};

//========================================
// [intern] Text erstellen (ptr!)
//========================================
func int _Print_CreateText(var string font) {
    PrintScreen("", 0, 0, font, 1);
    var zCView game_text;
    game_text = MEM_PtrToInst(MEM_Game.game_text);
    game_text = MEM_PtrToInst(game_text.next);
    var int node; node = MEM_ReadInt(game_text.textLines_next);
    var zCViewText line; line = MEM_PtrToInst(node);
    line.posx = 0;
    line.posy = 0;
    line.timer = 0;
    line.timed = 0;
    line.color = -1;
    return node;
};

//========================================
// Klasse für PermMem
//========================================
class gCPrint {
    var string fntName;
    var int zCViewTextPtr; // zCViewText*
};

instance gCPrint@(gCPrint);

func void gCPrint_Archiver(var gCPrint p) {
    // G: Struct kann nicht verwendet werden, da ich manuell von der Engine neu bauen lassen muss..
    BW_String(p.fntName);
    BW_Byte(!!p.zCViewTextPtr);
    if(p.zCViewTextPtr) {
        var zCViewText t; t = MEM_PtrToInst(p.zCViewTextPtr);
        BW_String(t.text);
        t.text = "";
        BW_Bytes(p.zCViewTextPtr, 56);
    };
};

func void gCPrint_Unarchiver(var gCPrint p) {
    p.fntName = BR_String();
    if(BR_Byte()) {
        var string nStr; nStr = BR_String();
        var int ptr; ptr = BR_Bytes(56);
        p.zCViewTextPtr = _Print_CreateText(p.fntName);
        var int fontPtr; fontPtr = MEM_ReadInt(p.zCViewTextPtr+22);
        MEM_CopyBytes(ptr, p.zCViewTextPtr, 56);
        MEM_WriteInt(p.zCViewTextPtr+22, fontPtr);
        var zCViewText t; t = MEM_PtrToInst(p.zCViewTextPtr);
        t.text = nStr;
        MEM_Free(ptr);
    };
};

func void gCPrint_Delete(var gCPrint p) {
    var zCViewText line; line = MEM_PtrToInst(p.zCViewTextPtr);
    line.timer = 0;
    line.timed = 1;
};

//========================================
// Text generieren
//========================================
func int Print_CreateText(var string font) {
    var int hndl; hndl = new(gCPrint@);
    var gCPrint p; p = get(hndl);
    p.zCViewTextPtr = _Print_CreateText(font);
    p.fntName = font;
    return hndl;
};

//========================================
// Text als zCViewText erhalten
//========================================
func zCViewText Print_GetText(var int hndl) {
    var gCPrint p; p = get(hndl);
    MEM_PtrToInst(p.zCViewTextPtr);
};

//========================================
// Text löschen
//========================================
func void Print_DeleteText(var int hndl) {
    delete(hndl);
};

//========================================
// Screengröße (in Pixeln)
//========================================
const int PS_X = 0;
const int PS_Y = 1;
var int Print_Screen[2];
func void Print_GetScreenSize() {
    Print_Screen[PS_X] = STR_ToInt(MEM_GetGothOpt("VIDEO", "zVidResFullscreenX"));
    Print_Screen[PS_Y] = STR_ToInt(MEM_GetGothOpt("VIDEO", "zVidResFullscreenY"));
	//Print_Screen[PS_X] = STR_ToInt("1024");
	//Print_Screen[PS_Y] = StR_ToInt("768");
};

//========================================
// Pixel in Virtuelle Koordinaten
//========================================
func int Print_ToVirtual(var int pxl, var int dim) {
    Print_GetScreenSize();
    pxl *= 8192;
    if(dim == PS_X) {
        return pxl / Print_Screen[PS_X];
    };
    return pxl / Print_Screen[PS_Y];
};
func int Print_ToPixel(var int vrt, var int dim) {
    Print_GetScreenSize();
    if(dim == PS_X) {
        vrt *= Print_Screen[PS_X];
    }
    else {
        vrt *= Print_Screen[PS_Y];
    };
    return vrt / 8192;
};

//#################################################
//
//    new functions
//
//#################################################


func int Print_GetFontPtr(var string font) {
    var zCViewText t; t = MEM_PtrToInst(_Print_CreateText(font));
    t.timed = 1;
    t.timer = 0;
    return t.font;
};

 func int Print_GetStringWidth(var string s, var string font) {
    const int zCFont__GetFontX = 7902448; //0x7894F0
	CALL_zStringPtrParam(s);
	CALL__Thiscall(Print_GetFontPtr(font), zCFont__GetFontX);
	return CALL_GetResult();
};

//========================================
// Erweitertes PrintScreen
//========================================
func int Print_Ext(var int x, var int y, var string text, var string font, var int color, var int time) {
    if(time == -1) {
        var int h; h = Print_CreateText(font);
        var gCPrint p; p = get(h);
        var zCViewText line; line = MEM_PtrToInst(p.zCViewTextPtr);
    }
    else {
        h = -1;
        line = MEM_PtrToInst(_Print_CreateText(font));
    };
    
    if (x == -1) {
        x = (8192 - Print_ToVirtual(Print_GetStringWidth(text, font), PS_X)) / 2;
    };
    
    line.text = text;
    line.posx = x;
    line.posy = y;
    line.timer = mkf(time);
    line.timed = (time > -1);
    line.color = color;
    line.colored = (color != 0);
    return h;
};

//========================================
// Erweitertes PrintScreen (pixel)
//========================================
func int Print_ExtPxl(var int x, var int y, var string text, var string font, var int color, var int time) {
    Print_Ext(Print_ToVirtual(x, PS_X), Print_ToVirtual(y, PS_Y), text, font, color, time);
};

//========================================
// Klasse für PermMem
//========================================
class gCPrintS {
    var int alpha;
    var int y;
    var int ptr;
    var int opos;
    var int gpos;
};

func void gCPrintS_Delete(var gCPrintS g) {
    if(Hlp_IsValidHandle(g.ptr)) {
        Print_DeleteText(g.ptr);
    };
    if(Hlp_IsValidHandle(g.alpha)) {
        Anim8_Delete(g.alpha);
    };
    if(Hlp_IsValidHandle(g.y)) {
        Anim8_Delete(g.y);
    };
};

instance gCPrintS@(gCPrintS);

var int PF_List; // zCList<gCPrintS(h)>(h)
const int PF_ListPtr = 0;
var int PF_CPos;
var int PF_Loop;

//========================================
// Softprint
//========================================
func void PrintS_Ext(var string txt, var int color) {
    // Die geballte Macht von PermMem und Anim8!
    if(!PF_List) {
        PF_List = new(zCList@);
        PF_ListPtr = getPtr(PF_List);
    };

    var int alpha; alpha = Anim8_New(1, false);
    Anim8 (alpha, 255, PF_FadeTime,   A8_Constant);
    Anim8q(alpha, 0,   PF_WaitTime,   A8_Wait);
    Anim8q(alpha, 0,   PF_FadeTime*3, A8_SlowStart);

    var int y; y = Anim8_New(PF_PrintY + PF_TextHeight, false);
    Anim8(y, PF_PrintY, PF_MoveYTime, A8_SlowEnd);

    var int h; h = new(gCPrintS@);
    var gCPrintS p; p = get(h);
    p.alpha = alpha;
    p.y = y;
    p.opos = PF_CPos;
    p.gpos = PF_CPos;
    p.ptr = Print_Ext(PF_PrintX, PF_PrintY + PF_TextHeight, txt, PF_Font, color, -1);
    List_Add(PF_ListPtr, h);
    PF_CPos += 1;
    if(!PF_Loop) {
        PF_Loop = 1;
        FF_Apply(_PrintS_Loop);
    };
};
func void AI_PrintS_Ext(var c_npc slf, var string txt, var int color) {
    AI_Function_SI(slf, PrintS_Ext, txt, color);
};

//========================================
// vereinfachter Softprint
//========================================
func void PrintS(var string txt) {
    PrintS_Ext(txt, RGBA(255,255,255,0));
};
func void AI_PrintS(var c_npc slf, var string txt) {
    AI_Function_S(slf, PrintS, txt);
};

//========================================
// [intern] Softprint-Loop
//========================================
func void _PrintS_Loop() {
    PF_ListPtr = getPtr(PF_List);
    var int i; i = 2;
    var int l; l = PF_ListPtr;
    var int p; p = MEM_StackPos.position;
    l = MEM_ReadInt(l+4); // l = (zCList*)l->next
	var int p0; p0 = MEM_StackPos.position;
    if(l) {
        var int c; c = MEM_ReadInt(l);
        if(c) {
            if(!Hlp_IsValidHandle(c)) {
                List_Delete(l, i);
            }
            else {
                var gCPrintS g; g = get(c);
                var zCViewText t; t = Print_GetText(g.ptr);
                t.color = ChangeAlpha(t.color, Anim8_Get(g.alpha));
                if(PF_CPos > g.opos) {
                    g.opos = PF_Cpos;
                    Anim8(g.y, PF_PrintY - PF_TextHeight * (PF_Cpos - g.gpos), PF_MoveYTime, A8_SlowEnd);
                };
                t.posY = Anim8_Get(g.y);
                if(Anim8_Empty(g.alpha)) {
                    delete(c);
					l = MEM_ReadInt(l+4);
                    List_Delete(PF_ListPtr, i);
					MEM_StackPos.position = p0;
                };
            };
        };
		i += 1;
        MEM_StackPos.position = p;
    };
    if(List_Length(PF_ListPtr) <= 1) {
        PF_Loop = 0;
        PF_CPos = 0;
        FF_Remove(_PrintS_Loop);
    };
};


















