//######################################################
//
//	Leavegamekontrolle
//
//######################################################

/* Von Dir auszuf�llende Funktion!
 * Entscheide ob man gerade Laden darf oder nicht.
 * Gibt den entsprechenden Wert zur�ck. */
func int AllowLeavegame()
{
	if (Offline_Modus == FALSE)
	{
		//return FALSE;
	};

	return TRUE;
};

/* Wird aufgerufen, wenn Laden verboten war,
 * jetzt aber gerade wieder erlaubt wurde. */
func void OnAllowLeavegame() {
	//Print ("Laden ab jetzt erlaubt!");
};

/* Wird aufgerufen, wenn Laden erlaubt war,
 * jetzt aber gerade wieder verboten wurde. */
func void OnDisallowLeavegame() {
	//Print ("Laden ab jetzt verboten!");
};

//######################################################
//
//	INTERNAS - �ndern auf eigene Gefahr
//
//######################################################

/* Ben�tigte Konstante */
const INT IT_ONLY_OUT_GAME		= 256;

/* War laden beim letzten Check erlaubt? F�r Benachrichtigungsfunktionen. */
var int LeavegameDisabled_LastCheck;

/* Hier steht ob Quicksaves an sind: */
//const int s_bUseQuickSave_address = 9118160; //0x8B21D0

/* Funktion f�r den Nutzer, die AllowLeavegame auswertet und umsetzt */
instance LeavegameMenuItem (zCMenuItem);

func void EnforceLeavegamePolicy() {
	
	//--------------------------------------
	// Men�item holen:
	//--------------------------------------
	
	var int LeavegameMenuItemPtr;
	LeavegameMenuItemPtr = MEM_GetMenuItemByString ("MENUITEM_MAIN_EXIT");
	
	if (!LeavegameMenuItemPtr) {
		//wtf?
		var string err; err = "EnforceLeavegamePolicy: MENUITEM_MAIN_EXIT not found!?";
		Print (err); PrintDebug (err);
		return;
	};
	
	MEM_AssignInst (LeavegameMenuItem, LeavegameMenuItemPtr);
	
	//--------------------------------------
	// Der eigentliche Code:
	//--------------------------------------
	
	if (!AllowLeavegame()) {
		LeavegameMenuItem.m_parItemFlags = LeavegameMenuItem.m_parItemFlags | IT_ONLY_OUT_GAME;
		
		/* Scripter benachrichten, falls wirkliche �nderung */
		if (!LeavegameDisabled_LastCheck) {
			LeavegameDisabled_LastCheck = TRUE;
			OnDisallowLeavegame();
		};
	} else {
		/* Laden ist erlaubt */
		LeavegameMenuItem.m_parItemFlags = LeavegameMenuItem.m_parItemFlags &~ IT_ONLY_OUT_GAME;
		
		/* Scripter benachrichten, falls wirkliche �nderung */
		if (LeavegameDisabled_LastCheck) {
			LeavegameDisabled_LastCheck = 0;
			OnAllowLeavegame();
		};
	};
};