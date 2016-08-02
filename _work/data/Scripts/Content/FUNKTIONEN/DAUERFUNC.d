var string PrintText2;

instance platzhaltermover(zCMover);

FUNC VOID DAUERFUNC_01 ()
{
	// Zeit
	var int ptr;

	TimeShower();

	// In Startwelt zurückkehren

	if (ReturnToStartlevel == 1)
	|| (ReturnToStartlevel == 2)
	{
		ComeBackCounter += 1;

		if (ReturnToStartlevel == 2)
		{
			if (ComeBackCounter == 3)
			{
				if (CurrentLevel == LEVEL11_ZEN)
				{
					ptr = MEM_SearchVobByName("PLADDI");

					if (ptr > 0)
					{
						MEM_AssignInst(platzhaltermover, ptr);

						platzhaltermover.moveSpeed = mkf(100);
					};
				}
				else if (CurrentLevel == LEVEL05_ZEN)
				{
					ptr = MEM_SearchVobByName("WAND01");

					if (ptr > 0)
					{
						MEM_AssignInst(platzhaltermover, ptr);

						platzhaltermover.moveSpeed = mkf(100);
					};
				};

				if (Offline_Modus == 0)
				{
					CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/gomon/tauschen/addJiBoLevel.php?name=", username), "&level="), IntToString(CurrentLevel)));
				};
			};
			if (ComeBackCounter == 4)
			{
				Snd_Play	("JIBOTELEPORT");

				if (CurrentLevel == LEVEL11_ZEN)
				{
					Wld_SendTrigger	("EVT_LEVEL11_BACK");
				}
				else if (CurrentLevel == LEVEL05_ZEN)
				{
					Wld_SendTrigger	("EVT_LEVEL05_BACK");
				};
			};

			if (ComeBackCounter == 5)
			{
				ReturnToStartLevel = 0;
				ComeBackCounter = 0;

				if (CurrentLevel == LEVEL11_ZEN)
				{
					ptr = MEM_SearchVobByName("PLADDI");

					if (ptr > 0)
					{
						MEM_AssignInst(platzhaltermover, ptr);

						platzhaltermover.moveSpeed = divf(mkf(1), mkf(5));
					};
				}
				else if (CurrentLevel == LEVEL05_ZEN)
				{
					ptr = MEM_SearchVobByName("WAND01");

					if (ptr > 0)
					{
						MEM_AssignInst(platzhaltermover, ptr);

						platzhaltermover.moveSpeed = divf(mkf(15), mkf(100));
					};
				};

				AI_Teleport	(hero, "BACK");
			};
		}
		else
		{
			ReturnToStartlevel = 2;
		};
	};

	// Level schonmal gespielt durch altes Save?

	if (Level01_Highscore > 0)
	{
		Level01_Gespielt = TRUE;
	};
	if (Level02_Highscore > 0)
	{
		Level02_Gespielt = TRUE;
	};
	if (Level03_Highscore > 0)
	{
		Level03_Gespielt = TRUE;
	};
	if (Level04_Highscore > 0)
	{
		Level04_Gespielt = TRUE;
	};
	if (Level05_Highscore > 0)
	{
		Level05_Gespielt = TRUE;
	};
	if (Level06_Highscore > 0)
	{
		Level06_Gespielt = TRUE;
	};
	if (Level07_Highscore > 0)
	{
		Level07_Gespielt = TRUE;
	};
	if (Level08_Highscore > 0)
	{
		Level08_Gespielt = TRUE;
	};
	if (Level09_Highscore > 0)
	{
		Level09_Gespielt = TRUE;
	};
	if (Level10_Highscore > 0)
	{
		Level10_Gespielt = TRUE;
	};
	if (Level11_Highscore > 0)
	{
		Level11_Gespielt = TRUE;
	};

	// Abhaken, wenn Level schonmal gespielt wurde

	if (CurrentLevel == LEVEL01_ZEN)
	{
	};
	if (CurrentLevel == LEVEL02_ZEN)
	{
	};
	if (CurrentLevel == LEVEL03_ZEN)
	{
	};
	if (CurrentLevel == LEVEL04_ZEN)
	{
	};
	if (CurrentLevel == LEVEL05_ZEN)
	{
		PrintText2 = ConcatStrings(IntToString((Npc_GetDistToItem(hero, ItMi_Joint_01)-600)/100), " Meter");

		Print	(PrintText2);

		if (Infotext05 == 0)
		{
			Infotext05 = 1;

			PrintScreen ("Sammle Leuchtkugeln, um Punkte zu bekommen!", -1, YPOS_LevelUp, FONT_Screen, 4);
		};
	};
	if (CurrentLevel == LEVEL06_ZEN)
	{
	};
	if (CurrentLevel == LEVEL07_ZEN)
	{
		DiveTime -= 1;

		PrintText2 = ConcatStrings(IntToString(DiveTime), " Sekunden");

		if (ReturnToStartlevel == 0)
		&& (DiveTime >= 0)
		{
			Print	(PrintText2);
		};

		if (Infotext04 == 0)
		{
			Infotext04 = 1;

			PrintScreen ("Sammle Luftblasen, um Punkte zu bekommen!", -1, YPOS_LevelUp, FONT_Screen, 4);
		};
	};
	if (CurrentLevel == LEVEL08_ZEN)
	{
	};
	if (CurrentLevel == LEVEL09_ZEN)
	{
		DiveTime -= 1;

		PrintText2 = ConcatStrings(IntToString(DiveTime), " Sekunden");

		if (ReturnToStartlevel == 0)
		&& (DiveTime >= 0)
		{
			Print	(PrintText2);
		};
	};
	if (CurrentLevel == LEVEL10_ZEN)
	{
		if (Infotext10 == 0)
		{
			Infotext10 = 1;

			PrintScreen ("Sammle Leuchtkugeln, um Punkte zu bekommen!", -1, YPOS_LevelUp, FONT_Screen, 4);
			PrintScreen ("Berühre aber nicht die Wände oder den Boden!", -1, YPOS_LevelUp+4, FONT_Screen, 4);
		};
	};
	if (CurrentLevel == LEVEL11_ZEN)
	{
		if (Infotext11 == 0)
		{
			Infotext11 = 1;

			PrintScreen ("Sammle Leuchtkugeln, um Punkte zu bekommen!", -1, YPOS_LevelUp, FONT_Screen, 4);
			PrintScreen ("Falle aber nicht von der Plattform!", -1, YPOS_LevelUp+4, FONT_Screen, 4);
		};
	};
	if (CurrentLevel == START_ZEN)
	{
		if (InfotextStart == 0)
		{
			InfotextStart = 1;

			PrintScreen ("Spring auf die Wolken, um die Level zu starten!", -1, YPOS_LevelUp, FONT_Screen, 4);
		};
	};

	var int Mod_OnlineMode2;
	Mod_OnlineMode2 = STR_ToInt(MEM_GetGothOpt("JIBO", "online"));

	if (Mod_OnlineMode2 == 0)
	&& (Mod_OnlineMode == 1)
	{
		// wurde umgeschalten von Offline auf Online

		ValidateUserPasswort = 1;

		Mod_OnlineMode = 0;

		Offline_Modus = 0;
	};

	if (Mod_OnlineMode2 == 1)
	&& (Mod_OnlineMode == 0)
	{
		// wurde umgeschalten von Online auf Offline

		B_EndGame();

		Mod_OnlineMode = 1;

		Offline_Modus = 1;

		ValidateUserPasswort = 3;
	};

	// Spielstart erstmal Username eingeben

	if (GetInput == 0)
	&& (ValidateUserPasswort < 3)
	{
		if (STR_Len(username) == 0)
		&& (STR_Len(eingabe) == 0)
		&& (Offline_Modus == 0)
		{
			B_StartEingabe();

			PrintScreen	("Bitte Username eingeben", -1, 45, FONT_SCREEN, 5);
		}
		else if (STR_Len(passwort) == 0)
		&& (STR_Len(eingabe) == 0)
		&& (Offline_Modus == 0)
		{
			B_StartEingabe();

			PrintScreen	("Bitte Passwort eingeben", -1, 45, FONT_SCREEN, 5);
		}
		else
		{
			eingabe = "";
		};

		if (STR_Len(passwort) > 1)
		&& (STR_Len(username) > 1)
		&& (ValidateUserPasswort == 0)
		&& (Offline_Modus == 0)
		{
			ValidateUserPasswort = TRUE;
		};

		if (STR_Len(username) > 1)
		&& (STR_Len(eingabe) > 0)
		&& (STR_Len(passwort) <= 1)
		{
			eingabe = "";
		};

		if (validateUserPasswort == 2)
		{
			validateUserPasswort = 3;
		};

		if (validateUserPasswort == 1)
		{
			eingabe = "";
			var string testup;
			testup = ConcatStrings("http://www.teutonicteam.de/gomon/tauschen/validatePW.php?name=", username);
			testup = ConcatStrings(testup, "&passwort=");
			testup = ConcatStrings(testup, passwort);
			testup = ConcatStrings(testup, "&game=3");

			eingabe = CURL_Get(testup);

			validateUserPasswort = 2;

			if (STR_GetCharAt(eingabe, 0) == STR_GetCharAt("Y", 0))
			{
				PrintScreen	("Passwort korrekt", -1, 55, FONT_SCREEN, 2);

				var int release;
				var int beta;

				eingabe = STR_Tok(eingabe, ";");
				eingabe = STR_Tok("NULL", ";"); // für Releaseversionen

				release = STR_ToInt(eingabe);

				eingabe = STR_Tok("NULL", ";"); // für Betas

				beta = STR_ToInt(eingabe);

				if (beta > 2)
				{
					PrintScreen	("Neuere Version erhältlich!", -1, 60, FONT_SCREEN, 10);
				};

				MEM_SetGothOpt("CLOCKWORK", "username", username);
				MEM_SetGothOpt("CLOCKWORK", "passwort", passwort);

				// Scores aktualisieren

				Level01_Platz = STR_ToInt(STR_Tok(CURL_Get(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/getScore.php?name=", username), "&id=4&version=110")), ";"));
				Level01_Highscore = STR_ToInt(STR_Tok("NULL", ";"));
				Level02_Platz = STR_ToInt(STR_Tok(CURL_Get(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/getScore.php?name=", username), "&id=6&version=110")), ";"));
				Level02_Highscore = STR_ToInt(STR_Tok("NULL", ";"));
				Level03_Platz = STR_ToInt(STR_Tok(CURL_Get(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/getScore.php?name=", username), "&id=5&version=110")), ";"));
				Level03_Highscore = STR_ToInt(STR_Tok("NULL", ";"));
				Level04_Platz = STR_ToInt(STR_Tok(CURL_Get(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/getScore.php?name=", username), "&id=7&version=110")), ";"));
				Level04_Highscore = STR_ToInt(STR_Tok("NULL", ";"));
				Level05_Platz = STR_ToInt(STR_Tok(CURL_Get(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/getScore.php?name=", username), "&id=12&version=110")), ";"));
				Level05_Highscore = STR_ToInt(STR_Tok("NULL", ";"));
				Level06_Platz = STR_ToInt(STR_Tok(CURL_Get(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/getScore.php?name=", username), "&id=8&version=110")), ";"));
				Level06_Highscore = STR_ToInt(STR_Tok("NULL", ";"));
				Level07_Platz = STR_ToInt(STR_Tok(CURL_Get(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/getScore.php?name=", username), "&id=10&version=110")), ";"));
				Level07_Highscore = STR_ToInt(STR_Tok("NULL", ";"));
				Level08_Platz = STR_ToInt(STR_Tok(CURL_Get(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/getScore.php?name=", username), "&id=9&version=110")), ";"));
				Level08_Highscore = STR_ToInt(STR_Tok("NULL", ";"));
				Level09_Platz = STR_ToInt(STR_Tok(CURL_Get(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/getScore.php?name=", username), "&id=11&version=110")), ";"));
				Level09_Highscore = STR_ToInt(STR_Tok("NULL", ";"));
				Level10_Platz = STR_ToInt(STR_Tok(CURL_Get(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/getScore.php?name=", username), "&id=13&version=110")), ";"));
				Level10_Highscore = STR_ToInt(STR_Tok("NULL", ";"));
				Level11_Platz = STR_ToInt(STR_Tok(CURL_Get(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/getScore.php?name=", username), "&id=14&version=110")), ";"));
				Level11_Highscore = STR_ToInt(STR_Tok("NULL", ";"));
				Level12_Platz = STR_ToInt(STR_Tok(CURL_Get(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/getScore.php?name=", username), "&id=16&version=110")), ";"));
				Level12_Highscore = STR_ToInt(STR_Tok("NULL", ";"));
				Level13_Platz = STR_ToInt(STR_Tok(CURL_Get(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/getScore.php?name=", username), "&id=32&version=110")), ";"));
				Level13_Highscore = STR_ToInt(STR_Tok("NULL", ";"));
			}
			else if (STR_GetCharAt(eingabe, 0) == STR_GetCharAt("N", 0))
			{
				PrintScreen	("Passwort falsch", -1, 55, FONT_SCREEN, 2);

				MEM_SetGothOpt("CLOCKWORK", "username", "0");
				MEM_SetGothOpt("CLOCKWORK", "passwort", "0");

				username = "";
				passwort = "";

				eingabe = "";

				validateUserPasswort = 0;
			}
			else if (STR_GetCharAt(eingabe, 0) == STR_GetCharAt("E", 0))
			{
				PrintScreen	("Verbindung kann zur Zeit nicht hergestellt werden!", -1, 55, FONT_SCREEN, 2);
				PrintScreen	("Spiel jetzt im Offline-Modus", -1, 60, FONT_SCREEN, 2);

				eingabe = "";

				Offline_Modus = 1;
			}
			else if (STR_GetCharAt(eingabe, 0) == STR_GetCharAt("B", 0))
			{
				PrintScreen	("Dein Account wurde gebannt!", -1, 55, FONT_SCREEN, 2);
				PrintScreen	("Spiel jetzt im Offline-Modus", -1, 60, FONT_SCREEN, 2);

				eingabe = "";

				Offline_Modus = 1;
			}
			else
			{
				PrintScreen	("Unbekannter Fehler", -1, 55, FONT_SCREEN, 2);

				eingabe = "";

				Offline_Modus = 1;
			};
		};
	};

	if (online_playtime > 1800)
	&& (Offline_Modus == 0)
	{
		CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/gomon/tauschen/actualizePlaytime.php?name=", username), "&game=3&time="), IntToString(online_playtime)));
		online_playtime = 0;
	};

	online_playtime += 1;
	online_playtime_s = IntToString(online_playtime);

	EnforceLeavegamePolicy();

	if (Npc_HasItems(hero, racer_fass) > 0)
	{
		Npc_RemoveInvItems	(hero, racer_fass, 1);
	};
	if (Npc_HasItems(hero, racer_zaphod_01) > 0)
	{
		Npc_RemoveInvItems	(hero, racer_zaphod_01, 1);
	};
	if (Npc_HasItems(hero, thorben_thunder) > 0)
	{
		Npc_RemoveInvItems	(hero, thorben_thunder, 1);
	};
	if (Npc_HasItems(hero, scavi_racer) > 0)
	{
		Npc_RemoveInvItems	(hero, scavi_racer, 1);
	};
	if (Npc_HasItems(hero, keiler_racer) > 0)
	{
		Npc_RemoveInvItems	(hero, keiler_racer, 1);
	};

	Wld_SendTrigger ("DAUERTRIGGER");
};