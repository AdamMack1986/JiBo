// *******************************************************************
// Startup und Init Funktionen der Level-zen-files
// -----------------------------------------------
// Die STARTUP-Funktionen werden NUR beim ersten Betreten eines Levels 
// (nach NewGame) aufgerufen, die INIT-Funktionen jedesmal
// Die Funktionen müssen so heissen wie die zen-files
// *******************************************************************

func void XMAS11_SetupPlayerAndCamera() {
    /* Free the Camera */
    const int oCGame__TestKeys = 7329120; //06FD560
    
    CALL_IntParam(KEY_F6);
    CALL__thiscall(MEM_InstToPtr(MEM_Game), oCGame__TestKeys);
};

//Called from the main loop in the first frame.
func void XMAS11_Startup() {
    MEM_Info("XMAS11: Startup.");
    MEM_InitAll(); /* because not everything exists when calling from Startup_Global */
    XMAS11_SetupPlayerAndCamera();
    
    /* avoid closing on esc: */
    const int nomenuPtr = 8980632; //0x890898
    
    MemoryProtectionOverride(nomenuPtr, 6);
    
    var int AAAA; AAAA = (65 << 24) | (65 << 16) | (65 << 8) | (65 << 0);
    MEM_WriteInt(nomenuPtr, AAAA);
    MEM_WriteInt(nomenuPtr + 2, AAAA); /* now the param "AAAAAA" instead of "nomenu" is asked for */
    
    /* read the highscore */
    XM11_Highscore = STR_ToInt(MEM_GetGothOpt("XM11", "highscore"));
    var int hash; hash = STR_ToInt(MEM_GetGothOpt("XM11", "highscoreHash"));
    
    if (MEM_GetBufferCRC32(_@(XM11_HighScore), 4) != hash) {
        MEM_Info("Invalid highscore hash (probably never started the game). Resetting.");
        XM11_Highscore = 0;
    };
};

// *********
// GLOBAL
// *********

func void STARTUP_GLOBAL()
{
	// wird fuer jede Welt aufgerufen (vor STARTUP_<LevelName>)
	Game_InitGerman();
};

func void INIT_GLOBAL()
{
	// wird fuer jede Welt aufgerufen (vor INIT_<LevelName>)
	Game_InitGerman();

	Wld_SendTrigger	("DAUERTRIGGER");
	Wld_SendTrigger	("SPECIALTRIGGER");

	/*LeGo_Init(  LeGo_PrintS
              | LeGo_FrameFunctions
              | LeGo_View
              | LeGo_Interface
              | LeGo_Cursor);*/

	LeGo_Init(LeGo_All);

	hero.aivar[AIV_Loadgame] = TRUE;

	ReturnToStartlevel = 0;

	Wld_SetTime	(8,00);

	MEM_InitAll();
	MEM_InitGlobalInst();

	username = MEM_GetGothOpt("CLOCKWORK", "username");
	passwort = MEM_GetGothOpt("CLOCKWORK", "passwort");

	MEM_WriteInt	(game_holdTime_Address, 1);

	MEM_SetShowDebug(1);

	if (!Hlp_StrCmp(GOTHIC_RESTART, "Y"))
	{
		HookEngine (4349731, 7, "B_ENDGAME");

		GOTHIC_RESTART = "Y";
	};

	MoreAlphaVobs(2048); //normal: 256
	MoreAlphaPolys(16384); //normal: 2048

	PrintDebug ("INIT: TEST 1");

	ExternalDenyVobs();
};

FUNC VOID OldLevel(var int newlevel)
{
	PrintDebug	(ConcatStrings(ConcatStrings("Startup: ", IntToString(CurrentLevel)), IntToString(newlevel)));

	CurrentLevel2 = newlevel;
};


// *********
// Testlevel
// *********


func void STARTUP_Startraum ()
{

};

func void INIT_Startraum ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	hero.flags = 2;

	OldLevel(STARTLEVEL_ZEN);
};


func void STARTUP_Startwelt ()
{

};

func void INIT_Startwelt ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	hero.flags = 2;

	OldLevel(START_ZEN);
};


func void STARTUP_Jimmywelt ()
{

};

func void INIT_Jimmywelt ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	OldLevel(LEVEL01_ZEN);
};


func void STARTUP_Jimmywelt_R ()
{

};

func void INIT_Jimmywelt_R ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	OldLevel(LEVEL03_ZEN);
};


func void STARTUP_Jimmywelt2 ()
{

};

func void INIT_Jimmywelt2 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	OldLevel(LEVEL02_ZEN);
};


func void STARTUP_Jimmywelt2_R ()
{

};

func void INIT_Jimmywelt2_R ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	OldLevel(LEVEL04_ZEN);
};


func void STARTUP_Jimmywelt3 ()
{

};

func void INIT_Jimmywelt3 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	OldLevel(LEVEL05_ZEN);
};


func void STARTUP_Jimmywelt4 ()
{

};

func void INIT_Jimmywelt4 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	OldLevel(LEVEL06_ZEN);
};


func void STARTUP_Jimmywelt4_R ()
{

};

func void INIT_Jimmywelt4_R ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	OldLevel(LEVEL08_ZEN);
};


func void STARTUP_Jimmywelt5 ()
{

};

func void INIT_Jimmywelt5 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	OldLevel(LEVEL07_ZEN);
};


func void STARTUP_Jimmywelt5_R ()
{

};

func void INIT_Jimmywelt5_R ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	OldLevel(LEVEL09_ZEN);
};


func void STARTUP_Bonnewelt1 ()
{

};

func void INIT_Bonnewelt1 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	OldLevel(LEVEL10_ZEN);
};


func void STARTUP_Jimmywelt6 ()
{

};

func void INIT_Jimmywelt6 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	OldLevel(LEVEL11_ZEN);
};

func void STARTUP_Gothic_Racer()
{
	score = 100000;
	highscore = Level12_Highscore;
	besttime = 125;

};

func void INIT_Gothic_Racer ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	OldLevel(LEVEL12_ZEN);

	hero.flags = 0;

	if (Npc_HasItems(hero, racer_fass) == 0)
	{
		CreateInvItems	(hero, racer_fass, 1);
	};
	if (Npc_HasItems(hero, racer_zaphod_01) == 0)
	{
		CreateInvItems	(hero, racer_zaphod_01, 1);
	};
	if (Npc_HasItems(hero, thorben_thunder) == 0)
	{
		CreateInvItems	(hero, thorben_thunder, 1);
	};
	if (Npc_HasItems(hero, scavi_racer) == 0)
	{
		CreateInvItems	(hero, scavi_racer, 1);
	};
	if (Npc_HasItems(hero, keiler_racer) == 0)
	{
		CreateInvItems	(hero, keiler_racer, 1);
	};

	PrintDebug ("INIT: TEST 2");

	Wld_SendTrigger ("RACER_LOOP"); 
	Wld_SendTrigger ("RACER_LOOP_DISPLAY"); 
};

func void STARTUP_XMAS11()
{
	//score = 100000;
	//highscore = Level12_Highscore;
	//besttime = 125;

};

func void INIT_XMAS11 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	OldLevel(LEVEL13_ZEN);

	PrintDebug ("INIT: TEST 3");

	MEM_InitAll();
	MEM_SetShowDebug(1);

	ExternalAcceptVobs();
};