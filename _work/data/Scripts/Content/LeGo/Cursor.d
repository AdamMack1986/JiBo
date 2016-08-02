/***********************************\
               CURSOR
\***********************************/

//========================================
// Erscheinungsbild des Cursors
//========================================
const string Cursor_Symbol = "A";                     // Genutzter Buchstabe
const string Cursor_Font   = "CURSOR.TGA";            // Genutzte Schriftart [Cursor.tga wird von LeGo bereitgestellt und enthält nur den Buchstaben 'A']
const int    Cursor_Alpha  = 255;                     // Alpha (0..255; 0 = unsichtbar)

//========================================
// Uservariablen
//========================================
var int Cursor_X;
var int Cursor_Y;
var int Cursor_Wheel;
var int Cursor_Left;
var int Cursor_Mid;
var int Cursor_Right;
var int Cursor_NoEngine;

//========================================
// [intern] Variablen
//========================================
var int _Cursor_fX;
var int _Cursor_fY;


//========================================
// Cursor verstecken
//========================================
var int _Cursor_Hndl;
func void Cursor_Hide() {
    if(!Hlp_IsValidHandle(_Cursor_Hndl)) { return; };
    Print_DeleteText(_Cursor_Hndl);
	_Cursor_Hndl = 0;
};

//========================================
// Cursor anzeigen
//========================================
func void Cursor_Show() {
	if(Hlp_IsValidHandle(_Cursor_Hndl)) { return; };
	Print_GetScreenSize();
	Cursor_X = Print_Screen[PS_X] / 2;
	Cursor_Y = Print_Screen[PS_Y] / 2;
	_Cursor_fX = mkf(Cursor_X);
	_Cursor_fY = mkf(Cursor_Y);
	_Cursor_Hndl = Print_ExtPxl(Cursor_X, Cursor_Y, Cursor_Symbol, Cursor_Font, RGBA(255,255,255,Cursor_Alpha), -1);
};

//========================================
// Maussteuerung An-/Ausschalten
//========================================
func void SetMouseEnabled(var int bEnabled) {
	CALL_IntParam(2);
	CALL_IntParam(!!bEnabled /*Nur zur Sicherheit*/);
	CALL__thiscall(MEM_ReadInt(9246288/* zCInput * zInput */), 5067008);
};
//========================================
// [intern] Klasse (von Engine genutzt)
//========================================
class _Cursor {
	var int relX;
	var int relY;
	var int wheel;
	var int keyLeft;
	var int keyMid;
	var int keyRight;
};

const int _Cursor_Ptr = 9246300; //0x8D165C
const int _Cursor_sX = 9019720; //0x89A148
const int _Cursor_sY = 9019724; //0x89A14C

//========================================
// [intern] Tasten
//========================================
func void _Cursor_KeyState(var int ptr, var int pressed) {
	var int keyState; keyState = MEM_ReadInt(ptr);
	// Kopiert aus der Ikarus.d
    if (keyState == KEY_UP) {
        if (pressed) {
            keyState = KEY_PRESSED;
        };
    } else if (keyState == KEY_PRESSED) {
        if (pressed) {
            keyState = KEY_HOLD;
        } else {
            keyState = KEY_RELEASED;
        };
    } else if (keyState == KEY_HOLD) {
        if (!pressed) {
            keyState = KEY_RELEASED;
        };
    } else {
        if (pressed) {
            keyState = KEY_PRESSED;
        } else {
            keyState = KEY_UP;
        };
    };
	MEM_WriteInt(ptr, keyState);
	return;
};

//========================================
// [intern] Enginehook
//========================================
func void _Cursor_GetVal() {
	var _Cursor c; c = MEM_PtrToInst(_Cursor_Ptr);

	_Cursor_fX = addf(mulf(mkf(c.relX), MEM_ReadInt(_Cursor_sX)), _Cursor_fX);
	_Cursor_fY = addf(mulf(mkf(c.relY), MEM_ReadInt(_Cursor_sY)), _Cursor_fY);
	Cursor_X = roundf(_Cursor_fX);
	Cursor_Y = roundf(_Cursor_fY);
	Cursor_Wheel = c.wheel;
	
	_Cursor_KeyState(MEM_GetIntAddress(Cursor_Left),  c.keyLeft);
	_Cursor_KeyState(MEM_GetIntAddress(Cursor_Mid),   c.keyMid);
	_Cursor_KeyState(MEM_GetIntAddress(Cursor_Right), c.keyRight);
	
	Print_GetScreenSize();
	if(Cursor_X > Print_Screen[PS_X]) {
		Cursor_X = Print_Screen[PS_X];
	}
	else if(Cursor_X < 0) {
		Cursor_X = 0;
	};
	if(Cursor_Y > Print_Screen[PS_Y]) {
		Cursor_Y = Print_Screen[PS_Y];
	}
	else if(Cursor_Y < 0) {
		Cursor_Y = 0;
	};
	
	if(Cursor_NoEngine) {
		c.relX = 0;
		c.relY = 0;
		c.keyLeft = 0;
		c.keyMid = 0;
		c.keyRight = 0;
	};
	
    if(!Hlp_IsValidHandle(_Cursor_Hndl)) { return; };	
    var zCViewText txt; txt = Print_GetText(_Cursor_Hndl);
    txt.posx = Print_ToVirtual(Cursor_X, PS_X);
    txt.posy = Print_ToVirtual(Cursor_Y, PS_Y);
};











