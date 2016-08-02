// ********************************************************
// B_MM_AssessPlayer
// -----------------
// Wird von Monstern benutzt, die important-infos haben
// Party-Member blieben stehen
// ********************************************************

func void B_MM_AssessPlayer()
{
	// EXIT IF...
	
	// ------ SC im Dialog ------
	if (other.aivar[AIV_INVINCIBLE] == TRUE) 
	{
		return;
	};
	
	// ------ Ignorieren, wenn SC tot, ohnmächtig oder in magischem Schlaf ------
	if (C_NpcIsDown (other))
	{
		return;
	};
	
	
	// FUNC
	
	// ------ Hat Monster Important Info für Spieler? ------
	if (Npc_GetDistToNpc(self,other) <= 700)	//Joly:FINGER WEG!!!!!!!!!!!
	&& (Npc_CheckInfo (self, 1))	//REIHENFOLGE nicht vertauschen! (Check ist dahingehend buggy (darf nicht als erste Abfrage in &&-verknüpfter If-Abfrage stehen))
	{
		
	};
	
	// ------ Party-Member blieben stehen ------
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (Npc_GetDistToNpc(self,hero) < 500)
		&& (!C_BodyStateContains (self,BS_STAND))
		{
			Npc_ClearAIQueue(self);
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
	};
};

