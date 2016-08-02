// **********************
// NSC benutzt Herd
// **********************

FUNC VOID ZS_Cook_Stove ()
{
	Perception_Set_Normal();
	
	B_ResetAll (self);

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
    {
		AI_GotoWP	(self, self.wp);
	};
};

FUNC int ZS_Cook_Stove_Loop ()
{
	// ------ Braten ------
	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"STOVE"))
	{
		AI_UseMob (self, "STOVE", 1);
	};
		
	return LOOP_CONTINUE;
};

FUNC VOID ZS_Cook_Stove_End ()
{
	AI_UseMob (self, "STOVE", -1);	
};





