INSTANCE racer_zaphod_01(C_Item)
{
	name 				=	"Alpha Centauri";

	mainflag 				=	ITEM_KAT_ARMOR; // rüstung
	flags 					=	0;
	material 			=	MAT_METAL;

	wear 					=	WEAR_HEAD;

	on_equip				=	Equip_zap_racer;
	on_unequip				=	UnEquip_zap_racer;

	value 				=	50000;


	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	35;

	visual 				=	"racer_zaphod.3DS";

	description			= name;
	TEXT[2]				= "Das Schnellste Gefährt";

	TEXT[3] 			= "jenseits von Beteigeuze";
	TEXT[5] 			= "benötigte Geschicklichkeit : 35";

};



	FUNC VOID Equip_zap_racer()
	{
		Mdl_ApplyOverlayMds	(self, "zaphod_racer.mds");

		Mod_HasEquippedArmor = 1;
 	};

	FUNC VOID UnEquip_zap_racer()
	{
		Mdl_RemoveOverlayMDS	(self, "zaphod_racer.mds");

		Mod_HasEquippedArmor = 0;
	};
	
// ein Fass...	
	
INSTANCE racer_fass(C_Item)
{
	name 				=	"abgefahrenes Fass";

	mainflag 				=	ITEM_KAT_ARMOR; // rüstung
	flags 					=	0;
	material 			=	MAT_WOOD;

	wear 					=	WEAR_HEAD;

	on_equip				=	Equip_fass_racer;
	on_unequip				=	UnEquip_fass_racer;

	value 				=	4;



	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	10;
	visual 				=	"racer_fass.3DS";

	description			= name;
	TEXT[2]				= "ziemlich abgefahrenes";
	TEXT[3] 			= "Fass";
	TEXT[5] 			= "benötigte Geschicklichkeit : 10";};



	FUNC VOID Equip_fass_racer()
	{
		Mdl_ApplyOverlayMds	(self, "Thorben_Thunder.mds");

		Mod_HasEquippedArmor = 1;
 	};

	FUNC VOID UnEquip_fass_racer()
	{
		Mdl_RemoveOverlayMDS	(self, "Thorben_Thunder.mds");

		Mod_HasEquippedArmor = 0;
	};	


INSTANCE thorben_thunder(C_Item)
{
	name 				=	"Thorbens Thunder";

	mainflag 				=	ITEM_KAT_ARMOR; // rüstung
	flags 					=	0;
	material 			=	MAT_WOOD;

	wear 					=	WEAR_HEAD;

	on_equip				=	Equip_thorben_racer;
	on_unequip				=	UnEquip_thorben_racer;

	value 				=	4000;


	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	15;
	visual 				=	"thorben_thunder.3DS";



	description			= name;
	TEXT[1]				= "Thorbens Thunder";
	TEXT[2]				= "grundsolides Holzmodell";
	TEXT[3] 			= "nicht besonders schnell";
	TEXT[4]				= "aber preiswert";

	TEXT[5] 			= "benötigte Geschicklichkeit : 15";
};



	FUNC VOID Equip_thorben_racer()
	{
		Mdl_ApplyOverlayMds	(self, "racer_achtmsek.mds");

		Mod_HasEquippedArmor = 1;
 	};

	FUNC VOID UnEquip_thorben_racer()
	{
		Mdl_RemoveOverlayMDS	(self, "racer_achtmsek.mds");

		Mod_HasEquippedArmor = 0;
	};	

INSTANCE scavi_racer(C_Item)
{
	name 				=	"Scared Scavenger";

	mainflag 				=	ITEM_KAT_ARMOR; // rüstung
	flags 					=	0;
	material 			=	MAT_WOOD;

	wear 					=	WEAR_HEAD;

	on_equip				=	Equip_scavi_racer;
	on_unequip				=	UnEquip_scavi_racer;

	value 				=	30000;


	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	25;

	visual 				=	"scavi.3DS";


	description			= name;
	TEXT[1]				= "Die Sumpfies";
	TEXT[2]				= "lieben dieses Modell";
	TEXT[3] 			= "";
	TEXT[4]				= "";
	TEXT[5] 			= "benötigte Geschicklichkeit : 25";
};



	FUNC VOID Equip_scavi_racer()
	{
		Mdl_ApplyOverlayMds	(self, "racer_neunmsek.mds");

		Mod_HasEquippedArmor = 1;
 	};

	FUNC VOID UnEquip_scavi_racer()
	{
		Mdl_RemoveOverlayMDS	(self, "racer_neunmsek.mds");

		Mod_HasEquippedArmor = 0;
	};	
		
		
INSTANCE keiler_racer(C_Item)
{
	name 				=	"Bospers Beam Boar";

	mainflag 				=	ITEM_KAT_ARMOR; // rüstung
	flags 					=	0;
	material 			=	MAT_WOOD;

	wear 					=	WEAR_HEAD;

	on_equip				=	Equip_keiler_racer;
	on_unequip				=	UnEquip_keiler_racer;

	value 				=	800;


	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	20;

	visual 				=	"keiler.3DS";


	description			= name;
	TEXT[1]				= "Bospers Beam Boar";
	TEXT[2]				= "Schnell wie ein Pfeil";
	TEXT[3] 			= "Die Kufen könnten ein wenig";
	TEXT[4]				= "optimiert werden...";
	TEXT[5] 			= "benötigte Geschicklichkeit : 20";
};



	FUNC VOID Equip_keiler_racer()
	{
		Mdl_ApplyOverlayMds	(self, "racer_achtmsek.mds");

		Mod_HasEquippedArmor = 1;
 	};

	FUNC VOID UnEquip_keiler_racer()
	{
		Mdl_RemoveOverlayMDS	(self, "racer_achtmsek.mds");

		Mod_HasEquippedArmor = 0;
	};	
					