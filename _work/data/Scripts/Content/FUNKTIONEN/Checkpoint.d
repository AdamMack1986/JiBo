FUNC VOID CHECKPOINT ()
{
	if (hero.aivar[AIV_Loadgame] == FALSE)
	{
		Snd_Play	("JIBOTELEPORT");
	};

	if (Lore == TRUE)
	&& (CurrentLevel == LEVEL01_ZEN)
	{
		Lore = FALSE;

		Wld_SendTrigger	("LORE01");
	};

	if (Lore_R == TRUE)
	&& (CurrentLevel == LEVEL03_ZEN)
	{
		Lore_R = FALSE;

		Wld_SendTrigger	("LORE01");
	};

	if (Check07 == TRUE)
	{
		AI_Teleport	(hero, "CHECK07");

		if (hero.aivar[AIV_Loadgame] == TRUE)
		&& (CurrentLevel != START_ZEN)
		{
			TimeCounter_Real += 10;
			TimeCounter_Sek += 10;

			PrintScreen ("10 Sekunden Lade-Malus!", -1, YPOS_LevelUp, FONT_Screen, 1);
		};
	}
	else if (Check06 == TRUE)
	{
		AI_Teleport	(hero, "CHECK06");

		if (hero.aivar[AIV_Loadgame] == TRUE)
		&& (CurrentLevel != START_ZEN)
		{
			TimeCounter_Real += 10;
			TimeCounter_Sek += 10;

			PrintScreen ("10 Sekunden Lade-Malus!", -1, YPOS_LevelUp, FONT_Screen, 1);
		};
	}
	else if (Check05 == TRUE)
	{
		AI_Teleport	(hero, "CHECK05");

		if (hero.aivar[AIV_Loadgame] == TRUE)
		&& (CurrentLevel != START_ZEN)
		{
			TimeCounter_Real += 10;
			TimeCounter_Sek += 10;

			PrintScreen ("10 Sekunden Lade-Malus!", -1, YPOS_LevelUp, FONT_Screen, 1);
		};
	}
	else if (Check04 == TRUE)
	{
		AI_Teleport	(hero, "CHECK04");

		if (hero.aivar[AIV_Loadgame] == TRUE)
		&& (CurrentLevel != START_ZEN)
		{
			TimeCounter_Real += 10;
			TimeCounter_Sek += 10;

			PrintScreen ("10 Sekunden Lade-Malus!", -1, YPOS_LevelUp, FONT_Screen, 1);
		};
	}
	else if (Check03 == TRUE)
	{
		AI_Teleport	(hero, "CHECK03");

		if (hero.aivar[AIV_Loadgame] == TRUE)
		&& (CurrentLevel != START_ZEN)
		{
			TimeCounter_Real += 10;
			TimeCounter_Sek += 10;

			PrintScreen ("10 Sekunden Lade-Malus!", -1, YPOS_LevelUp, FONT_Screen, 1);
		};
	}
	else if (Check02 == TRUE)
	{
		AI_Teleport	(hero, "CHECK02");

		if (hero.aivar[AIV_Loadgame] == TRUE)
		&& (CurrentLevel != START_ZEN)
		{
			TimeCounter_Real += 10;
			TimeCounter_Sek += 10;

			PrintScreen ("10 Sekunden Lade-Malus!", -1, YPOS_LevelUp, FONT_Screen, 1);
		};
	}
	else if (Check01 == TRUE)
	{
		AI_Teleport	(hero, "CHECK01");

		if (hero.aivar[AIV_Loadgame] == TRUE)
		&& (CurrentLevel != START_ZEN)
		{
			TimeCounter_Real += 10;
			TimeCounter_Sek += 10;

			PrintScreen ("10 Sekunden Lade-Malus!", -1, YPOS_LevelUp, FONT_Screen, 1);
		};
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