/***********************************\
            FRAMEFUNCTIONS
\***********************************/

const int FF_MAXFUNC = 2048; // Maximale Anzahl an Loop-Funktionen (2048 wird wohl nie erreicht werden, kann so stehen bleiben)

//========================================
// [intern] Variablen
//========================================
var int _FrameFunctions[FF_MAXFUNC];
var int _FF_NextSymb;

// Gelobt sei PermMem! Endlich eigene Klassen!
class FFItem {
    var int fncID;
    var int next;
    var int delay;
    var int cycles;
};
instance FFItem@(FFItem);

//========================================
// Funktion hinzufügen
//========================================
func void FF_ApplyExt(var func function, var int delay, var int cycles) {
    if(_FF_NextSymb == FF_MAXFUNC) {
        return;
    };
    var int hndl; hndl = new(FFItem@);
    var FFItem itm; itm = get(hndl);
    itm.fncID = MEM_GetFuncId(function);
    itm.cycles = cycles;
    itm.delay = delay;
    itm.next = MEM_Timer.totalTime + itm.delay;

    MEM_WriteStatArr(_FrameFunctions, _FF_NextSymb, hndl);
    _FF_NextSymb += 1;
};

//========================================
// Funktion prüfen
//========================================
func int FF_Active(var func function) {
    var int i; i = 0;
    var int f; f = MEM_GetFuncID(function);
    var int p; p = MEM_StackPos.position;
    var int h; h = MEM_ReadStatArr(_FrameFunctions, i);
    if(Hlp_IsValidHandle(h)) {
        var FFItem itm; itm = get(h);
        if(itm.fncID != f) {
            i += 1;
            MEM_StackPos.position = p;
        };
        return 1;
    };
    return 0;
};


//========================================
// Funktion hinzufügen (vereinfacht)
//========================================
func void FF_Apply(var func function) {
    if(_FF_NextSymb == FF_MAXFUNC) {
        return;
    };
    var int hndl; hndl = new(FFItem@);
    var FFItem itm; itm = get(hndl);
    itm.fncID = MEM_GetFuncId(function);
    itm.cycles = -1;
    itm.delay = 0;
    itm.next = MEM_Timer.totalTime + itm.delay;

    MEM_WriteStatArr(_FrameFunctions, _FF_NextSymb, hndl);
    _FF_NextSymb += 1;
};


//========================================
// Funktion entfernen
//========================================
func void _FF_Remove(var int funcSymb) {
    var int i; i = 0;
    var int pos; pos = MEM_StackPos.position;
    var int hndl; hndl = MEM_ReadStatArr(_FrameFunctions, i);
    var FFItem itm; itm = get(hndl);
    if (itm.fncID == funcSymb) {
        delete(hndl);
        if (_FF_NextSymb == 1||(_FF_NextSymb-1) == i) {
            MEM_WriteStatArr(_FrameFunctions, i, 0);
            _FF_NextSymb -= 1;
        }
        else {
            _FF_NextSymb -= 1;
            MEM_WriteStatArr(_FrameFunctions, i, MEM_ReadStatArr(_FrameFunctions, _FF_NextSymb));
            MEM_WriteStatArr(_FrameFunctions, _FF_NextSymb, 0);
        };
    }
    else if (i >= _FF_NextSymb) {
        MEM_Warn("FF_REMOVE: Function not found!");
    }
    else {
        i += 1;
        MEM_StackPos.position = pos;
    };
    };func void FF_Remove(var func function) {
    _FF_Remove(MEM_GetFuncID(function));
};

//========================================
// [intern] Enginehook
//========================================
func void _FF_Loop() {
    var int i; i = 0;
    var int pos; pos = MEM_StackPos.position;
    var int hndl; hndl = MEM_ReadStatArr(_FrameFunctions, i);
    if(!Hlp_IsValidHandle(hndl)) { return; };
    var FFItem itm; itm = get(hndl);

    var int p0; p0 = MEM_StackPos.position;
    if(MEM_Timer.totalTime >= itm.next) {
        MEM_CallById(itm.fncID);
        if(itm.cycles != -1) {
            itm.cycles -= 1;
            if(itm.cycles <= 0) {
                _FF_Remove(itm.fncID);
            };
        };
        if(itm.delay) {
            itm.next += itm.delay;
            MEM_StackPos.position = p0;
        };
    };

    i += 1;
    MEM_StackPos.position = pos;
};


