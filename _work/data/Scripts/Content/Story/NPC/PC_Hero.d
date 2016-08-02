instance PC_Hero (NPC_DEFAULT)
{
	// ------ SC ------
	name 		= "Ich";
	guild		= GIL_NONE;
	id			= 0;
	voice		= 15;
	level		= 0;
	flags = 2;
	Npctype		= NPCTYPE_MAIN;
	
	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************
	
	// ------ XP Setup ------
	exp				= 0;
	exp_next		= 500;
	lp				= 0;
	
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 10;
	attribute[ATR_DEXTERITY] 		= 10;
	attribute[ATR_MANA_MAX] 		= 10;
	attribute[ATR_MANA] 			= 10;
	attribute[ATR_HITPOINTS_MAX]		= 1500;
	attribute[ATR_HITPOINTS] 		= 1500;

	aivar[AIV_MM_SLEEPSTART] = 0;
	aivar[AIV_MM_SLEEPEND] = 0;
	aivar[AIV_MM_RESTSTART] = 0;
	aivar[AIV_MM_RESTEND] = 0;
	aivar[AIV_MM_ROAMSTART] = 0;
	aivar[AIV_MM_ROAMEND] = 0;
	aivar[AIV_MM_EATGROUNDSTART] = 0;
	aivar[AIV_MM_EATGROUNDEND] = 0;
	aivar[AIV_MM_WUSELSTART] = 0;
	aivar[AIV_MM_WUSELEND] = 0;
	
	// ------ visuals ------
	//B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Player, BodyTex_N, NO_ARMOR);
	
	Mdl_SetVisual (self,"HUMANS.MDS");
	// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
	Mdl_SetVisualBody (self, "hum_body_Naked0", 9,				0,			"Hum_Head_Pony", 	18,	0, 			NO_ARMOR);
	
	// ------ Kampf-Talente ------
	B_SetFightSkills 	(self, 10); 

	CreateInvItems (self, racer_zaphod_01, 1);
	CreateInvItems (self, thorben_thunder, 1);
	CreateInvItems (self, scavi_racer, 1);
	CreateInvItems (self, keiler_racer, 1);
	CreateInvItems (self, racer_fass, 1);
};