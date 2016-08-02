// *******************************************
// B_MM_WispDetect
// -------------
// Waffen Sucher
// *******************************************
func void B_GetWispDetectedItem ()
{
	//EXIT IF...
	if (!Hlp_IsValidItem(item))
	{
		return;
	};
	
	if (Npc_GetHeightToItem(self, item) > 500)
	{
		return;
	};
	
	//FUNC
	
	var int randy;
	randy = Hlp_Random (100);
	
	AI_GotoItem (self, item);
					
	if (Npc_GetDistToItem(self,item) < 1000)
	&& (randy <= 1)
	{
		Wld_PlayEffect("spellFX_ItemAusbuddeln",  item, item, 0, 0, 0, FALSE );
	};
};

func int B_WispDetectedItem ()
{		
	
	return 0;
};

func int B_MM_WispDetect()
{
	
};

