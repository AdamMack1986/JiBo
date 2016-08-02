// Teleport Start

func void Teleport_Start ()
{
	Npc_ClearAIQueue (hero);
	AI_Teleport (self, "BACK"); 
};