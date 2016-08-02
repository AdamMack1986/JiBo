// **************************
// B_GiveDeathInv
// --------------
// für Menschen und Monster
// gibt Monstern AnimalTrophy
// **************************

func void B_GiveDeathInv (var C_NPC slf)
{
	// EXIT IF...
	
	//-------- NUR beim ersten Durchlauf weitermachen (AIV_DeathInvGiven ist dann FALSE, wird hier (unten) auf TRUE gesetzt) --------
	if	(slf.aivar[AIV_DeathInvGiven] == TRUE)
	{
		return;
	};
	
	
	slf.aivar[AIV_DeathInvGiven] = TRUE;
};










