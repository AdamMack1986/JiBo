/***********************************\
               LOCALS
\***********************************/

//========================================
// Arrayfunktionen
//========================================
func void MEM_ArrayPush(var int arr, var int val) {
    MEM_ArrayInsert(arr, val);
};

func int MEM_ArrayPop(var int arr) {
    var zCArray a; a = MEM_PtrToInst(arr);
    var int val; val = MEM_ReadInt(a.array + 4 * (a.numInArray-1));
    a.numInArray -= 1;
    return val;
};

func int MEM_ArrayLast(var int arr) {
    var zCArray a; a = MEM_PtrToInst(arr);
    return MEM_ReadInt(a.array + 4 * (a.numInArray-1));
};

func int MEM_ArrayOverwrite(var int arr, var int val, var int newVal) {
    var zCArray a; a = MEM_PtrToInst(arr);
    var int i; i = 0;
    var int p; p = MEM_StackPos.position;
    if(i < a.numInArray) {
        if(MEM_ReadInt(a.array+4*i) == val) {
            MEM_WriteInt(a.array+4*i, newVal);
            return i;
        };
        i += 1;
        MEM_StackPos.position = p;
    };
    return -1;
};

func int MEM_ArrayOverwriteFirst(var int arr, var int val, var int newVal) {
    var zCArray a; a = MEM_PtrToInst(arr);
    var int i; i = 0;
    var int p; p = MEM_StackPos.position;
    if(i < a.numInArray) {
        if(MEM_ReadInt(a.array+4*i) == val) {
            MEM_WriteInt(a.array+4*i, newVal);
            return i;
        };
        i += 1;
        MEM_StackPos.position = p;
    };
    MEM_ArrayInsert(arr, newVal);
    return a.numInArray-1;
};

//========================================
// String kopieren
//========================================
func int strcpy(var int ps) {
    var int p0; p0 = MEM_Alloc(20);
    var int p1; p1 = MEM_Alloc(MEM_ReadInt(ps+12));
    MEM_WriteInt(p0+8, p1);
    MEM_CopyBytes(MEM_ReadInt(ps+8), p1, MEM_ReadInt(ps+12));
    MEM_CopyBytes(ps+12, p0+12, 8);
    return p0;
};

//========================================
// Lokale Variablen pushen
//========================================
const int _Locals_arr = 0;
func void Locals_Push(var func fnc) {
    if(!_Locals_arr) {
        _Locals_arr = MEM_ArrayCreate();
    };
    var int id; id = MEM_GetFuncID(fnc);
    var zCPar_Symbol symb; symb = MEM_PtrToInst(MEM_ReadIntArray(currSymbolTableAddress, id));

    var int offs; offs = 0;
    var string comp; comp = ConcatStrings(symb.name, ".");
    var int compl; compl = STR_Len(comp);

    var int p; p = MEM_StackPos.position;
    offs += 1;
    symb = MEM_PtrToInst(MEM_ReadIntArray(currSymbolTableAddress, id+offs));
    if(STR_Len(symb.name) <= compl) {
        MEM_ArrayPush(_Locals_arr, offs);
        return;
    };
    if(STR_Compare(comp, STR_Prefix(symb.name, compl)) != 0) {
        MEM_ArrayPush(_Locals_arr, offs);
        return;
    };
    if((symb.bitfield&zCPar_Symbol_bitfield_type) == zPAR_TYPE_STRING) {
        MEM_ArrayPush(_Locals_arr, strcpy(symb.content));
    }
    else {
        MEM_ArrayPush(_Locals_arr, symb.content);
    };
    MEM_StackPos.position = p;
};

//========================================
// Lokale Variablen popen
//========================================
func void Locals_Pop(var func fnc) {
    if(!_Locals_arr) {
        return;
    };
    var int id; id = MEM_GetFuncID(fnc);
    var zCPar_Symbol symb; symb = MEM_PtrToInst(MEM_ReadIntArray(currSymbolTableAddress, id));

    var int offs; offs = MEM_ArrayPop(_Locals_arr);

    var int p; p = MEM_StackPos.position;
    if(offs > 1) {
        offs -= 1;
        symb = MEM_PtrToInst(MEM_ReadIntArray(currSymbolTableAddress, id+offs));
        if((symb.bitfield&zCPar_Symbol_bitfield_type) == zPAR_TYPE_STRING) {
            var zString cpy; cpy = MEM_PtrToInst(MEM_ArrayPop(_Locals_arr));
            var zString str; str = MEM_PtrToInst(symb.content);
            MEM_Free(str.ptr);
            str.ptr = cpy.ptr;
            str.len = cpy.len;
            str.res = cpy.res;
            MEM_Free(MEM_InstToPtr(cpy));
        }
        else {
            symb.content = MEM_ArrayPop(_Locals_arr);
        };
        MEM_StackPos.position = p;
    };
};








