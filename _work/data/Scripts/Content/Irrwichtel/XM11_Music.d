func void XM11_CheckMusic() {
    var int musRunning;
    var int musToRun;
    
    var int init;
    if (!init) { musRunning = -1; init = 1; }; //no valid position so far

    musToRun = STR_ToInt(MEM_GetGothOpt("XM11", "MusicChosen"));
    
    if (musToRun != musRunning) {
        /* untrigger all music */
        Wld_SendUntrigger("SOUNDZONE_SUGARPLUMFAIRIES");
        Wld_SendUntrigger("SOUNDZONE_JINGLE_BELLS");
        
        if (musToRun == 0) { /* 0 == jingle bells */
            Wld_SendTrigger("SOUNDZONE_JINGLE_BELLS");
            musRunning = 0;
        } else if (musToRun == 1) { /* 2 == sugarplumfairies */
            Wld_SendTrigger("SOUNDZONE_SUGARPLUMFAIRIES");
            musRunning = 1;
        } else {
            //no music
            musRunning = musToRun;
        };
    };
};