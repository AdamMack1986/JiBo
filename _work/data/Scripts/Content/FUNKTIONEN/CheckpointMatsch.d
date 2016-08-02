FUNC VOID CHECKPOINTMATSCH ()
{
	if (hero.aivar[AIV_Loadgame] == FALSE)
	{
		Snd_Play	("JIBOZERMATSCHEN");
		Snd_Play	("JIBOTELEPORT");
	};

	if (CurrentLevel == LEVEL05_ZEN)
	{
		Level05Looser();
		return;
	};

	if (Check07 == TRUE)
	{
		AI_Teleport	(hero, "CHECK07");
	}
	else if (Check06 == TRUE)
	{
		AI_Teleport	(hero, "CHECK06");
	}
	else if (Check05 == TRUE)
	{
		AI_Teleport	(hero, "CHECK05");
	}
	else if (Check04 == TRUE)
	{
		AI_Teleport	(hero, "CHECK04");
	}
	else if (Check03 == TRUE)
	{
		AI_Teleport	(hero, "CHECK03");
	}
	else if (Check02 == TRUE)
	{
		AI_Teleport	(hero, "CHECK02");
	}
	else if (Check01 == TRUE)
	{
		AI_Teleport	(hero, "CHECK01");
	}
	else
	{
		AI_Teleport	(hero, "START");
	};

	if (CurrentLevel == LEVEL06_ZEN)
	{
		Mdl_ApplyOverlayMDS	(hero, "HUMANS_ACROBATIC.MDS");

		Acrobat = 1;
	};

	if (CurrentLevel == LEVEL08_ZEN)
	{
		Mdl_ApplyOverlayMDS	(hero, "HUMANS_ACROBATIC.MDS");

		Acrobat = 1;
	};
};