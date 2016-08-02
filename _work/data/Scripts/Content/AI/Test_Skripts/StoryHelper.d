// ***************
// Trank der Story
// ***************																

INSTANCE ItPo_Story(C_Item)
{
	name 			=	"Gluck";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	visual 			=	"ItPo_Perm_STR.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Story;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER";

	description		= 	"Macht, daﬂ es weitergeht bei Raven Video I";
};

	FUNC VOID UseItPo_Story()
	{
	};


//**************************************
//Storyhelper
//**************************************
INSTANCE SH (NPC_DEFAULT)
{
// ------ NSC ------
	name 		= "Storyhelper";
	guild 		= GIL_NONE;
	id 			= 9999;
	voice 		= 15;
	flags       = 0 ;																
	npctype		= NPCTYPE_FRIEND ;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	//B_SetFightSkills (self, 70); 
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------		
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------				
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Player, bodyTex_Player, -1);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_9999;
};

FUNC VOID Rtn_Start_9999 ()
{	
	TA_Stand_ArmsCrossed(08,00,23,00,"XXX");
    TA_Stand_ArmsCrossed(23,00,08,00,"XXX");
};
//***************************************************************************
//	Rahmen-Infos
//***************************************************************************
instance  StoryHelper_Exit (C_INFO)
{
	npc			=  SH;
	nr			=  999;
	condition	=  StoryHelper_Exit_Condition;
	information	=  StoryHelper_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  StoryHelper_Exit_Condition()
{
	return 1;
};

FUNC VOID  StoryHelper_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//**************************************************************************
//								KAPITEL 1
//							--------------------
//***************************************************************************
INSTANCE StoryHelper_INFO1 (C_INFO)
{
	npc				= SH;
	condition		= StoryHelper_INFO1_Condition;
	information		= StoryHelper_INFO1_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kapitel 1"; 
};

FUNC INT StoryHelper_INFO1_Condition()
{		
	return TRUE;
};

func VOID StoryHelper_INFO1_Info()
{

	Info_ClearChoices	( StoryHelper_INFO1 );
	Info_AddChoice		( StoryHelper_INFO1, DIALOG_BACK			                			, StoryHelper_BACK1);
	Info_AddChoice		( StoryHelper_INFO1, "KAPITELANFANG"			                			, StoryHelper_KAPITEL1ANFANG);
	Info_AddChoice		( StoryHelper_INFO1, "ADDON Ready for first Meeting with Saturas (forget Lares)"			                	, StoryHelper_SATURAS);
	Info_AddChoice		( StoryHelper_INFO1, "ADDON Cavalorn bug "			                	, StoryHelper_Cavalorn);
};
FUNC VOID StoryHelper_SATURAS()
{
	
	AI_StopProcessInfos	( self );
};

FUNC VOID StoryHelper_Cavalorn()
{
	
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	BACK
//---------------------------------------------------------------------
FUNC VOID StoryHelper_BACK1()
{
	Info_ClearChoices	( StoryHelper_INFO1 );
};	
//---------------------------------------------------------------------
//	Kapitelanfang
//---------------------------------------------------------------------
FUNC VOID StoryHelper_KAPITEL1ANFANG()
{
	
	AI_StopProcessInfos	( self );
};
//**************************************************************************
//								KAPITEL 2
//							--------------------
//***************************************************************************
INSTANCE StoryHelper_INFO2 (C_INFO)
{
	npc				= SH;
	condition		= StoryHelper_INFO2_Condition;
	information		= StoryHelper_INFO2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kapitel 2"; 
};

FUNC INT StoryHelper_INFO2_Condition()
{		
	return TRUE;
};

func VOID StoryHelper_INFO2_Info()
{

	Info_ClearChoices	( StoryHelper_INFO2 );
	Info_AddChoice		( StoryHelper_INFO2, DIALOG_BACK			                			, StoryHelper_BACK2);
	Info_AddChoice		( StoryHelper_INFO2, "KAPITELANFANG"			                			, StoryHelper_KAPITEL2ANFANG);
};
//---------------------------------------------------------------------
//	BACK
//---------------------------------------------------------------------
FUNC VOID StoryHelper_BACK2()
{
	Info_ClearChoices	( StoryHelper_INFO2 );
};	
//---------------------------------------------------------------------
//	Kapitelanfang
//---------------------------------------------------------------------
FUNC VOID StoryHelper_KAPITEL2ANFANG()
{
	
	AI_StopProcessInfos	( self );
};

//**************************************************************************
//								KAPITEL 3
//							--------------------
//***************************************************************************
INSTANCE StoryHelper_INFO3 (C_INFO)
{
	npc				= SH;
	condition		= StoryHelper_INFO3_Condition;
	information		= StoryHelper_INFO3_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kapitel 3"; 
};

FUNC INT StoryHelper_INFO3_Condition()
{		
	return TRUE;
};

func VOID StoryHelper_INFO3_Info()
{

	Info_ClearChoices	( StoryHelper_INFO3 );
	Info_AddChoice		( StoryHelper_INFO3, DIALOG_BACK			                			, StoryHelper_BACK3);
	Info_AddChoice		( StoryHelper_INFO3, "KAPITELANFANG"			                			, StoryHelper_KAPITEL3ANFANG);
};
//---------------------------------------------------------------------
//	BACK
//---------------------------------------------------------------------
FUNC VOID StoryHelper_BACK3()
{
	Info_ClearChoices	( StoryHelper_INFO3 );
};	
//---------------------------------------------------------------------
//	Kapitelanfang
//---------------------------------------------------------------------
FUNC VOID StoryHelper_KAPITEL3ANFANG()
{
	AI_StopProcessInfos	( self );
};

//**************************************************************************
//								KAPITEL 4
//							--------------------
//***************************************************************************
INSTANCE StoryHelper_INFO4 (C_INFO)
{
	npc				= SH;
	condition		= StoryHelper_INFO4_Condition;
	information		= StoryHelper_INFO4_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kapitel 4"; 
};

FUNC INT StoryHelper_INFO4_Condition()
{		
	return TRUE;
};

func VOID StoryHelper_INFO4_Info()
{

	Info_ClearChoices	( StoryHelper_INFO4 );
	Info_AddChoice		( StoryHelper_INFO4, DIALOG_BACK			                			, StoryHelper_BACK4);
	Info_AddChoice		( StoryHelper_INFO4, "KAPITELANFANG"			                			, StoryHelper_KAPITEL4ANFANG);
};
//---------------------------------------------------------------------
//	BACK
//---------------------------------------------------------------------
FUNC VOID StoryHelper_BACK4()
{
	Info_ClearChoices	( StoryHelper_INFO4 );
};	
//---------------------------------------------------------------------
//	Kapitelanfang
//---------------------------------------------------------------------
FUNC VOID StoryHelper_KAPITEL4ANFANG()
{
	
	AI_StopProcessInfos	( self );
};

//**************************************************************************
//								KAPITEL 5
//							--------------------
//***************************************************************************
INSTANCE StoryHelper_INFO5 (C_INFO)
{
	npc				= SH;
	condition		= StoryHelper_INFO5_Condition;
	information		= StoryHelper_INFO5_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kapitel 5"; 
};

FUNC INT StoryHelper_INFO5_Condition()
{		
	return TRUE;
};

func VOID StoryHelper_INFO5_Info()
{

	Info_ClearChoices	( StoryHelper_INFO5 );
	Info_AddChoice		( StoryHelper_INFO5, DIALOG_BACK			                			, StoryHelper_BACK5);
	Info_AddChoice		( StoryHelper_INFO5, "KAPITELANFANG"			                			, StoryHelper_KAPITEL5ANFANG);
};
//---------------------------------------------------------------------
//	BACK
//---------------------------------------------------------------------
FUNC VOID StoryHelper_BACK5()
{
	Info_ClearChoices	( StoryHelper_INFO5 );
};	
//---------------------------------------------------------------------
//	Kapitelanfang
//---------------------------------------------------------------------
FUNC VOID StoryHelper_KAPITEL5ANFANG()
{
	
	AI_StopProcessInfos	( self );
};

//**************************************************************************
//								KAPITEL 6
//							--------------------
//***************************************************************************
INSTANCE StoryHelper_INFO6 (C_INFO)
{
	npc				= SH;
	condition		= StoryHelper_INFO6_Condition;
	information		= StoryHelper_INFO6_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kapitel 6"; 
};

FUNC INT StoryHelper_INFO6_Condition()
{		
	return TRUE;
};

func VOID StoryHelper_INFO6_Info()
{

	Info_ClearChoices	( StoryHelper_INFO6 );
	Info_AddChoice		( StoryHelper_INFO6, DIALOG_BACK			                			, StoryHelper_BACK6);
	Info_AddChoice		( StoryHelper_INFO6, "KAPITELANFANG"			                			, StoryHelper_KAPITEL6ANFANG);
};
//---------------------------------------------------------------------
//	BACK
//---------------------------------------------------------------------
FUNC VOID StoryHelper_BACK6()
{
	Info_ClearChoices	( StoryHelper_INFO6 );
};	
//---------------------------------------------------------------------
//	Kapitelanfang
//---------------------------------------------------------------------
FUNC VOID StoryHelper_KAPITEL6ANFANG()
{
	
	AI_StopProcessInfos	( self );
};
