//========================================
// [intern] Position des Cursors
//========================================
func void _Cursor_Pos(var int ptr) {
    CALL_PtrParam(ptr);
    CALL__stdcall(8079628);
};

//========================================
// X-Koordinate
//========================================
func int Cursor_X() {
    var int ptr; ptr = MEM_Alloc(8);
    _Cursor_Pos(ptr);
    var int res; res = MEM_ReadInt(ptr);
    MEM_Free(ptr);
    return res;
};

//========================================
// Y-Koordinate
//========================================
func int Cursor_Y() {
    var int ptr; ptr = MEM_Alloc(8);
    _Cursor_Pos(ptr);
    var int res; res = MEM_ReadInt(ptr+4);
    MEM_Free(ptr);
    return res;
};

//========================================
// Erscheinungsbild des Cursors
//========================================
func void Cursor_SetXY(var int x, var int y) {
    CALL_IntParam(y);
    CALL_IntParam(x);
    CALL__stdcall(8079622);
};