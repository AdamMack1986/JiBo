// ***********************************
// B_TeachPlayerTalentWispDetector
// ***********************************
func VOID B_WISPDETECTOR_LearnEffect(var C_NPC Teacher)
{
	AI_PlayAni (Teacher,"T_PRACTICEMAGIC5");	
	Wld_PlayEffect("spellFX_HealShrine",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",  hero, hero, 0, 0, 0, FALSE );
	Snd_Play ("WSP_Dead_A1");
};
func int B_TeachPlayerTalentWispDetector (var C_NPC slf, var C_NPC oth, var int WispSkill)
{
	// ------ Kosten festlegen ------
	var int kosten;
	kosten = B_GetLearnCostTalent(oth, NPC_TALENT_WISPDETECTOR, WispSkill);
	
	
	//EXIT IF...
	
	// ------ Player hat zu wenig Lernpunkte ------
	if (oth.lp < kosten)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall, 2);
		B_Say (slf, oth, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
			
	// FUNC
				
	// ------ Lernpunkte abziehen ------			
	oth.lp = oth.lp - kosten;
	
	                                                                                                                                                                                            
	PrintScreen			(PRINT_LearnWispDetector, -1, -1, FONT_Screen, 2);                                                                                                                                
	
	// ------ bei jedem Körperteil: WispDetector-Talent lernen (programmvariable, wird nur zur Ausgabe in StatusScreen benutzt) ------
	Npc_SetTalentSkill 	(oth, NPC_TALENT_WISPDETECTOR , 1);
	return TRUE;
};

