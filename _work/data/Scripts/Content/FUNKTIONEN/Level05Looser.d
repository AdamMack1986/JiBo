FUNC VOID LEVEL05LOOSER ()
{
	StachelMalus = 20*LichtCounter;

	AI_Teleport	(hero, "ENDE");
};

FUNC VOID LEVEL11LOOSER ()
{
	StachelMalus = 1000;

	AI_Teleport	(hero, "ENDE");
};