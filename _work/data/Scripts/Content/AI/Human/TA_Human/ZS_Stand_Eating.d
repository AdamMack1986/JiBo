// *********************
// NSC benutzt Item Food
// *********************

func void ZS_Stand_Eating()
{
	Perception_Set_Normal();
	
	B_ResetAll (self);
	
	AI_SetWalkmode 	(self,NPC_WALK);
		
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
	{
		AI_GotoWP	(self, self.wp);
	};
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
		
	var int random;
	random = Hlp_Random(4);	
	
};

func int ZS_Stand_Eating_Loop ()
{
	if (Npc_IsOnFP (self, "STAND"))
	{	
		AI_AlignToFP (self);
		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};
	}	
	else if (Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP 		(self, "STAND");
		AI_StandUp 		(self);
		AI_AlignToFP 	(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else
	{
		AI_AlignToWP (self);
		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};
	};	

	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{			
		
	};		


	//*****************************************************************************
	//--- SK:Hier werden random ANis gespielt. Normaler PlayAni resettet den BS, es
	//--- gab dann Probleme mit dem Abbrechen der Loop --> AI_PLayANIBS notwendig
	//*****************************************************************************

	if ((Npc_GetStateTime(self) > 5)
	&& (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		
		Npc_SetStateTime (self, 0);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Stand_Eating_End ()
{
	AI_PlayAniBS (self,"T_POTION_RANDOM_2",BS_ITEMINTERACT); //Mund abwischen
	
};
