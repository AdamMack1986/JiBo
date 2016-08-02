// *****************************************
// ZS_Dead
// -------
// wird auch nach jedem Load Game ausgef�hrt
// wird auch vom Spieler ausgef�hrt
// *****************************************

func void ZS_Dead ()
{	
	// ------ aivars resetten ------
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	
	B_StopLookAt	(self);
	AI_StopPointAt	(self);
		
	// ------ XP ------
	if ( Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER]==TRUE) )
	&& (self.aivar[AIV_VictoryXPGiven] == FALSE)							
	{
		B_GivePlayerXP (self.level * XP_PER_VICTORY);			
		
		self.aivar[AIV_VictoryXPGiven] = TRUE;
	};
	
	
	if (Npc_IsPlayer(other))
	{
		self.aivar[AIV_KilledByPlayer] = TRUE;
	};

	// ------ Monster-Inventory abh�ngig vom Spieler-Talent ------
	B_GiveDeathInv(self);
	
	// ------ PetzCounter meiner Home-Location runtersetzen ------
	B_DeletePetzCrime (self); //hat bei CRIME_NONE (oder keiner Home-Location) keine Auswirkungen
	self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
	
	// ------ Equippte Waffen k�nnen nicht genommen werden! ------
	AI_UnequipWeapons (self);
	
	self.aivar[AIV_TAPOSITION] = FALSE;

	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];

	return;
};

func int ZS_Dead_loop ()
{
	// Drachen 
	if (self.aivar[AIV_TAPOSITION] == FALSE)
	{
		self.aivar[AIV_TAPOSITION] = TRUE;
	};
	
	return LOOP_END;
};
