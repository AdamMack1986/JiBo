/***********************************\
                VIEW
\***********************************/

//========================================
// Klassen für PermMem
//========================================
class gCView {
	var string tex;
	var int open;
	var int zCViewPtr; // zCView*
};

instance gCView@(gCView){};

func void gCView_Archiver(var gCView v) {
	BW_String(v.tex);
	BW_Byte(v.open);
	// Alles so reinknallen wie es ist
	if(v.zCViewPtr) {
		BW_Byte(1);
		BW_Bytes(v.zCViewPtr, 256);
	}
	else {
		BW_Byte(0);
	};
};

func void gCView_Unarchiver(var gCView v) {
	v.tex = BR_String();
	v.open = BR_Byte();
	// Das ist etwas anspruchsvoller.
	// Der View muss von der Engine neu erzeugt werden, trotzdem sollen so viele Einstellungen wie möglich erhalten bleiben.
	// Bei Pointern wird das nicht möglich sein, deshalb nutze ich die die der Konstruktor reinschmiert.
	if(!BR_Byte()) { return; };
	var int newView; newView = MEM_Alloc(256);
	v.zCViewPtr = BR_Bytes(256);
	CALL_IntParam(2);
	CALL_IntParam(8192);
	CALL_IntParam(8192);
	CALL_IntParam(0);
	CALL_IntParam(0);
	CALL__thiscall(newView, zCView__zCView);
	CALL__thiscall(newView, zCView__Open);
	// Jetzt selektiv rüberkopieren was geht:
	MEM_CopyBytes(v.zCViewPtr +  20, newView +  20, 4 *  6);
	MEM_CopyBytes(v.zCViewPtr +  68, newView +  68, 4 *  8);
	MEM_CopyBytes(v.zCViewPtr + 104, newView + 104, 4 *  7);
	MEM_CopyBytes(v.zCViewPtr + 140, newView + 140, 4 * 25);
	MEM_Free(v.zCViewPtr);
	v.zCViewPtr = newView;
	CALL__thiscall(v.zCViewPtr, zCView__Close);
	if(STR_Len(v.tex)) {
		CALL_zStringPtrParam(v.tex);
		CALL__thiscall(v.zCViewPtr, zCView__InsertBack);
	};
	if(v.open) {
		CALL__thiscall(v.zCViewPtr, zCView__Open);
	};
};

func void gCView_Delete(var gCView v) {
	if(v.zCViewPtr) {
		CALL__thiscall(v.zCViewPtr, zCView__@zCView);
		MEM_Free(v.zCViewPtr);
	};
};

//========================================
// View erzeugen
//========================================
func int View_Create(var int x1, var int y1, var int x2, var int y2) {
	var int hndl; hndl = new(gCView@);
	var gCView v; v = get(hndl);
	v.zCViewPtr = MEM_Alloc(256);
	v.tex = "";
    CALL_IntParam(2);
    CALL_IntParam(y2);
    CALL_IntParam(x2);
    CALL_IntParam(y1);
    CALL_IntParam(x1);
    CALL__thiscall(v.zCViewPtr, zCView__zCView);
    return hndl;
};

//========================================
// View erzeugen (Pixelkoordinaten)
//========================================
func int View_CreatePxl(var int x1, var int y1, var int x2, var int y2) {
    x1 = Print_ToVirtual(x1,PS_X); y1 = Print_ToVirtual(y1,PS_Y);
    x2 = Print_ToVirtual(x2,PS_X); y2 = Print_ToVirtual(y2,PS_Y);
    return View_Create(x1, y1, x2, y2);
};

//========================================
// View eine Textur zuweisen
//========================================
func void View_SetTexture(var int hndl, var string tex) {
	tex = STR_Upper(tex);
	var gCView v; v = get(hndl);
	v.tex = tex;
    CALL_zStringPtrParam(tex);
    CALL__thiscall(v.zCViewPtr, zCView__InsertBack);
};

//========================================
// View anzeigen
//========================================
func void View_Open(var int hndl) {
	var gCView v; v = get(hndl);
	v.open = 1;
    CALL__thiscall(v.zCViewPtr, zCView__Open);
};

//========================================
// View schließen
//========================================
func void View_Close(var int hndl) {
	var gCView v; v = get(hndl);
	v.open = 0;
	CALL__thiscall(v.zCViewPtr, zCView__Close);
};

//========================================
// View löschen
//========================================
func void View_Delete(var int hndl) {
	var gCView v; v = get(hndl);
	gCView_Delete(v);
	delete(hndl);
};

//========================================
// View holen
//========================================
func zCView View_Get(var int hndl) {
	var gCView v; v = get(hndl);
	MEM_PtrToInst(v.zCViewPtr);
};

//========================================
// Größe ändern
//========================================
func void View_Resize(var int hndl, var int x, var int y) {
	const int zCView__SetSize = 8026016; //0x7A77A0
	var gCView v; v = get(hndl);
	if(!v.zCViewPtr) { return; };
	var zCView vw; vw = MEM_PtrToInst(v.zCViewPtr);
	if(y < 0) {
		CALL_IntParam(vw.vsizey);
	}
	else {
		CALL_IntParam(y);
	};
	if(x < 0) {
		CALL_IntParam(vw.vsizex);
	}
	else {
		CALL_IntParam(x);
	};
	CALL__thiscall(v.zCViewPtr, zCView__SetSize);
};

//========================================
// Größe ändern (pxl)
//========================================
func void View_ResizePxl(var int hndl, var int x, var int y) {
	View_Resize(hndl, Print_ToVirtual(x, PS_X), Print_ToVirtual(y, PS_Y));
};

//========================================
// Bewegen
//========================================
func void View_Move(var int hndl, var int x, var int y) {
	const int zCView__Move = 8025824; //0x7A76E0
	if(!Hlp_IsValidHandle(hndl)) { return; };
	var gCView v; v = get(hndl);
	if(!v.zCViewPtr) { return; };
	CALL_IntParam(y);
	CALL_IntParam(x);
	CALL__thiscall(v.zCViewPtr, zCView__Move);
};

//========================================
// Bewegen (pxl)
//========================================
func void View_MovePxl(var int hndl, var int x, var int y) {
	View_Move(hndl, Print_ToVirtual(x, PS_X), Print_ToVirtual(y, PS_Y));
};