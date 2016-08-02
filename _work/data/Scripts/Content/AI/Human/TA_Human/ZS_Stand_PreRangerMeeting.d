func void ZS_Stand_RangerMeeting ()
{
	Perception_Set_Minimal();
	
	B_ResetAll (self);
	
	self.senses			= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;		//Sense_Smell erforderlich, da der Sc sonst nicht "gesehen wird)!!	
	self.senses_range	= 500;									//Damit der SC nicht sofort aus dem Wahrnehmungskreis des NSCs verschwindet 
	Npc_SetPercTime		(self,	1);								//Damit er öfter reagiert!
	
	Npc_PercEnable		(self, 	PERC_ASSESSPLAYER		,	B_AssessGuidePlayer			); //Player wird VOR Enemy erfasst! - Geht in ZS_Attack, ZS_ReactToWeapon, B_AssessEnterRoom oder B_AssessTalk //mustte ich noch mal aufröseln)
	Npc_PercEnable 		(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				); //geht in ZS_Attack

	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob					); //öffnet Türen, die auf dem Weg liegen
	Npc_PercEnable		(self,  PERC_ASSESSFIGHTSOUND	, 	B_AssessGuideFightSound		);	

	
	
};

func int ZS_Stand_RangerMeeting_loop()
{
	var int random;	

	

	return LOOP_CONTINUE;
};

func void ZS_Stand_RangerMeeting_end ()
{
	
};


