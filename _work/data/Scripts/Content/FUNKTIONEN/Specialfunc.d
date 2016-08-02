var string PrintText;
instance Mein_Schleifen_Trigger (oCTriggerScript);

FUNC VOID SPECIALFUNC_01 ()
{
	// Es wird gleich MEM_Timer genutzt, der muss initialisiert sein
	MEM_InitGlobalInst();

	// Triggernachricht senden
	Wld_SendTrigger ("SPECIALTRIGGER"); //ruft meineSchleifenFunktion auf

	if (CurrentLevel == LEVEL13_ZEN)
	{
		XM11_MainLoop();
	};

	// Funktionsteil

	if (CurrentLevel2 != 0)
	{
		if (CurrentLevel == 0) // Erster Spielstart
		{
			CurrentLevel = CurrentLevel2;

			Offline_Modus = FALSE;
			ValidateUserPasswort = 0;

			Level01_Highscore = 0;
			Level02_Highscore = 0;
			Level03_Highscore = 0;
			Level04_Highscore = 0;
			Level05_Highscore = 0;
			Level06_Highscore = 0;
			Level07_Highscore = 0;
			Level08_Highscore = 0;
			Level09_Highscore = 0;
			Level10_Highscore = 0;
			Level11_Highscore = 0;
			Level12_Highscore = 0;
			Level13_Highscore = 0;

			PrintDebug("TEST: Erster Spielstart");
		}
		else if (CurrentLevel != CurrentLevel2) // Levelwechsel
		{
			CurrentLevel = CurrentLevel2;

			// wenn wieder in Startraum, dann sollten die Scores aktualisiert werden

			PrintDebug("TEST: Levelwechsel");

			if (CurrentLevel == START_ZEN)
			|| (CurrentLevel2 == START_ZEN)
			{
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

				PrintDebug("TEST: ... in Startwelt");
			};
		}
		else	// Spielstand geladen
		{
			Offline_Modus = FALSE;
			ValidateUserPasswort = 1;

			if (STR_ToInt(online_playtime_s) > 0)
			{
				CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/gomon/tauschen/actualizePlaytime.php?name=", username), "&game=3&time="), online_playtime_s));
			};

			online_playtime = 0;

			if (CurrentLevel == START_ZEN)
			|| (CurrentLevel2 == START_ZEN)
			{
				Level01_Highscore = 0;
				Level02_Highscore = 0;
				Level03_Highscore = 0;
				Level04_Highscore = 0;
				Level05_Highscore = 0;
				Level06_Highscore = 0;
				Level07_Highscore = 0;
				Level08_Highscore = 0;
				Level09_Highscore = 0;
				Level10_Highscore = 0;
				Level11_Highscore = 0;
				Level12_Highscore = 0;
				Level13_Highscore = 0;
			};
		};

		CurrentLevel2 = 0;
	};

	// Levelinfos anzeigen

	if (CurrentLevel == START_ZEN)
	{
		if (Npc_GetDistToWP(hero, "LEVEL01") < 500)
		&& (Npc_GetDistToWP(hero, "LEVEL01") < Npc_GetDistToWP(hero, "LEVEL02"))
		&& (Npc_GetDistToWP(hero, "LEVEL01") < Npc_GetDistToWP(hero, "LEVEL03"))
		&& (Npc_GetDistToWP(hero, "LEVEL01") < Npc_GetDistToWP(hero, "LEVEL04"))
		&& (Npc_GetDistToWP(hero, "LEVEL01") < Npc_GetDistToWP(hero, "LEVEL05"))
		&& (Npc_GetDistToWP(hero, "LEVEL01") < Npc_GetDistToWP(hero, "LEVEL06"))
		&& (Npc_GetDistToWP(hero, "LEVEL01") < Npc_GetDistToWP(hero, "LEVEL07"))
		&& (Npc_GetDistToWP(hero, "LEVEL01") < Npc_GetDistToWP(hero, "LEVEL08"))
		&& (Npc_GetDistToWP(hero, "LEVEL01") < Npc_GetDistToWP(hero, "LEVEL09"))
		{
			PrintScreen	("Szenario 1: Wolkenwelt", -1, 1, FONT_Screen, 1);

			PrintScreen	("Autor: Jim Hal Wilson", -1, 5, FONT_Screen, 1);

			PrintScreen	(concatStrings("Highscore: ", IntToString(Level01_Highscore)), -1, 9, FONT_Screen, 1);

			if (Level01_Platz > 0)
			{
				PrintScreen	(concatStrings("Platz: ", IntToString(Level01_Platz)), -1, 13, FONT_Screen, 1);
			}
			else
			{
				PrintScreen	("Noch nicht gespielt!", -1, 13, FONT_Screen, 1);
			};

		};

		if (Npc_GetDistToWP(hero, "LEVEL02") < 500)
		&& (Npc_GetDistToWP(hero, "LEVEL02") < Npc_GetDistToWP(hero, "LEVEL01"))
		&& (Npc_GetDistToWP(hero, "LEVEL02") < Npc_GetDistToWP(hero, "LEVEL03"))
		&& (Npc_GetDistToWP(hero, "LEVEL02") < Npc_GetDistToWP(hero, "LEVEL04"))
		&& (Npc_GetDistToWP(hero, "LEVEL02") < Npc_GetDistToWP(hero, "LEVEL05"))
		&& (Npc_GetDistToWP(hero, "LEVEL02") < Npc_GetDistToWP(hero, "LEVEL06"))
		&& (Npc_GetDistToWP(hero, "LEVEL02") < Npc_GetDistToWP(hero, "LEVEL07"))
		&& (Npc_GetDistToWP(hero, "LEVEL02") < Npc_GetDistToWP(hero, "LEVEL08"))
		&& (Npc_GetDistToWP(hero, "LEVEL02") < Npc_GetDistToWP(hero, "LEVEL09"))
		{
			PrintScreen	("Szenario 2: Der schmale Grat", -1, 1, FONT_Screen, 1);

			PrintScreen	("Autor: Jim Hal Wilson", -1, 5, FONT_Screen, 1);

			PrintScreen	(concatStrings("Highscore: ", IntToString(Level02_Highscore)), -1, 9, FONT_Screen, 1);

			if (Level02_Platz > 0)
			{
				PrintScreen	(concatStrings("Platz: ", IntToString(Level02_Platz)), -1, 13, FONT_Screen, 1);
			}
			else
			{
				PrintScreen	("Noch nicht gespielt!", -1, 13, FONT_Screen, 1);
			};

		};

		if (Npc_GetDistToWP(hero, "LEVEL03") < 500)
		&& (Level03_Frei == 1)
		&& (Npc_GetDistToWP(hero, "LEVEL03") < Npc_GetDistToWP(hero, "LEVEL02"))
		&& (Npc_GetDistToWP(hero, "LEVEL03") < Npc_GetDistToWP(hero, "LEVEL01"))
		&& (Npc_GetDistToWP(hero, "LEVEL03") < Npc_GetDistToWP(hero, "LEVEL04"))
		&& (Npc_GetDistToWP(hero, "LEVEL03") < Npc_GetDistToWP(hero, "LEVEL05"))
		&& (Npc_GetDistToWP(hero, "LEVEL03") < Npc_GetDistToWP(hero, "LEVEL06"))
		&& (Npc_GetDistToWP(hero, "LEVEL03") < Npc_GetDistToWP(hero, "LEVEL07"))
		&& (Npc_GetDistToWP(hero, "LEVEL03") < Npc_GetDistToWP(hero, "LEVEL08"))
		&& (Npc_GetDistToWP(hero, "LEVEL03") < Npc_GetDistToWP(hero, "LEVEL09"))
		{
			PrintScreen	("Szenario 1: Wolkenwelt - Reverse", -1, 1, FONT_Screen, 1);

			PrintScreen	("Autor: Jim Hal Wilson", -1, 5, FONT_Screen, 1);

			PrintScreen	(concatStrings("Highscore: ", IntToString(Level03_Highscore)), -1, 9, FONT_Screen, 1);

			if (Level03_Platz > 0)
			{
				PrintScreen	(concatStrings("Platz: ", IntToString(Level03_Platz)), -1, 13, FONT_Screen, 1);
			}
			else
			{
				PrintScreen	("Noch nicht gespielt!", -1, 13, FONT_Screen, 1);
			};

		};

		if (Npc_GetDistToWP(hero, "LEVEL04") < 500)
		&& (Level04_Frei == 1)
		&& (Npc_GetDistToWP(hero, "LEVEL04") < Npc_GetDistToWP(hero, "LEVEL02"))
		&& (Npc_GetDistToWP(hero, "LEVEL04") < Npc_GetDistToWP(hero, "LEVEL03"))
		&& (Npc_GetDistToWP(hero, "LEVEL04") < Npc_GetDistToWP(hero, "LEVEL01"))
		&& (Npc_GetDistToWP(hero, "LEVEL04") < Npc_GetDistToWP(hero, "LEVEL05"))
		&& (Npc_GetDistToWP(hero, "LEVEL04") < Npc_GetDistToWP(hero, "LEVEL06"))
		&& (Npc_GetDistToWP(hero, "LEVEL04") < Npc_GetDistToWP(hero, "LEVEL07"))
		&& (Npc_GetDistToWP(hero, "LEVEL04") < Npc_GetDistToWP(hero, "LEVEL08"))
		&& (Npc_GetDistToWP(hero, "LEVEL04") < Npc_GetDistToWP(hero, "LEVEL09"))
		{
			PrintScreen	("Szenario 2: Der schmale Grat - Reverse", -1, 1, FONT_Screen, 1);

			PrintScreen	("Autor: Jim Hal Wilson", -1, 5, FONT_Screen, 1);

			PrintScreen	(concatStrings("Highscore: ", IntToString(Level04_Highscore)), -1, 9, FONT_Screen, 1);

			if (Level04_Platz > 0)
			{
				PrintScreen	(concatStrings("Platz: ", IntToString(Level04_Platz)), -1, 13, FONT_Screen, 1);
			}
			else
			{
				PrintScreen	("Noch nicht gespielt!", -1, 13, FONT_Screen, 1);
			};

		};

		if (Npc_GetDistToWP(hero, "LEVEL05") < 500)
		&& (Level05_Frei == 1)
		&& (Npc_GetDistToWP(hero, "LEVEL05") < Npc_GetDistToWP(hero, "LEVEL02"))
		&& (Npc_GetDistToWP(hero, "LEVEL05") < Npc_GetDistToWP(hero, "LEVEL03"))
		&& (Npc_GetDistToWP(hero, "LEVEL05") < Npc_GetDistToWP(hero, "LEVEL01"))
		&& (Npc_GetDistToWP(hero, "LEVEL05") < Npc_GetDistToWP(hero, "LEVEL04"))
		&& (Npc_GetDistToWP(hero, "LEVEL05") < Npc_GetDistToWP(hero, "LEVEL06"))
		&& (Npc_GetDistToWP(hero, "LEVEL05") < Npc_GetDistToWP(hero, "LEVEL07"))
		&& (Npc_GetDistToWP(hero, "LEVEL05") < Npc_GetDistToWP(hero, "LEVEL08"))
		&& (Npc_GetDistToWP(hero, "LEVEL05") < Npc_GetDistToWP(hero, "LEVEL09"))
		{
			PrintScreen	("Szenario 5: Alles rennt!", -1, 1, FONT_Screen, 1);

			PrintScreen	("Autor: Jim Hal Wilson", -1, 5, FONT_Screen, 1);

			PrintScreen	(concatStrings("Highscore: ", IntToString(Level05_Highscore)), -1, 9, FONT_Screen, 1);

			if (Level05_Platz > 0)
			{
				PrintScreen	(concatStrings("Platz: ", IntToString(Level05_Platz)), -1, 13, FONT_Screen, 1);
			}
			else
			{
				PrintScreen	("Noch nicht gespielt!", -1, 13, FONT_Screen, 1);
			};

		};

		if (Npc_GetDistToWP(hero, "LEVEL06") < 500)
		&& (Npc_GetDistToWP(hero, "LEVEL06") < Npc_GetDistToWP(hero, "LEVEL02"))
		&& (Npc_GetDistToWP(hero, "LEVEL06") < Npc_GetDistToWP(hero, "LEVEL03"))
		&& (Npc_GetDistToWP(hero, "LEVEL06") < Npc_GetDistToWP(hero, "LEVEL01"))
		&& (Npc_GetDistToWP(hero, "LEVEL06") < Npc_GetDistToWP(hero, "LEVEL04"))
		&& (Npc_GetDistToWP(hero, "LEVEL06") < Npc_GetDistToWP(hero, "LEVEL05"))
		&& (Npc_GetDistToWP(hero, "LEVEL06") < Npc_GetDistToWP(hero, "LEVEL07"))
		&& (Npc_GetDistToWP(hero, "LEVEL06") < Npc_GetDistToWP(hero, "LEVEL08"))
		&& (Npc_GetDistToWP(hero, "LEVEL06") < Npc_GetDistToWP(hero, "LEVEL09"))
		{
			PrintScreen	("Szenario 3: Mit dem Kopf zuerst", -1, 1, FONT_Screen, 1);

			PrintScreen	("Autor: Jim Hal Wilson", -1, 5, FONT_Screen, 1);

			PrintScreen	(concatStrings("Highscore: ", IntToString(Level06_Highscore)), -1, 9, FONT_Screen, 1);

			if (Level06_Platz > 0)
			{
				PrintScreen	(concatStrings("Platz: ", IntToString(Level06_Platz)), -1, 13, FONT_Screen, 1);
			}
			else
			{
				PrintScreen	("Noch nicht gespielt!", -1, 13, FONT_Screen, 1);
			};

		};

		if (Npc_GetDistToWP(hero, "LEVEL07") < 500)
		&& (Npc_GetDistToWP(hero, "LEVEL07") < Npc_GetDistToWP(hero, "LEVEL02"))
		&& (Npc_GetDistToWP(hero, "LEVEL07") < Npc_GetDistToWP(hero, "LEVEL03"))
		&& (Npc_GetDistToWP(hero, "LEVEL07") < Npc_GetDistToWP(hero, "LEVEL01"))
		&& (Npc_GetDistToWP(hero, "LEVEL07") < Npc_GetDistToWP(hero, "LEVEL04"))
		&& (Npc_GetDistToWP(hero, "LEVEL07") < Npc_GetDistToWP(hero, "LEVEL05"))
		&& (Npc_GetDistToWP(hero, "LEVEL07") < Npc_GetDistToWP(hero, "LEVEL06"))
		&& (Npc_GetDistToWP(hero, "LEVEL07") < Npc_GetDistToWP(hero, "LEVEL08"))
		&& (Npc_GetDistToWP(hero, "LEVEL07") < Npc_GetDistToWP(hero, "LEVEL09"))
		{
			PrintScreen	("Szenario 4: Unterwasserwelt", -1, 1, FONT_Screen, 1);

			PrintScreen	("Autor: Jim Hal Wilson", -1, 5, FONT_Screen, 1);

			PrintScreen	(concatStrings("Highscore: ", IntToString(Level07_Highscore)), -1, 9, FONT_Screen, 1);

			if (Level07_Platz > 0)
			{
				PrintScreen	(concatStrings("Platz: ", IntToString(Level07_Platz)), -1, 13, FONT_Screen, 1);
			}
			else
			{
				PrintScreen	("Noch nicht gespielt!", -1, 13, FONT_Screen, 1);
			};

		};

		if (Npc_GetDistToWP(hero, "LEVEL08") < 500)
		&& (Level08_Frei == 1)
		&& (Npc_GetDistToWP(hero, "LEVEL08") < Npc_GetDistToWP(hero, "LEVEL02"))
		&& (Npc_GetDistToWP(hero, "LEVEL08") < Npc_GetDistToWP(hero, "LEVEL03"))
		&& (Npc_GetDistToWP(hero, "LEVEL08") < Npc_GetDistToWP(hero, "LEVEL01"))
		&& (Npc_GetDistToWP(hero, "LEVEL08") < Npc_GetDistToWP(hero, "LEVEL04"))
		&& (Npc_GetDistToWP(hero, "LEVEL08") < Npc_GetDistToWP(hero, "LEVEL05"))
		&& (Npc_GetDistToWP(hero, "LEVEL08") < Npc_GetDistToWP(hero, "LEVEL07"))
		&& (Npc_GetDistToWP(hero, "LEVEL08") < Npc_GetDistToWP(hero, "LEVEL06"))
		&& (Npc_GetDistToWP(hero, "LEVEL08") < Npc_GetDistToWP(hero, "LEVEL09"))
		{
			PrintScreen	("Szenario 3: Mit dem Kopf zuerst - Reverse", -1, 1, FONT_Screen, 1);

			PrintScreen	("Autor: Jim Hal Wilson", -1, 5, FONT_Screen, 1);

			PrintScreen	(concatStrings("Highscore: ", IntToString(Level08_Highscore)), -1, 9, FONT_Screen, 1);

			if (Level08_Platz > 0)
			{
				PrintScreen	(concatStrings("Platz: ", IntToString(Level08_Platz)), -1, 13, FONT_Screen, 1);
			}
			else
			{
				PrintScreen	("Noch nicht gespielt!", -1, 13, FONT_Screen, 1);
			};

		};

		if (Npc_GetDistToWP(hero, "LEVEL09") < 500)
		&& (Level09_Frei == 1)
		&& (Npc_GetDistToWP(hero, "LEVEL09") < Npc_GetDistToWP(hero, "LEVEL02"))
		&& (Npc_GetDistToWP(hero, "LEVEL09") < Npc_GetDistToWP(hero, "LEVEL03"))
		&& (Npc_GetDistToWP(hero, "LEVEL09") < Npc_GetDistToWP(hero, "LEVEL01"))
		&& (Npc_GetDistToWP(hero, "LEVEL09") < Npc_GetDistToWP(hero, "LEVEL04"))
		&& (Npc_GetDistToWP(hero, "LEVEL09") < Npc_GetDistToWP(hero, "LEVEL05"))
		&& (Npc_GetDistToWP(hero, "LEVEL09") < Npc_GetDistToWP(hero, "LEVEL07"))
		&& (Npc_GetDistToWP(hero, "LEVEL09") < Npc_GetDistToWP(hero, "LEVEL08"))
		&& (Npc_GetDistToWP(hero, "LEVEL09") < Npc_GetDistToWP(hero, "LEVEL06"))
		{
			PrintScreen	("Szenario 4: Unterwasserwelt - Reverse", -1, 1, FONT_Screen, 1);

			PrintScreen	("Autor: Jim Hal Wilson", -1, 5, FONT_Screen, 1);

			PrintScreen	(concatStrings("Highscore: ", IntToString(Level09_Highscore)), -1, 9, FONT_Screen, 1);

			if (Level09_Platz > 0)
			{
				PrintScreen	(concatStrings("Platz: ", IntToString(Level09_Platz)), -1, 13, FONT_Screen, 1);
			}
			else
			{
				PrintScreen	("Noch nicht gespielt!", -1, 13, FONT_Screen, 1);
			};

		};

		if (Npc_GetDistToWP(hero, "LEVEL10") < 500)
		&& (Npc_GetDistToWP(hero, "LEVEL10") < Npc_GetDistToWP(hero, "LEVEL11"))
		&& (Npc_GetDistToWP(hero, "LEVEL10") < Npc_GetDistToWP(hero, "LEVEL12"))
		&& (Npc_GetDistToWP(hero, "LEVEL10") < Npc_GetDistToWP(hero, "LEVEL13"))
		{
			PrintScreen	("Fließband", -1, 1, FONT_Screen, 1);

			PrintScreen	("Autor: Bonne", -1, 5, FONT_Screen, 1);

			PrintScreen	(concatStrings("Highscore: ", IntToString(Level10_Highscore)), -1, 9, FONT_Screen, 1);

			if (Level10_Platz > 0)
			{
				PrintScreen	(concatStrings("Platz: ", IntToString(Level10_Platz)), -1, 13, FONT_Screen, 1);
			}
			else
			{
				PrintScreen	("Noch nicht gespielt!", -1, 13, FONT_Screen, 1);
			};

		};

		if (Npc_GetDistToWP(hero, "LEVEL11") < 500)
		&& (Npc_GetDistToWP(hero, "LEVEL11") < Npc_GetDistToWP(hero, "LEVEL10"))
		&& (Npc_GetDistToWP(hero, "LEVEL11") < Npc_GetDistToWP(hero, "LEVEL12"))
		&& (Npc_GetDistToWP(hero, "LEVEL11") < Npc_GetDistToWP(hero, "LEVEL13"))
		{
			PrintScreen	("Level 11", -1, 1, FONT_Screen, 1);

			PrintScreen	("Autor: Jim Hal Wilson", -1, 5, FONT_Screen, 1);

			PrintScreen	(concatStrings("Highscore: ", IntToString(Level11_Highscore)), -1, 9, FONT_Screen, 1);

			if (Level11_Platz > 0)
			{
				PrintScreen	(concatStrings("Platz: ", IntToString(Level11_Platz)), -1, 13, FONT_Screen, 1);
			}
			else
			{
				PrintScreen	("Noch nicht gespielt!", -1, 13, FONT_Screen, 1);
			};

		};

		if (Npc_GetDistToWP(hero, "LEVEL12") < 500)
		&& (Npc_GetDistToWP(hero, "LEVEL12") < Npc_GetDistToWP(hero, "LEVEL11"))
		&& (Npc_GetDistToWP(hero, "LEVEL12") < Npc_GetDistToWP(hero, "LEVEL10"))
		&& (Npc_GetDistToWP(hero, "LEVEL12") < Npc_GetDistToWP(hero, "LEVEL13"))
		{
			PrintScreen	("Racer", -1, 1, FONT_Screen, 1);

			PrintScreen	("Autor: ZaphodBeebleBrox", -1, 5, FONT_Screen, 1);

			PrintScreen	(concatStrings("Highscore: ", IntToString(Level12_Highscore)), -1, 9, FONT_Screen, 1);

			if (Level12_Platz > 0)
			{
				PrintScreen	(concatStrings("Platz: ", IntToString(Level12_Platz)), -1, 13, FONT_Screen, 1);
			}
			else
			{
				PrintScreen	("Noch nicht gespielt!", -1, 13, FONT_Screen, 1);
			};

		};

		if (Npc_GetDistToWP(hero, "LEVEL13") < 500)
		&& (Npc_GetDistToWP(hero, "LEVEL13") < Npc_GetDistToWP(hero, "LEVEL11"))
		&& (Npc_GetDistToWP(hero, "LEVEL13") < Npc_GetDistToWP(hero, "LEVEL10"))
		&& (Npc_GetDistToWP(hero, "LEVEL13") < Npc_GetDistToWP(hero, "LEVEL12"))
		{
			PrintScreen	("Weltraumlevel", -1, 1, FONT_Screen, 1);

			PrintScreen	("Autor: Bonne, Jim Hal Wilson und ZaphodBeebleBrox", -1, 5, FONT_Screen, 1);

			PrintScreen	(concatStrings("Highscore: ", IntToString(Level13_Highscore)), -1, 9, FONT_Screen, 1);

			if (Level13_Platz > 0)
			{
				PrintScreen	(concatStrings("Platz: ", IntToString(Level13_Platz)), -1, 13, FONT_Screen, 1);
			}
			else
			{
				PrintScreen	("Noch nicht gespielt!", -1, 13, FONT_Screen, 1);
			};

		};

		if (Npc_GetDistToWP(hero, "START") < 1000)
		&& (Npc_GetDistToWP(hero, "START") < Npc_GetDistToWP(hero, "LEVEL02"))
		&& (Npc_GetDistToWP(hero, "START") < Npc_GetDistToWP(hero, "LEVEL03"))
		&& (Npc_GetDistToWP(hero, "START") < Npc_GetDistToWP(hero, "LEVEL01"))
		&& (Npc_GetDistToWP(hero, "START") < Npc_GetDistToWP(hero, "LEVEL04"))
		&& (Npc_GetDistToWP(hero, "START") < Npc_GetDistToWP(hero, "LEVEL05"))
		&& (Npc_GetDistToWP(hero, "START") < Npc_GetDistToWP(hero, "LEVEL07"))
		&& (Npc_GetDistToWP(hero, "START") < Npc_GetDistToWP(hero, "LEVEL08"))
		&& (Npc_GetDistToWP(hero, "START") < Npc_GetDistToWP(hero, "LEVEL06"))
		&& (Npc_GetDistToWP(hero, "START") < Npc_GetDistToWP(hero, "LEVEL09"))
		&& (Level01_Gespielt == 1)
		&& (Level02_Gespielt == 1)
		&& (Level03_Gespielt == 1)
		&& (Level04_Gespielt == 1)
		&& (Level05_Gespielt == 1)
		&& (Level06_Gespielt == 1)
		&& (Level07_Gespielt == 1)
		&& (Level08_Gespielt == 1)
		&& (Level09_Gespielt == 1)
		{
			PrintScreen	("Gesamt-Score", -1, 1, FONT_Screen, 1);

			PrintText = concatStrings("Highscore: ", IntToString(Level01_Highscore + Level02_Highscore + Level03_Highscore + Level04_Highscore + Level05_Highscore + Level06_Highscore + Level07_Highscore + Level08_Highscore + Level09_Highscore));

			PrintScreen	(PrintText, -1, 9, FONT_Screen, 1);

		};

		if (Level01_Gespielt == 1)
		&& (Level03_Frei == 0)
		{
			Level03_Frei = 1;

			Wld_SendTrigger	("LEVEL03_FREI");
		};

		if (Level02_Gespielt == 1)
		&& (Level04_Frei == 0)
		{
			Level04_Frei = 1;

			Wld_SendTrigger	("LEVEL04_FREI");
		};

		if (Level06_Gespielt == 1)
		&& (Level08_Frei == 0)
		{
			Level08_Frei = 1;

			Wld_SendTrigger	("LEVEL08_FREI");
		};

		if (Level07_Gespielt == 1)
		&& (Level09_Frei == 0)
		{
			Level09_Frei = 1;

			Wld_SendTrigger	("LEVEL09_FREI");
		};

		if (Level01_Gespielt == 1)
		&& (Level02_Gespielt == 1)
		&& (Level03_Gespielt == 1)
		&& (Level04_Gespielt == 1)
		&& (Level06_Gespielt == 1)
		&& (Level07_Gespielt == 1)
		&& (Level08_Gespielt == 1)
		&& (Level09_Gespielt == 1)
		&& (Level05_Frei == 0)
		{
			Level05_Frei = 1;

			Wld_SendTrigger	("LEVEL05_FREI");
		};

		Check01 = FALSE;
		Check02 = FALSE;
		Check03 = FALSE;
		Check04 = FALSE;
		Check05 = FALSE;
		Check06 = FALSE;
		Check07 = FALSE;

		TimeCounter_Real = -2;
		TimeCounter_Sek = -2;
		TimeCounter_Min = 0;
		TimeCounter_H = 0;

		Wackeldackel_Counter = 0;
		Wagen_Unterwegs = 0;
		Wagen11_Unterwegs = 0;

		StachelMalus = 0;
		LichtCounter = 0;
		Licht10_Counter = 0;
		Licht11_Counter = 0;

		if (Acrobat == 1)
		{
			Mdl_RemoveOverlayMDS	(hero, "HUMANS_ACROBATIC.MDS");

			Acrobat = 0;
		};

		DiveTime = 270;

		Wand_Unterwegs = 0;
	};

	if (C_BodyStateContains(hero, BS_JUMP))
	&& (Huepft == 0)
	&& (HuepftCooli == 0)
	{
		Snd_Play	("JIBOJUMP");

		Huepft = 1;

		HuepftCooli = 3;
	};

	if (HuepftCooli > 0)
	{
		HuepftCooli -= 1;
	};

	if (Huepft == 1)
	&& ((C_BodyStateContains(hero, BS_STAND))
	|| (C_BodyStateContains(hero, BS_RUN)))
	{
		Huepft = 0;
	};

	// Highscore berechnen

	if (CurrentLevel == LEVEL01_ZEN)
	{
		if (Npc_GetDistToWP(hero, "ENDE") < 500)
		&& (ReturnToStartlevel == 0)
		{
			Level01_Highscore_Zeit = TimeCounter_Real;

			Level01_Highscore_Neu = 1000 - (Level01_Highscore_Zeit*4)/5;

			if (Level01_Highscore_Neu <= 0)
			{
				Level01_Highscore_Neu = 1;
			};

			PrintText = concatStrings("Erreichte Punkte: ", IntToString(Level01_Highscore_Neu));

			PrintScreen (PrintText, -1, YPOS_LevelUp, FONT_Screen, 1);

			if (Level01_Highscore_Neu > Level01_Highscore)
			{	
				PrintScreen ("Neuer Highscore!", -1, YPOS_LevelUp+4, FONT_Screen, 1);		

				Level01_Highscore = Level01_Highscore_Neu;

				if (Offline_Modus == 0)
				{
					CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/insert.php?name=", username), "&points="), IntToString(Level01_Highscore)), "&id=4&version=110"));
				};
			};

			ReturnToStartlevel = 1;
		
			Level01_Gespielt = TRUE;
		};
	};	

	if (CurrentLevel == LEVEL02_ZEN)
	{
		if (Npc_GetDistToWP(hero, "ENDE") < 500)
		&& (ReturnToStartlevel == 0)
		{
			Level02_Highscore_Zeit = TimeCounter_Real;

			Level02_Highscore_Neu = 1000 - (Level02_Highscore_Zeit*4)/5;

			if (Level02_Highscore_Neu <= 0)
			{
				Level02_Highscore_Neu = 1;
			};

			PrintText = concatStrings("Erreichte Punkte: ", IntToString(Level02_Highscore_Neu));

			PrintScreen (PrintText, -1, YPOS_LevelUp, FONT_Screen, 1);

			if (Level02_Highscore_Neu > Level02_Highscore)
			{	
				PrintScreen ("Neuer Highscore!", -1, YPOS_LevelUp+4, FONT_Screen, 1);		

				Level02_Highscore = Level02_Highscore_Neu;

				if (Offline_Modus == 0)
				{
					CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/insert.php?name=", username), "&points="), IntToString(Level02_Highscore)), "&id=6&version=110"));
				};
			};

			ReturnToStartlevel = 1;

			Level02_Gespielt = TRUE;
		};

		if (Npc_GetDistToWP(hero, "WACKELDACKEL") < 500)
		&& (Wackeldackel_Counter == 0)
		{
			Wld_PlayEffect ("SLOW_TIME_CHILD2", hero, hero, 0, 0, 0, FALSE);

			Wackeldackel_Counter = 1;
		};
	};

	if (CurrentLevel == LEVEL03_ZEN)
	{
		if (Npc_GetDistToWP(hero, "ENDE") < 500)
		&& (ReturnToStartlevel == 0)
		{
			Level03_Highscore_Zeit = TimeCounter_Real;

			Level03_Highscore_Neu = 1000 - (Level03_Highscore_Zeit*4)/5;

			if (Level03_Highscore_Neu <= 0)
			{
				Level03_Highscore_Neu = 1;
			};

			PrintText = concatStrings("Erreichte Punkte: ", IntToString(Level03_Highscore_Neu));

			PrintScreen (PrintText, -1, YPOS_LevelUp, FONT_Screen, 1);

			if (Level03_Highscore_Neu > Level03_Highscore)
			{	
				PrintScreen ("Neuer Highscore!", -1, YPOS_LevelUp+4, FONT_Screen, 1);		

				Level03_Highscore = Level03_Highscore_Neu;

				if (Offline_Modus == 0)
				{
					CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/insert.php?name=", username), "&points="), IntToString(Level03_Highscore)), "&id=5&version=110"));
				};
			};

			ReturnToStartlevel = 1;

			Level03_Gespielt = TRUE;
		};
	};

	if (CurrentLevel == LEVEL04_ZEN)
	{
		if (Npc_GetDistToWP(hero, "ENDE") < 500)
		&& (ReturnToStartlevel == 0)
		{
			Level04_Highscore_Zeit = TimeCounter_Real;

			Level04_Highscore_Neu = 1000 - (Level04_Highscore_Zeit*4)/5;

			if (Level04_Highscore_Neu <= 0)
			{
				Level04_Highscore_Neu = 1;
			};

			PrintText = concatStrings("Erreichte Punkte: ", IntToString(Level04_Highscore_Neu));

			PrintScreen (PrintText, -1, YPOS_LevelUp, FONT_Screen, 1);

			if (Level04_Highscore_Neu > Level04_Highscore)
			{	
				PrintScreen ("Neuer Highscore!", -1, YPOS_LevelUp+4, FONT_Screen, 1);		

				Level04_Highscore = Level04_Highscore_Neu;

				if (Offline_Modus == 0)
				{
					CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/insert.php?name=", username), "&points="), IntToString(Level04_Highscore)), "&id=7&version=110"));
				};
			};

			ReturnToStartlevel = 1;

			Level04_Gespielt = TRUE;
		};

		if (Npc_GetDistToWP(hero, "WACKELDACKEL") < 500)
		&& (Wackeldackel_Counter == 0)
		{
			Wld_PlayEffect ("SLOW_TIME_CHILD2", hero, hero, 0, 0, 0, FALSE);

			Wackeldackel_Counter = 1;
		};
	};

	if (CurrentLevel == LEVEL05_ZEN)
	{
		if (Npc_GetDistToWP(hero, "ENDE") < 300)
		&& (ReturnToStartlevel == 0)
		{
			Level05_Highscore_Zeit = TimeCounter_Real;

			Level05_Highscore_Neu = 20*LichtCounter-StachelMalus;

			if (Level05_Highscore_Neu <= 0)
			{
				Level05_Highscore_Neu = 1;
			};

			PrintText = concatStrings("Erreichte Punkte: ", IntToString(Level05_Highscore_Neu));

			PrintScreen (PrintText, -1, YPOS_LevelUp, FONT_Screen, 1);

			if (Level05_Highscore_Neu > Level05_Highscore)
			{	
				PrintScreen ("Neuer Highscore!", -1, YPOS_LevelUp+4, FONT_Screen, 1);		

				Level05_Highscore = Level05_Highscore_Neu;

				if (Offline_Modus == 0)
				{
					CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/insert.php?name=", username), "&points="), IntToString(Level05_Highscore)), "&id=12&version=110"));
				};
			};

			ReturnToStartlevel = 1;

			Level05_Gespielt = TRUE;
		};

		if (Npc_GetDistToWP(hero, "START") < 500)
		&& (Wand01_Unterwegs == 0)
		{
			Wld_SendTrigger	("EVT_LEVEL05_START");

			Level05_Counter = 0;

			if (ItemLevel0501 == 0)
			{
				Wld_InsertItem	(Irgendwas2_01, "FP_ITEM_01");

				ItemLevel0501 = 1;
			};
			if (ItemLevel0502 == 0)
			{
				Wld_InsertItem	(Irgendwas2_02, "FP_ITEM_02");

				ItemLevel0502 = 1;
			};
			if (ItemLevel0503 == 0)
			{
				Wld_InsertItem	(Irgendwas2_03, "FP_ITEM_03");

				ItemLevel0503 = 1;
			};
			if (ItemLevel0504 == 0)
			{
				Wld_InsertItem	(Irgendwas2_04, "FP_ITEM_04");

				ItemLevel0504 = 1;
			};
			if (ItemLevel0505 == 0)
			{
				Wld_InsertItem	(Irgendwas2_05, "FP_ITEM_05");

				ItemLevel0505 = 1;
			};
			if (ItemLevel0506 == 0)
			{
				Wld_InsertItem	(Irgendwas2_06, "FP_ITEM_06");

				ItemLevel0506 = 1;
			};
			if (ItemLevel0507 == 0)
			{
				Wld_InsertItem	(Irgendwas2_07, "FP_ITEM_07");

				ItemLevel0507 = 1;
			};
			if (ItemLevel0508 == 0)
			{
				Wld_InsertItem	(Irgendwas2_08, "FP_ITEM_08");

				ItemLevel0508 = 1;
			};
			if (ItemLevel0509 == 0)
			{
				Wld_InsertItem	(Irgendwas2_09, "FP_ITEM_09");

				ItemLevel0509 = 1;
			};
			if (ItemLevel0510 == 0)
			{
				Wld_InsertItem	(Irgendwas2_10, "FP_ITEM_10");

				ItemLevel0510 = 1;
			};
			if (ItemLevel0511 == 0)
			{
				Wld_InsertItem	(Irgendwas2_11, "FP_ITEM_11");

				ItemLevel0511 = 1;
			};
			if (ItemLevel0512 == 0)
			{
				Wld_InsertItem	(Irgendwas2_12, "FP_ITEM_12");

				ItemLevel0512 = 1;
			};
			if (ItemLevel0513 == 0)
			{
				Wld_InsertItem	(Irgendwas2_13, "FP_ITEM_13");

				ItemLevel0513 = 1;
			};
			if (ItemLevel0514 == 0)
			{
				Wld_InsertItem	(Irgendwas2_14, "FP_ITEM_14");

				ItemLevel0514 = 1;
			};
			if (ItemLevel0515 == 0)
			{
				Wld_InsertItem	(Irgendwas2_15, "FP_ITEM_15");

				ItemLevel0515 = 1;
			};
			if (ItemLevel0516 == 0)
			{
				Wld_InsertItem	(Irgendwas2_16, "FP_ITEM_16");

				ItemLevel0516 = 1;
			};
			if (ItemLevel0517 == 0)
			{
				Wld_InsertItem	(Irgendwas2_17, "FP_ITEM_17");

				ItemLevel0517 = 1;
			};
			if (ItemLevel0518 == 0)
			{
				Wld_InsertItem	(Irgendwas2_18, "FP_ITEM_18");

				ItemLevel0518 = 1;
			};
			if (ItemLevel0519 == 0)
			{
				Wld_InsertItem	(Irgendwas2_19, "FP_ITEM_19");

				ItemLevel0519 = 1;
			};
			if (ItemLevel0520 == 0)
			{
				Wld_InsertItem	(Irgendwas2_20, "FP_ITEM_20");

				ItemLevel0520 = 1;
			};
			if (ItemLevel0521 == 0)
			{
				Wld_InsertItem	(Irgendwas2_21, "FP_ITEM_21");

				ItemLevel0521 = 1;
			};
			if (ItemLevel0522 == 0)
			{
				Wld_InsertItem	(Irgendwas2_22, "FP_ITEM_22");

				ItemLevel0522 = 1;
			};
			if (ItemLevel0523 == 0)
			{
				Wld_InsertItem	(Irgendwas2_23, "FP_ITEM_23");

				ItemLevel0523 = 1;
			};
			if (ItemLevel0524 == 0)
			{
				Wld_InsertItem	(Irgendwas2_24, "FP_ITEM_24");

				ItemLevel0524 = 1;
			};
			if (ItemLevel0525 == 0)
			{
				Wld_InsertItem	(Irgendwas2_25, "FP_ITEM_25");

				ItemLevel0525 = 1;
			};
			if (ItemLevel0526 == 0)
			{
				Wld_InsertItem	(Irgendwas2_26, "FP_ITEM_26");

				ItemLevel0526 = 1;
			};
			if (ItemLevel0527 == 0)
			{
				Wld_InsertItem	(Irgendwas2_27, "FP_ITEM_27");

				ItemLevel0527 = 1;
			};
			if (ItemLevel0528 == 0)
			{
				Wld_InsertItem	(Irgendwas2_28, "FP_ITEM_28");

				ItemLevel0528 = 1;
			};
			if (ItemLevel0529 == 0)
			{
				Wld_InsertItem	(Irgendwas2_29, "FP_ITEM_29");

				ItemLevel0529 = 1;
			};
			if (ItemLevel0530 == 0)
			{
				Wld_InsertItem	(Irgendwas2_30, "FP_ITEM_30");

				ItemLevel0530 = 1;
			};
			if (ItemLevel0531 == 0)
			{
				Wld_InsertItem	(Irgendwas2_31, "FP_ITEM_31");

				ItemLevel0531 = 1;
			};
			if (ItemLevel0532 == 0)
			{
				Wld_InsertItem	(Irgendwas2_32, "FP_ITEM_32");

				ItemLevel0532 = 1;
			};
			if (ItemLevel0533 == 0)
			{
				Wld_InsertItem	(Irgendwas2_33, "FP_ITEM_33");

				ItemLevel0533 = 1;
			};
			if (ItemLevel0534 == 0)
			{
				Wld_InsertItem	(Irgendwas2_34, "FP_ITEM_34");

				ItemLevel0534 = 1;
			};
			if (ItemLevel0535 == 0)
			{
				Wld_InsertItem	(Irgendwas2_35, "FP_ITEM_35");

				ItemLevel0535 = 1;
			};
			if (ItemLevel0536 == 0)
			{
				Wld_InsertItem	(Irgendwas2_36, "FP_ITEM_36");

				ItemLevel0536 = 1;
			};
			if (ItemLevel0537 == 0)
			{
				Wld_InsertItem	(Irgendwas2_37, "FP_ITEM_37");

				ItemLevel0537 = 1;
			};
			if (ItemLevel0538 == 0)
			{
				Wld_InsertItem	(Irgendwas2_38, "FP_ITEM_38");

				ItemLevel0538 = 1;
			};
			if (ItemLevel0539 == 0)
			{
				Wld_InsertItem	(Irgendwas2_39, "FP_ITEM_39");

				ItemLevel0539 = 1;
			};
			if (ItemLevel0540 == 0)
			{
				Wld_InsertItem	(Irgendwas2_40, "FP_ITEM_40");

				ItemLevel0540 = 1;
			};
			if (ItemLevel0541 == 0)
			{
				Wld_InsertItem	(Irgendwas2_41, "FP_ITEM_41");

				ItemLevel0541 = 1;
			};
			if (ItemLevel0542 == 0)
			{
				Wld_InsertItem	(Irgendwas2_42, "FP_ITEM_42");

				ItemLevel0542 = 1;
			};
			if (ItemLevel0543 == 0)
			{
				Wld_InsertItem	(Irgendwas2_43, "FP_ITEM_43");

				ItemLevel0543 = 1;
			};
			if (ItemLevel0544 == 0)
			{
				Wld_InsertItem	(Irgendwas2_44, "FP_ITEM_44");

				ItemLevel0544 = 1;
			};
			if (ItemLevel0545 == 0)
			{
				Wld_InsertItem	(Irgendwas2_45, "FP_ITEM_45");

				ItemLevel0545 = 1;
			};
			if (ItemLevel0546 == 0)
			{
				Wld_InsertItem	(Irgendwas2_46, "FP_ITEM_46");

				ItemLevel0546 = 1;
			};
			if (ItemLevel0547 == 0)
			{
				Wld_InsertItem	(Irgendwas2_47, "FP_ITEM_47");

				ItemLevel0547 = 1;
			};
			if (ItemLevel0548 == 0)
			{
				Wld_InsertItem	(Irgendwas2_48, "FP_ITEM_48");

				ItemLevel0548 = 1;
			};
			if (ItemLevel0549 == 0)
			{
				Wld_InsertItem	(Irgendwas2_49, "FP_ITEM_49");

				ItemLevel0549 = 1;
			};
			if (ItemLevel0550 == 0)
			{
				Wld_InsertItem	(Irgendwas2_50, "FP_ITEM_50");

				ItemLevel0550 = 1;
			};
		};
	};

	if (CurrentLevel == LEVEL06_ZEN)
	{
		if (Npc_GetDistToWP(hero, "ENDE") < 500)
		&& (ReturnToStartlevel == 0)
		{
			Level06_Highscore_Zeit = TimeCounter_Real;

			Level06_Highscore_Neu = 1000 - (Level06_Highscore_Zeit*4)/5;

			if (Level06_Highscore_Neu <= 0)
			{
				Level06_Highscore_Neu = 1;
			};

			PrintText = concatStrings("Erreichte Punkte: ", IntToString(Level06_Highscore_Neu));

			PrintScreen (PrintText, -1, YPOS_LevelUp, FONT_Screen, 1);

			if (Level06_Highscore_Neu > Level06_Highscore)
			{	
				PrintScreen ("Neuer Highscore!", -1, YPOS_LevelUp+4, FONT_Screen, 1);		

				Level06_Highscore = Level06_Highscore_Neu;

				if (Offline_Modus == 0)
				{
					CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/insert.php?name=", username), "&points="), IntToString(Level06_Highscore)), "&id=8&version=110"));
				};
			};

			ReturnToStartlevel = 1;

			Level06_Gespielt = TRUE;
		};

		if (Npc_GetDistToWP(hero, "START") < 500)
		{
			if (Acrobat == 0)
			{
				Mdl_ApplyOverlayMDS	(hero, "HUMANS_ACROBATIC.MDS");

				Acrobat = 1;
			};
		};
	};

	if (CurrentLevel == LEVEL07_ZEN)
	{
		if ((Npc_GetDistToWP(hero, "ENDE") < 500)
		|| (DiveTime <= 0))
		&& (ReturnToStartlevel == 0)
		{
			Level07_Highscore_Zeit = TimeCounter_Real;

			Level07_Highscore_Neu = 20*LichtCounter;

			if (Level07_Highscore_Neu <= 0)
			|| (DiveTime <= 0)
			{
				Level07_Highscore_Neu = 1;
			};

			PrintText = concatStrings("Erreichte Punkte: ", IntToString(Level07_Highscore_Neu));

			PrintScreen (PrintText, -1, YPOS_LevelUp, FONT_Screen, 1);

			if (Level07_Highscore_Neu > Level07_Highscore)
			{	
				PrintScreen ("Neuer Highscore!", -1, YPOS_LevelUp+4, FONT_Screen, 1);		

				Level07_Highscore = Level07_Highscore_Neu;

				if (Offline_Modus == 0)
				{
					CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/insert.php?name=", username), "&points="), IntToString(Level07_Highscore)), "&id=10&version=110"));
				};
			};

			ReturnToStartlevel = 1;

			Wand_Unterwegs = 0;

			Level07_Gespielt = TRUE;
		};

		if (Npc_GetDistToWP(hero, "START") < 500)
		&& (Wand_Unterwegs == 0)
		{
			Wand_Unterwegs = 1;

			if (Item01 == 0)
			{
				Wld_InsertItem	(Irgendwas_01, "FP_ITEM_01");

				Item01 = 1;
			};
			if (Item02 == 0)
			{
				Wld_InsertItem	(Irgendwas_02, "FP_ITEM_02");

				Item02 = 1;
			};
			if (Item03 == 0)
			{
				Wld_InsertItem	(Irgendwas_03, "FP_ITEM_03");

				Item03 = 1;
			};
			if (Item04 == 0)
			{
				Wld_InsertItem	(Irgendwas_04, "FP_ITEM_04");

				Item04 = 1;
			};
			if (Item05 == 0)
			{
				Wld_InsertItem	(Irgendwas_05, "FP_ITEM_05");

				Item05 = 1;
			};
			if (Item06 == 0)
			{
				Wld_InsertItem	(Irgendwas_06, "FP_ITEM_06");

				Item06 = 1;
			};
			if (Item07 == 0)
			{
				Wld_InsertItem	(Irgendwas_07, "FP_ITEM_07");

				Item07 = 1;
			};
			if (Item08 == 0)
			{
				Wld_InsertItem	(Irgendwas_08, "FP_ITEM_08");

				Item08 = 1;
			};
			if (Item09 == 0)
			{
				Wld_InsertItem	(Irgendwas_09, "FP_ITEM_09");

				Item09 = 1;
			};
			if (Item10 == 0)
			{
				Wld_InsertItem	(Irgendwas_10, "FP_ITEM_10");

				Item10 = 1;
			};
			if (Item11 == 0)
			{
				Wld_InsertItem	(Irgendwas_11, "FP_ITEM_11");

				Item11 = 1;
			};
			if (Item12 == 0)
			{
				Wld_InsertItem	(Irgendwas_12, "FP_ITEM_12");

				Item12 = 1;
			};
			if (Item13 == 0)
			{
				Wld_InsertItem	(Irgendwas_13, "FP_ITEM_13");

				Item13 = 1;
			};
			if (Item14 == 0)
			{
				Wld_InsertItem	(Irgendwas_14, "FP_ITEM_14");

				Item14 = 1;
			};
			if (Item15 == 0)
			{
				Wld_InsertItem	(Irgendwas_15, "FP_ITEM_15");

				Item15 = 1;
			};
			if (Item16 == 0)
			{
				Wld_InsertItem	(Irgendwas_16, "FP_ITEM_16");

				Item16 = 1;
			};
			if (Item17 == 0)
			{
				Wld_InsertItem	(Irgendwas_17, "FP_ITEM_17");

				Item17 = 1;
			};
			if (Item18 == 0)
			{
				Wld_InsertItem	(Irgendwas_18, "FP_ITEM_18");

				Item18 = 1;
			};
			if (Item19 == 0)
			{
				Wld_InsertItem	(Irgendwas_19, "FP_ITEM_19");

				Item19 = 1;
			};
			if (Item20 == 0)
			{
				Wld_InsertItem	(Irgendwas_20, "FP_ITEM_20");

				Item20 = 1;
			};
			if (Item21 == 0)
			{
				Wld_InsertItem	(Irgendwas_21, "FP_ITEM_21");

				Item21 = 1;
			};
			if (Item22 == 0)
			{
				Wld_InsertItem	(Irgendwas_22, "FP_ITEM_22");

				Item22 = 1;
			};
			if (Item23 == 0)
			{
				Wld_InsertItem	(Irgendwas_23, "FP_ITEM_23");

				Item23 = 1;
			};
			if (Item24 == 0)
			{
				Wld_InsertItem	(Irgendwas_24, "FP_ITEM_24");

				Item24 = 1;
			};
			if (Item25 == 0)
			{
				Wld_InsertItem	(Irgendwas_25, "FP_ITEM_25");

				Item25 = 1;
			};
			if (Item26 == 0)
			{
				Wld_InsertItem	(Irgendwas_26, "FP_ITEM_26");

				Item26 = 1;
			};
			if (Item27 == 0)
			{
				Wld_InsertItem	(Irgendwas_27, "FP_ITEM_27");

				Item27 = 1;
			};
			if (Item28 == 0)
			{
				Wld_InsertItem	(Irgendwas_28, "FP_ITEM_28");

				Item28 = 1;
			};
			if (Item29 == 0)
			{
				Wld_InsertItem	(Irgendwas_29, "FP_ITEM_29");

				Item29 = 1;
			};
			if (Item30 == 0)
			{
				Wld_InsertItem	(Irgendwas_30, "FP_ITEM_30");

				Item30 = 1;
			};
			if (Item31 == 0)
			{
				Wld_InsertItem	(Irgendwas_31, "FP_ITEM_31");

				Item31 = 1;
			};
			if (Item32 == 0)
			{
				Wld_InsertItem	(Irgendwas_32, "FP_ITEM_32");

				Item32 = 1;
			};
			if (Item33 == 0)
			{
				Wld_InsertItem	(Irgendwas_33, "FP_ITEM_33");

				Item33 = 1;
			};
			if (Item34 == 0)
			{
				Wld_InsertItem	(Irgendwas_34, "FP_ITEM_34");

				Item34 = 1;
			};
			if (Item35 == 0)
			{
				Wld_InsertItem	(Irgendwas_35, "FP_ITEM_35");

				Item35 = 1;
			};
			if (Item36 == 0)
			{
				Wld_InsertItem	(Irgendwas_36, "FP_ITEM_36");

				Item36 = 1;
			};
			if (Item37 == 0)
			{
				Wld_InsertItem	(Irgendwas_37, "FP_ITEM_37");

				Item37 = 1;
			};
			if (Item38 == 0)
			{
				Wld_InsertItem	(Irgendwas_38, "FP_ITEM_38");

				Item38 = 1;
			};
			if (Item39 == 0)
			{
				Wld_InsertItem	(Irgendwas_39, "FP_ITEM_39");

				Item39 = 1;
			};
			if (Item40 == 0)
			{
				Wld_InsertItem	(Irgendwas_40, "FP_ITEM_40");

				Item40 = 1;
			};
			if (Item41 == 0)
			{
				Wld_InsertItem	(Irgendwas_41, "FP_ITEM_41");

				Item41 = 1;
			};
			if (Item42 == 0)
			{
				Wld_InsertItem	(Irgendwas_42, "FP_ITEM_42");

				Item42 = 1;
			};
			if (Item43 == 0)
			{
				Wld_InsertItem	(Irgendwas_43, "FP_ITEM_43");

				Item43 = 1;
			};
			if (Item44 == 0)
			{
				Wld_InsertItem	(Irgendwas_44, "FP_ITEM_44");

				Item44 = 1;
			};
			if (Item45 == 0)
			{
				Wld_InsertItem	(Irgendwas_45, "FP_ITEM_45");

				Item45 = 1;
			};
			if (Item46 == 0)
			{
				Wld_InsertItem	(Irgendwas_46, "FP_ITEM_46");

				Item46 = 1;
			};
			if (Item47 == 0)
			{
				Wld_InsertItem	(Irgendwas_47, "FP_ITEM_47");

				Item47 = 1;
			};
			if (Item48 == 0)
			{
				Wld_InsertItem	(Irgendwas_48, "FP_ITEM_48");

				Item48 = 1;
			};
			if (Item49 == 0)
			{
				Wld_InsertItem	(Irgendwas_49, "FP_ITEM_49");

				Item49 = 1;
			};
			if (Item50 == 0)
			{
				Wld_InsertItem	(Irgendwas_50, "FP_ITEM_50");

				Item50 = 1;
			};
		};

		if (Npc_GetDistToItem(hero, Irgendwas_01) < 100)
		&& (Item01 == 1)
		{
			Wld_RemoveItem	(Irgendwas_01);
			Item01 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_02) < 100)
		&& (Item02 == 1)
		{
			Wld_RemoveItem	(Irgendwas_02);
			Item02 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_03) < 100)
		&& (Item03 == 1)
		{
			Wld_RemoveItem	(Irgendwas_03);
			Item03 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_04) < 100)
		&& (Item04 == 1)
		{
			Wld_RemoveItem	(Irgendwas_04);
			Item04 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_05) < 100)
		&& (Item05 == 1)
		{
			Wld_RemoveItem	(Irgendwas_05);
			Item05 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_06) < 100)
		&& (Item06 == 1)
		{
			Wld_RemoveItem	(Irgendwas_06);
			Item06 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_07) < 100)
		&& (Item07 == 1)
		{
			Wld_RemoveItem	(Irgendwas_07);
			Item07 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_08) < 100)
		&& (Item08 == 1)
		{
			Wld_RemoveItem	(Irgendwas_08);
			Item08 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_09) < 100)
		&& (Item09 == 1)
		{
			Wld_RemoveItem	(Irgendwas_09);
			Item09 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_10) < 100)
		&& (Item10 == 1)
		{
			Wld_RemoveItem	(Irgendwas_10);
			Item10 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_11) < 100)
		&& (Item11 == 1)
		{
			Wld_RemoveItem	(Irgendwas_11);
			Item11 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_12) < 100)
		&& (Item12 == 1)
		{
			Wld_RemoveItem	(Irgendwas_12);
			Item12 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_13) < 100)
		&& (Item13 == 1)
		{
			Wld_RemoveItem	(Irgendwas_13);
			Item13 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_14) < 100)
		&& (Item14 == 1)
		{
			Wld_RemoveItem	(Irgendwas_14);
			Item14 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_15) < 100)
		&& (Item15 == 1)
		{
			Wld_RemoveItem	(Irgendwas_15);
			Item15 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_16) < 100)
		&& (Item16 == 1)
		{
			Wld_RemoveItem	(Irgendwas_16);
			Item16 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_17) < 100)
		&& (Item17 == 1)
		{
			Wld_RemoveItem	(Irgendwas_17);
			Item17 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_18) < 100)
		&& (Item18 == 1)
		{
			Wld_RemoveItem	(Irgendwas_18);
			Item18 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_19) < 100)
		&& (Item19 == 1)
		{
			Wld_RemoveItem	(Irgendwas_19);
			Item19 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_20) < 100)
		&& (Item20 == 1)
		{
			Wld_RemoveItem	(Irgendwas_20);
			Item20 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_21) < 100)
		&& (Item21 == 1)
		{
			Wld_RemoveItem	(Irgendwas_21);
			Item21 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_22) < 100)
		&& (Item22 == 1)
		{
			Wld_RemoveItem	(Irgendwas_22);
			Item22 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_23) < 100)
		&& (Item23 == 1)
		{
			Wld_RemoveItem	(Irgendwas_23);
			Item23 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_24) < 100)
		&& (Item24 == 1)
		{
			Wld_RemoveItem	(Irgendwas_24);
			Item24 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_25) < 100)
		&& (Item25 == 1)
		{
			Wld_RemoveItem	(Irgendwas_25);
			Item25 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_26) < 100)
		&& (Item26 == 1)
		{
			Wld_RemoveItem	(Irgendwas_26);
			Item26 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_27) < 100)
		&& (Item27 == 1)
		{
			Wld_RemoveItem	(Irgendwas_27);
			Item27 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_28) < 100)
		&& (Item28 == 1)
		{
			Wld_RemoveItem	(Irgendwas_28);
			Item28 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_29) < 100)
		&& (Item29 == 1)
		{
			Wld_RemoveItem	(Irgendwas_29);
			Item29 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_30) < 100)
		&& (Item30 == 1)
		{
			Wld_RemoveItem	(Irgendwas_30);
			Item30 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_31) < 100)
		&& (Item31 == 1)
		{
			Wld_RemoveItem	(Irgendwas_31);
			Item31 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_32) < 100)
		&& (Item32 == 1)
		{
			Wld_RemoveItem	(Irgendwas_32);
			Item32 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_33) < 100)
		&& (Item33 == 1)
		{
			Wld_RemoveItem	(Irgendwas_33);
			Item33 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_34) < 100)
		&& (Item34 == 1)
		{
			Wld_RemoveItem	(Irgendwas_34);
			Item34 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_35) < 100)
		&& (Item35 == 1)
		{
			Wld_RemoveItem	(Irgendwas_35);
			Item35 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_36) < 100)
		&& (Item36 == 1)
		{
			Wld_RemoveItem	(Irgendwas_36);
			Item36 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_37) < 100)
		&& (Item37 == 1)
		{
			Wld_RemoveItem	(Irgendwas_37);
			Item37 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_38) < 100)
		&& (Item38 == 1)
		{
			Wld_RemoveItem	(Irgendwas_38);
			Item38 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_39) < 100)
		&& (Item39 == 1)
		{
			Wld_RemoveItem	(Irgendwas_39);
			Item39 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_40) < 100)
		&& (Item40 == 1)
		{
			Wld_RemoveItem	(Irgendwas_40);
			Item40 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_41) < 100)
		&& (Item41 == 1)
		{
			Wld_RemoveItem	(Irgendwas_41);
			Item41 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_42) < 100)
		&& (Item42 == 1)
		{
			Wld_RemoveItem	(Irgendwas_42);
			Item42 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_43) < 100)
		&& (Item43 == 1)
		{
			Wld_RemoveItem	(Irgendwas_43);
			Item43 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_44) < 100)
		&& (Item44 == 1)
		{
			Wld_RemoveItem	(Irgendwas_44);
			Item44 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_45) < 100)
		&& (Item45 == 1)
		{
			Wld_RemoveItem	(Irgendwas_45);
			Item45 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_46) < 100)
		&& (Item46 == 1)
		{
			Wld_RemoveItem	(Irgendwas_46);
			Item46 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_47) < 100)
		&& (Item47 == 1)
		{
			Wld_RemoveItem	(Irgendwas_47);
			Item47 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_48) < 100)
		&& (Item48 == 1)
		{
			Wld_RemoveItem	(Irgendwas_48);
			Item48 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_49) < 100)
		&& (Item49 == 1)
		{
			Wld_RemoveItem	(Irgendwas_49);
			Item49 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_50) < 100)
		&& (Item50 == 1)
		{
			Wld_RemoveItem	(Irgendwas_50);
			Item50 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
	};

	if (CurrentLevel == LEVEL08_ZEN)
	{
		if (Npc_GetDistToWP(hero, "ENDE") < 500)
		&& (ReturnToStartlevel == 0)
		{
			Level08_Highscore_Zeit = TimeCounter_Real;

			Level08_Highscore_Neu = 1000 - (Level08_Highscore_Zeit*4)/5;

			if (Level08_Highscore_Neu <= 0)
			{
				Level08_Highscore_Neu = 1;
			};

			PrintText = concatStrings("Erreichte Punkte: ", IntToString(Level08_Highscore_Neu));

			PrintScreen (PrintText, -1, YPOS_LevelUp, FONT_Screen, 1);

			if (Level08_Highscore_Neu > Level08_Highscore)
			{	
				PrintScreen ("Neuer Highscore!", -1, YPOS_LevelUp+4, FONT_Screen, 1);		

				Level08_Highscore = Level08_Highscore_Neu;

				if (Offline_Modus == 0)
				{
					CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/insert.php?name=", username), "&points="), IntToString(Level08_Highscore)), "&id=9&version=110"));
				};
			};

			ReturnToStartlevel = 1;

			Level08_Gespielt = TRUE;
		};

		if (Npc_GetDistToWP(hero, "START") < 500)
		{
			if (Acrobat == 0)
			{
				Mdl_ApplyOverlayMDS	(hero, "HUMANS_ACROBATIC.MDS");

				Acrobat = 1;
			};
		};
	};

	if (CurrentLevel == LEVEL09_ZEN)
	{
		if ((Npc_GetDistToWP(hero, "ENDE") < 500)
		|| (DiveTime == 0))
		&& (ReturnToStartlevel == 0)
		{
			Level09_Highscore_Zeit = TimeCounter_Real;

			Level09_Highscore_Neu = 20*LichtCounter;

			if (Level09_Highscore_Neu <= 0)
			|| (DiveTime <= 0)
			{
				Level09_Highscore_Neu = 1;
			};

			PrintText = concatStrings("Erreichte Punkte: ", IntToString(Level09_Highscore_Neu));

			PrintScreen (PrintText, -1, YPOS_LevelUp, FONT_Screen, 1);

			if (Level09_Highscore_Neu > Level09_Highscore)
			{	
				PrintScreen ("Neuer Highscore!", -1, YPOS_LevelUp+4, FONT_Screen, 1);		

				Level09_Highscore = Level09_Highscore_Neu;

				if (Offline_Modus == 0)
				{
					CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/insert.php?name=", username), "&points="), IntToString(Level09_Highscore)), "&id=11&version=110"));
				};
			};

			ReturnToStartlevel = 1;

			Wand_Unterwegs = 0;

			Level09_Gespielt = TRUE;
		};

		if (Npc_GetDistToWP(hero, "START") < 500)
		&& (Wand_Unterwegs == 0)
		{
			Wand_Unterwegs = 1;

			if (Item201 == 0)
			{
				Wld_InsertItem	(Irgendwas_01, "FP_ITEM_01");

				Item201 = 1;
			};
			if (Item202 == 0)
			{
				Wld_InsertItem	(Irgendwas_02, "FP_ITEM_02");

				Item202 = 1;
			};
			if (Item203 == 0)
			{
				Wld_InsertItem	(Irgendwas_03, "FP_ITEM_03");

				Item203 = 1;
			};
			if (Item204 == 0)
			{
				Wld_InsertItem	(Irgendwas_04, "FP_ITEM_04");

				Item204 = 1;
			};
			if (Item205 == 0)
			{
				Wld_InsertItem	(Irgendwas_05, "FP_ITEM_05");

				Item205 = 1;
			};
			if (Item206 == 0)
			{
				Wld_InsertItem	(Irgendwas_06, "FP_ITEM_06");

				Item206 = 1;
			};
			if (Item207 == 0)
			{
				Wld_InsertItem	(Irgendwas_07, "FP_ITEM_07");

				Item207 = 1;
			};
			if (Item208 == 0)
			{
				Wld_InsertItem	(Irgendwas_08, "FP_ITEM_08");

				Item208 = 1;
			};
			if (Item209 == 0)
			{
				Wld_InsertItem	(Irgendwas_09, "FP_ITEM_09");

				Item209 = 1;
			};
			if (Item210 == 0)
			{
				Wld_InsertItem	(Irgendwas_10, "FP_ITEM_10");

				Item210 = 1;
			};
			if (Item211 == 0)
			{
				Wld_InsertItem	(Irgendwas_11, "FP_ITEM_11");

				Item211 = 1;
			};
			if (Item212 == 0)
			{
				Wld_InsertItem	(Irgendwas_12, "FP_ITEM_12");

				Item212 = 1;
			};
			if (Item213 == 0)
			{
				Wld_InsertItem	(Irgendwas_13, "FP_ITEM_13");

				Item213 = 1;
			};
			if (Item214 == 0)
			{
				Wld_InsertItem	(Irgendwas_14, "FP_ITEM_14");

				Item214 = 1;
			};
			if (Item215 == 0)
			{
				Wld_InsertItem	(Irgendwas_15, "FP_ITEM_15");

				Item215 = 1;
			};
			if (Item216 == 0)
			{
				Wld_InsertItem	(Irgendwas_16, "FP_ITEM_16");

				Item216 = 1;
			};
			if (Item217 == 0)
			{
				Wld_InsertItem	(Irgendwas_17, "FP_ITEM_17");

				Item217 = 1;
			};
			if (Item218 == 0)
			{
				Wld_InsertItem	(Irgendwas_18, "FP_ITEM_18");

				Item218 = 1;
			};
			if (Item219 == 0)
			{
				Wld_InsertItem	(Irgendwas_19, "FP_ITEM_19");

				Item219 = 1;
			};
			if (Item220 == 0)
			{
				Wld_InsertItem	(Irgendwas_20, "FP_ITEM_20");

				Item220 = 1;
			};
			if (Item221 == 0)
			{
				Wld_InsertItem	(Irgendwas_21, "FP_ITEM_21");

				Item221 = 1;
			};
			if (Item222 == 0)
			{
				Wld_InsertItem	(Irgendwas_22, "FP_ITEM_22");

				Item222 = 1;
			};
			if (Item223 == 0)
			{
				Wld_InsertItem	(Irgendwas_23, "FP_ITEM_23");

				Item223 = 1;
			};
			if (Item224 == 0)
			{
				Wld_InsertItem	(Irgendwas_24, "FP_ITEM_24");

				Item224 = 1;
			};
			if (Item225 == 0)
			{
				Wld_InsertItem	(Irgendwas_25, "FP_ITEM_25");

				Item225 = 1;
			};
			if (Item226 == 0)
			{
				Wld_InsertItem	(Irgendwas_26, "FP_ITEM_26");

				Item226 = 1;
			};
			if (Item227 == 0)
			{
				Wld_InsertItem	(Irgendwas_27, "FP_ITEM_27");

				Item227 = 1;
			};
			if (Item228 == 0)
			{
				Wld_InsertItem	(Irgendwas_28, "FP_ITEM_28");

				Item228 = 1;
			};
			if (Item229 == 0)
			{
				Wld_InsertItem	(Irgendwas_29, "FP_ITEM_29");

				Item229 = 1;
			};
			if (Item230 == 0)
			{
				Wld_InsertItem	(Irgendwas_30, "FP_ITEM_30");

				Item230 = 1;
			};
			if (Item231 == 0)
			{
				Wld_InsertItem	(Irgendwas_31, "FP_ITEM_31");

				Item231 = 1;
			};
			if (Item232 == 0)
			{
				Wld_InsertItem	(Irgendwas_32, "FP_ITEM_32");

				Item232 = 1;
			};
			if (Item233 == 0)
			{
				Wld_InsertItem	(Irgendwas_33, "FP_ITEM_33");

				Item233 = 1;
			};
			if (Item234 == 0)
			{
				Wld_InsertItem	(Irgendwas_34, "FP_ITEM_34");

				Item234 = 1;
			};
			if (Item235 == 0)
			{
				Wld_InsertItem	(Irgendwas_35, "FP_ITEM_35");

				Item235 = 1;
			};
			if (Item236 == 0)
			{
				Wld_InsertItem	(Irgendwas_36, "FP_ITEM_36");

				Item236 = 1;
			};
			if (Item237 == 0)
			{
				Wld_InsertItem	(Irgendwas_37, "FP_ITEM_37");

				Item237 = 1;
			};
			if (Item238 == 0)
			{
				Wld_InsertItem	(Irgendwas_38, "FP_ITEM_38");

				Item238 = 1;
			};
			if (Item239 == 0)
			{
				Wld_InsertItem	(Irgendwas_39, "FP_ITEM_39");

				Item239 = 1;
			};
			if (Item240 == 0)
			{
				Wld_InsertItem	(Irgendwas_40, "FP_ITEM_40");

				Item240 = 1;
			};
			if (Item241 == 0)
			{
				Wld_InsertItem	(Irgendwas_41, "FP_ITEM_41");

				Item241 = 1;
			};
			if (Item242 == 0)
			{
				Wld_InsertItem	(Irgendwas_42, "FP_ITEM_42");

				Item242 = 1;
			};
			if (Item243 == 0)
			{
				Wld_InsertItem	(Irgendwas_43, "FP_ITEM_43");

				Item243 = 1;
			};
			if (Item244 == 0)
			{
				Wld_InsertItem	(Irgendwas_44, "FP_ITEM_44");

				Item244 = 1;
			};
			if (Item245 == 0)
			{
				Wld_InsertItem	(Irgendwas_45, "FP_ITEM_45");

				Item245 = 1;
			};
			if (Item246 == 0)
			{
				Wld_InsertItem	(Irgendwas_46, "FP_ITEM_46");

				Item246 = 1;
			};
			if (Item247 == 0)
			{
				Wld_InsertItem	(Irgendwas_47, "FP_ITEM_47");

				Item247 = 1;
			};
			if (Item248 == 0)
			{
				Wld_InsertItem	(Irgendwas_48, "FP_ITEM_48");

				Item248 = 1;
			};
			if (Item249 == 0)
			{
				Wld_InsertItem	(Irgendwas_49, "FP_ITEM_49");

				Item249 = 1;
			};
			if (Item250 == 0)
			{
				Wld_InsertItem	(Irgendwas_50, "FP_ITEM_50");

				Item250 = 1;
			};
		};

		if (Npc_GetDistToItem(hero, Irgendwas_01) < 100)
		&& (Item201 == 1)
		{
			Wld_RemoveItem	(Irgendwas_01);
			Item201 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_02) < 100)
		&& (Item202 == 1)
		{
			Wld_RemoveItem	(Irgendwas_02);
			Item202 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_03) < 100)
		&& (Item203 == 1)
		{
			Wld_RemoveItem	(Irgendwas_03);
			Item203 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_04) < 100)
		&& (Item204 == 1)
		{
			Wld_RemoveItem	(Irgendwas_04);
			Item204 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_05) < 100)
		&& (Item205 == 1)
		{
			Wld_RemoveItem	(Irgendwas_05);
			Item205 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_06) < 100)
		&& (Item206 == 1)
		{
			Wld_RemoveItem	(Irgendwas_06);
			Item206 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_07) < 100)
		&& (Item207 == 1)
		{
			Wld_RemoveItem	(Irgendwas_07);
			Item207 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_08) < 100)
		&& (Item208 == 1)
		{
			Wld_RemoveItem	(Irgendwas_08);
			Item208 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_09) < 100)
		&& (Item209 == 1)
		{
			Wld_RemoveItem	(Irgendwas_09);
			Item209 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_10) < 100)
		&& (Item210 == 1)
		{
			Wld_RemoveItem	(Irgendwas_10);
			Item210 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_11) < 100)
		&& (Item211 == 1)
		{
			Wld_RemoveItem	(Irgendwas_11);
			Item211 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_12) < 100)
		&& (Item212 == 1)
		{
			Wld_RemoveItem	(Irgendwas_12);
			Item212 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_13) < 100)
		&& (Item213 == 1)
		{
			Wld_RemoveItem	(Irgendwas_13);
			Item213 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_14) < 100)
		&& (Item214 == 1)
		{
			Wld_RemoveItem	(Irgendwas_14);
			Item214 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_15) < 100)
		&& (Item215 == 1)
		{
			Wld_RemoveItem	(Irgendwas_15);
			Item215 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_16) < 100)
		&& (Item216 == 1)
		{
			Wld_RemoveItem	(Irgendwas_16);
			Item216 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_17) < 100)
		&& (Item217 == 1)
		{
			Wld_RemoveItem	(Irgendwas_17);
			Item217 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_18) < 100)
		&& (Item218 == 1)
		{
			Wld_RemoveItem	(Irgendwas_18);
			Item218 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_19) < 100)
		&& (Item219 == 1)
		{
			Wld_RemoveItem	(Irgendwas_19);
			Item219 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_20) < 100)
		&& (Item220 == 1)
		{
			Wld_RemoveItem	(Irgendwas_20);
			Item220 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_21) < 100)
		&& (Item221 == 1)
		{
			Wld_RemoveItem	(Irgendwas_21);
			Item221 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_22) < 100)
		&& (Item222 == 1)
		{
			Wld_RemoveItem	(Irgendwas_22);
			Item222 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_23) < 100)
		&& (Item223 == 1)
		{
			Wld_RemoveItem	(Irgendwas_23);
			Item223 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_24) < 100)
		&& (Item224 == 1)
		{
			Wld_RemoveItem	(Irgendwas_24);
			Item224 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_25) < 100)
		&& (Item225 == 1)
		{
			Wld_RemoveItem	(Irgendwas_25);
			Item225 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_26) < 100)
		&& (Item226 == 1)
		{
			Wld_RemoveItem	(Irgendwas_26);
			Item226 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_27) < 100)
		&& (Item227 == 1)
		{
			Wld_RemoveItem	(Irgendwas_27);
			Item227 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_28) < 100)
		&& (Item228 == 1)
		{
			Wld_RemoveItem	(Irgendwas_28);
			Item228 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_29) < 100)
		&& (Item229 == 1)
		{
			Wld_RemoveItem	(Irgendwas_29);
			Item229 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_30) < 100)
		&& (Item230 == 1)
		{
			Wld_RemoveItem	(Irgendwas_30);
			Item230 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_31) < 100)
		&& (Item231 == 1)
		{
			Wld_RemoveItem	(Irgendwas_31);
			Item231 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_32) < 100)
		&& (Item232 == 1)
		{
			Wld_RemoveItem	(Irgendwas_32);
			Item232 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_33) < 100)
		&& (Item233 == 1)
		{
			Wld_RemoveItem	(Irgendwas_33);
			Item233 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_34) < 100)
		&& (Item234 == 1)
		{
			Wld_RemoveItem	(Irgendwas_34);
			Item234 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_35) < 100)
		&& (Item235 == 1)
		{
			Wld_RemoveItem	(Irgendwas_35);
			Item235 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_36) < 100)
		&& (Item236 == 1)
		{
			Wld_RemoveItem	(Irgendwas_36);
			Item236 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_37) < 100)
		&& (Item237 == 1)
		{
			Wld_RemoveItem	(Irgendwas_37);
			Item237 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_38) < 100)
		&& (Item238 == 1)
		{
			Wld_RemoveItem	(Irgendwas_38);
			Item238 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_39) < 100)
		&& (Item239 == 1)
		{
			Wld_RemoveItem	(Irgendwas_39);
			Item239 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_40) < 100)
		&& (Item240 == 1)
		{
			Wld_RemoveItem	(Irgendwas_40);
			Item240 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_41) < 100)
		&& (Item241 == 1)
		{
			Wld_RemoveItem	(Irgendwas_41);
			Item241 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_42) < 100)
		&& (Item242 == 1)
		{
			Wld_RemoveItem	(Irgendwas_42);
			Item242 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_43) < 100)
		&& (Item243 == 1)
		{
			Wld_RemoveItem	(Irgendwas_43);
			Item243 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_44) < 100)
		&& (Item244 == 1)
		{
			Wld_RemoveItem	(Irgendwas_44);
			Item244 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_45) < 100)
		&& (Item245 == 1)
		{
			Wld_RemoveItem	(Irgendwas_45);
			Item245 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_46) < 100)
		&& (Item246 == 1)
		{
			Wld_RemoveItem	(Irgendwas_46);
			Item246 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_47) < 100)
		&& (Item247 == 1)
		{
			Wld_RemoveItem	(Irgendwas_47);
			Item247 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_48) < 100)
		&& (Item248 == 1)
		{
			Wld_RemoveItem	(Irgendwas_48);
			Item248 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_49) < 100)
		&& (Item249 == 1)
		{
			Wld_RemoveItem	(Irgendwas_49);
			Item249 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
		if (Npc_GetDistToItem(hero, Irgendwas_50) < 100)
		&& (Item250 == 1)
		{
			Wld_RemoveItem	(Irgendwas_50);
			Item250 = 0;

			LichtCounter += 1;

			Snd_Play	("JIBOLUFT");
		};
	};

	if (CurrentLevel == LEVEL10_ZEN)
	{
		if (Npc_GetDistToWP(hero, "ENDE") < 300)
		&& (TimeCounter_Real > 10)
		&& (ReturnToStartlevel == 0)
		{
			Level10_Highscore_Zeit = TimeCounter_Real;

			Level10_Highscore_Neu = 10*LichtCounter;

			if (Level10_Highscore_Neu <= 0)
			{
				Level10_Highscore_Neu = 1;
			};

			PrintText = concatStrings("Erreichte Punkte: ", IntToString(Level10_Highscore_Neu));

			PrintScreen (PrintText, -1, YPOS_LevelUp, FONT_Screen, 1);

			if (Level10_Highscore_Neu > Level10_Highscore)
			{	
				PrintScreen ("Neuer Highscore!", -1, YPOS_LevelUp+4, FONT_Screen, 1);		

				Level10_Highscore = Level10_Highscore_Neu;

				if (Offline_Modus == 0)
				{
					CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/insert.php?name=", username), "&points="), IntToString(Level10_Highscore)), "&id=13&version=110"));
				};
			};

			ReturnToStartlevel = 1;

			Level10_Dir = 2;

			Level10_Gespielt = TRUE;
		};

		if (Npc_GetDistToWP(hero, "START") < 500)
		&& (Wagen_Unterwegs == 0)
		&& (TimeCounter_Real > 1)
		{
			Wld_SendTrigger	("WAGEN");

			Wagen_Unterwegs = 1;

			Licht10_Counter = 0;

			if (Item10_01 == 0)
			{
				Wld_InsertItem	(Irgendwas2_01, "FP_ITEM_01");

				Item10_01 = 1;
			};
			if (Item10_02 == 0)
			{
				Wld_InsertItem	(Irgendwas2_02, "FP_ITEM_02");

				Item10_02 = 1;
			};
			if (Item10_03 == 0)
			{
				Wld_InsertItem	(Irgendwas2_03, "FP_ITEM_03");

				Item10_03 = 1;
			};
			if (Item10_04 == 0)
			{
				Wld_InsertItem	(Irgendwas2_04, "FP_ITEM_04");

				Item10_04 = 1;
			};
			if (Item10_05 == 0)
			{
				Wld_InsertItem	(Irgendwas2_05, "FP_ITEM_05");

				Item10_05 = 1;
			};
			if (Item10_06 == 0)
			{
				Wld_InsertItem	(Irgendwas2_06, "FP_ITEM_06");

				Item10_06 = 1;
			};
			if (Item10_07 == 0)
			{
				Wld_InsertItem	(Irgendwas2_07, "FP_ITEM_07");

				Item10_07 = 1;
			};
			if (Item10_08 == 0)
			{
				Wld_InsertItem	(Irgendwas2_08, "FP_ITEM_08");

				Item10_08 = 1;
			};
			if (Item10_09 == 0)
			{
				Wld_InsertItem	(Irgendwas2_09, "FP_ITEM_09");

				Item10_09 = 1;
			};
			if (Item10_10 == 0)
			{
				Wld_InsertItem	(Irgendwas2_10, "FP_ITEM_10");

				Item10_10 = 1;
			};
			if (Item10_11 == 0)
			{
				Wld_InsertItem	(Irgendwas2_11, "FP_ITEM_11");

				Item10_11 = 1;
			};
			if (Item10_12 == 0)
			{
				Wld_InsertItem	(Irgendwas2_12, "FP_ITEM_12");

				Item10_12 = 1;
			};
			if (Item10_13 == 0)
			{
				Wld_InsertItem	(Irgendwas2_13, "FP_ITEM_13");

				Item10_13 = 1;
			};
			if (Item10_14 == 0)
			{
				Wld_InsertItem	(Irgendwas2_14, "FP_ITEM_14");

				Item10_14 = 1;
			};
			if (Item10_15 == 0)
			{
				Wld_InsertItem	(Irgendwas2_15, "FP_ITEM_15");

				Item10_15 = 1;
			};
			if (Item10_16 == 0)
			{
				Wld_InsertItem	(Irgendwas2_16, "FP_ITEM_16");

				Item10_16 = 1;
			};
			if (Item10_17 == 0)
			{
				Wld_InsertItem	(Irgendwas2_17, "FP_ITEM_17");

				Item10_17 = 1;
			};
			if (Item10_18 == 0)
			{
				Wld_InsertItem	(Irgendwas2_18, "FP_ITEM_18");

				Item10_18 = 1;
			};
			if (Item10_19 == 0)
			{
				Wld_InsertItem	(Irgendwas2_19, "FP_ITEM_19");

				Item10_19 = 1;
			};
			if (Item10_20 == 0)
			{
				Wld_InsertItem	(Irgendwas2_20, "FP_ITEM_20");

				Item10_20 = 1;
			};
			if (Item10_21 == 0)
			{
				Wld_InsertItem	(Irgendwas2_21, "FP_ITEM_21");

				Item10_21 = 1;
			};
			if (Item10_22 == 0)
			{
				Wld_InsertItem	(Irgendwas2_22, "FP_ITEM_22");

				Item10_22 = 1;
			};
			if (Item10_23 == 0)
			{
				Wld_InsertItem	(Irgendwas2_23, "FP_ITEM_23");

				Item10_23 = 1;
			};
			if (Item10_24 == 0)
			{
				Wld_InsertItem	(Irgendwas2_24, "FP_ITEM_24");

				Item10_24 = 1;
			};
			if (Item10_25 == 0)
			{
				Wld_InsertItem	(Irgendwas2_25, "FP_ITEM_25");

				Item10_25 = 1;
			};
			if (Item10_26 == 0)
			{
				Wld_InsertItem	(Irgendwas2_26, "FP_ITEM_26");

				Item10_26 = 1;
			};
			if (Item10_27 == 0)
			{
				Wld_InsertItem	(Irgendwas2_27, "FP_ITEM_27");

				Item10_27 = 1;
			};
			if (Item10_28 == 0)
			{
				Wld_InsertItem	(Irgendwas2_28, "FP_ITEM_28");

				Item10_28 = 1;
			};
			if (Item10_29 == 0)
			{
				Wld_InsertItem	(Irgendwas2_29, "FP_ITEM_29");

				Item10_29 = 1;
			};
			if (Item10_30 == 0)
			{
				Wld_InsertItem	(Irgendwas2_30, "FP_ITEM_30");

				Item10_30 = 1;
			};
			if (Item10_31 == 0)
			{
				Wld_InsertItem	(Irgendwas2_31, "FP_ITEM_31");

				Item10_31 = 1;
			};
			if (Item10_32 == 0)
			{
				Wld_InsertItem	(Irgendwas2_32, "FP_ITEM_32");

				Item10_32 = 1;
			};
			if (Item10_33 == 0)
			{
				Wld_InsertItem	(Irgendwas2_33, "FP_ITEM_33");

				Item10_33 = 1;
			};
			if (Item10_34 == 0)
			{
				Wld_InsertItem	(Irgendwas2_34, "FP_ITEM_34");

				Item10_34 = 1;
			};
			if (Item10_35 == 0)
			{
				Wld_InsertItem	(Irgendwas2_35, "FP_ITEM_35");

				Item10_35 = 1;
			};
			if (Item10_36 == 0)
			{
				Wld_InsertItem	(Irgendwas2_36, "FP_ITEM_36");

				Item10_36 = 1;
			};
			if (Item10_37 == 0)
			{
				Wld_InsertItem	(Irgendwas2_37, "FP_ITEM_37");

				Item10_37 = 1;
			};
			if (Item10_38 == 0)
			{
				Wld_InsertItem	(Irgendwas2_38, "FP_ITEM_38");

				Item10_38 = 1;
			};
			if (Item10_39 == 0)
			{
				Wld_InsertItem	(Irgendwas2_39, "FP_ITEM_39");

				Item10_39 = 1;
			};
			if (Item10_40 == 0)
			{
				Wld_InsertItem	(Irgendwas2_40, "FP_ITEM_40");

				Item10_40 = 1;
			};
			if (Item10_41 == 0)
			{
				Wld_InsertItem	(Irgendwas2_41, "FP_ITEM_41");

				Item10_41 = 1;
			};
			if (Item10_42 == 0)
			{
				Wld_InsertItem	(Irgendwas2_42, "FP_ITEM_42");

				Item10_42 = 1;
			};
			if (Item10_43 == 0)
			{
				Wld_InsertItem	(Irgendwas2_43, "FP_ITEM_43");

				Item10_43 = 1;
			};
			if (Item10_44 == 0)
			{
				Wld_InsertItem	(Irgendwas2_44, "FP_ITEM_44");

				Item10_44 = 1;
			};
			if (Item10_45 == 0)
			{
				Wld_InsertItem	(Irgendwas2_45, "FP_ITEM_45");

				Item10_45 = 1;
			};
			if (Item10_46 == 0)
			{
				Wld_InsertItem	(Irgendwas2_46, "FP_ITEM_46");

				Item10_46 = 1;
			};
			if (Item10_47 == 0)
			{
				Wld_InsertItem	(Irgendwas2_47, "FP_ITEM_47");

				Item10_47 = 1;
			};
			if (Item10_48 == 0)
			{
				Wld_InsertItem	(Irgendwas2_48, "FP_ITEM_48");

				Item10_48 = 1;
			};
			if (Item10_49 == 0)
			{
				Wld_InsertItem	(Irgendwas2_49, "FP_ITEM_49");

				Item10_49 = 1;
			};
			if (Item10_50 == 0)
			{
				Wld_InsertItem	(Irgendwas2_50, "FP_ITEM_50");

				Item10_50 = 1;
			};
		};
	};

	if (CurrentLevel == LEVEL11_ZEN)
	{
		if (Npc_GetDistToWP(hero, "ENDE") < 300)
		&& (TimeCounter_Real > 10)
		&& (ReturnToStartlevel == 0)
		{
			Level11_Highscore_Zeit = TimeCounter_Real;

			Level11_Highscore_Neu = 20*Licht11_Counter-Stachelmalus;

			if (Level11_Highscore_Neu <= 0)
			{
				Level11_Highscore_Neu = 1;
			};

			PrintText = concatStrings("Erreichte Punkte: ", IntToString(Level11_Highscore_Neu));

			PrintScreen (PrintText, -1, YPOS_LevelUp, FONT_Screen, 1);

			if (Level11_Highscore_Neu > Level11_Highscore)
			{	
				PrintScreen ("Neuer Highscore!", -1, YPOS_LevelUp+4, FONT_Screen, 1);		

				Level11_Highscore = Level11_Highscore_Neu;

				if (Offline_Modus == 0)
				{
					CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/insert.php?name=", username), "&points="), IntToString(Level11_Highscore)), "&id=14&version=110"));
				};
			};

			ReturnToStartlevel = 1;

			//Level11_Dir = 2;

			Level11_Gespielt = TRUE;
		};

		if (Npc_GetDistToWP(hero, "START") < 500)
		&& (Wagen11_Unterwegs == 0)
		{
			Wld_SendTrigger	("WAGEN");

			Wagen11_Unterwegs = 1;

			Licht11_Counter = 0;

			if (Item11_01 == 0)
			{
				Wld_InsertItem	(Irgendwas2_01, "FP_ITEM_01");

				Item11_01 = 1;
			};
			if (Item11_02 == 0)
			{
				Wld_InsertItem	(Irgendwas2_02, "FP_ITEM_02");

				Item11_02 = 1;
			};
			if (Item11_03 == 0)
			{
				Wld_InsertItem	(Irgendwas2_03, "FP_ITEM_03");

				Item11_03 = 1;
			};
			if (Item11_04 == 0)
			{
				Wld_InsertItem	(Irgendwas2_04, "FP_ITEM_04");

				Item11_04 = 1;
			};
			if (Item11_05 == 0)
			{
				Wld_InsertItem	(Irgendwas2_05, "FP_ITEM_05");

				Item11_05 = 1;
			};
			if (Item11_06 == 0)
			{
				Wld_InsertItem	(Irgendwas2_06, "FP_ITEM_06");

				Item11_06 = 1;
			};
			if (Item11_07 == 0)
			{
				Wld_InsertItem	(Irgendwas2_07, "FP_ITEM_07");

				Item11_07 = 1;
			};
			if (Item11_08 == 0)
			{
				Wld_InsertItem	(Irgendwas2_08, "FP_ITEM_08");

				Item11_08 = 1;
			};
			if (Item11_09 == 0)
			{
				Wld_InsertItem	(Irgendwas2_09, "FP_ITEM_09");

				Item11_09 = 1;
			};
			if (Item11_10 == 0)
			{
				Wld_InsertItem	(Irgendwas2_10, "FP_ITEM_10");

				Item11_10 = 1;
			};
			if (Item11_11 == 0)
			{
				Wld_InsertItem	(Irgendwas2_11, "FP_ITEM_11");

				Item11_11 = 1;
			};
			if (Item11_12 == 0)
			{
				Wld_InsertItem	(Irgendwas2_12, "FP_ITEM_12");

				Item11_12 = 1;
			};
			if (Item11_13 == 0)
			{
				Wld_InsertItem	(Irgendwas2_13, "FP_ITEM_13");

				Item11_13 = 1;
			};
			if (Item11_14 == 0)
			{
				Wld_InsertItem	(Irgendwas2_14, "FP_ITEM_14");

				Item11_14 = 1;
			};
			if (Item11_15 == 0)
			{
				Wld_InsertItem	(Irgendwas2_15, "FP_ITEM_15");

				Item11_15 = 1;
			};
			if (Item11_16 == 0)
			{
				Wld_InsertItem	(Irgendwas2_16, "FP_ITEM_16");

				Item11_16 = 1;
			};
			if (Item11_17 == 0)
			{
				Wld_InsertItem	(Irgendwas2_17, "FP_ITEM_17");

				Item11_17 = 1;
			};
			if (Item11_18 == 0)
			{
				Wld_InsertItem	(Irgendwas2_18, "FP_ITEM_18");

				Item11_18 = 1;
			};
			if (Item11_19 == 0)
			{
				Wld_InsertItem	(Irgendwas2_19, "FP_ITEM_19");

				Item11_19 = 1;
			};
			if (Item11_20 == 0)
			{
				Wld_InsertItem	(Irgendwas2_20, "FP_ITEM_20");

				Item11_20 = 1;
			};
			if (Item11_21 == 0)
			{
				Wld_InsertItem	(Irgendwas2_21, "FP_ITEM_21");

				Item11_21 = 1;
			};
			if (Item11_22 == 0)
			{
				Wld_InsertItem	(Irgendwas2_22, "FP_ITEM_22");

				Item11_22 = 1;
			};
			if (Item11_23 == 0)
			{
				Wld_InsertItem	(Irgendwas2_23, "FP_ITEM_23");

				Item11_23 = 1;
			};
			if (Item11_24 == 0)
			{
				Wld_InsertItem	(Irgendwas2_24, "FP_ITEM_24");

				Item11_24 = 1;
			};
			if (Item11_25 == 0)
			{
				Wld_InsertItem	(Irgendwas2_25, "FP_ITEM_25");

				Item11_25 = 1;
			};
			if (Item11_26 == 0)
			{
				Wld_InsertItem	(Irgendwas2_26, "FP_ITEM_26");

				Item11_26 = 1;
			};
			if (Item11_27 == 0)
			{
				Wld_InsertItem	(Irgendwas2_27, "FP_ITEM_27");

				Item11_27 = 1;
			};
			if (Item11_28 == 0)
			{
				Wld_InsertItem	(Irgendwas2_28, "FP_ITEM_28");

				Item11_28 = 1;
			};
			if (Item11_29 == 0)
			{
				Wld_InsertItem	(Irgendwas2_29, "FP_ITEM_29");

				Item11_29 = 1;
			};
			if (Item11_30 == 0)
			{
				Wld_InsertItem	(Irgendwas2_30, "FP_ITEM_30");

				Item11_30 = 1;
			};
			if (Item11_31 == 0)
			{
				Wld_InsertItem	(Irgendwas2_31, "FP_ITEM_31");

				Item11_31 = 1;
			};
			if (Item11_32 == 0)
			{
				Wld_InsertItem	(Irgendwas2_32, "FP_ITEM_32");

				Item11_32 = 1;
			};
			if (Item11_33 == 0)
			{
				Wld_InsertItem	(Irgendwas2_33, "FP_ITEM_33");

				Item11_33 = 1;
			};
			if (Item11_34 == 0)
			{
				Wld_InsertItem	(Irgendwas2_34, "FP_ITEM_34");

				Item11_34 = 1;
			};
			if (Item11_35 == 0)
			{
				Wld_InsertItem	(Irgendwas2_35, "FP_ITEM_35");

				Item11_35 = 1;
			};
			if (Item11_36 == 0)
			{
				Wld_InsertItem	(Irgendwas2_36, "FP_ITEM_36");

				Item11_36 = 1;
			};
			if (Item11_37 == 0)
			{
				Wld_InsertItem	(Irgendwas2_37, "FP_ITEM_37");

				Item11_37 = 1;
			};
			if (Item11_38 == 0)
			{
				Wld_InsertItem	(Irgendwas2_38, "FP_ITEM_38");

				Item11_38 = 1;
			};
			if (Item11_39 == 0)
			{
				Wld_InsertItem	(Irgendwas2_39, "FP_ITEM_39");

				Item11_39 = 1;
			};
			if (Item11_40 == 0)
			{
				Wld_InsertItem	(Irgendwas2_40, "FP_ITEM_40");

				Item11_40 = 1;
			};
			if (Item11_41 == 0)
			{
				Wld_InsertItem	(Irgendwas2_41, "FP_ITEM_41");

				Item11_41 = 1;
			};
			if (Item11_42 == 0)
			{
				Wld_InsertItem	(Irgendwas2_42, "FP_ITEM_42");

				Item11_42 = 1;
			};
			if (Item11_43 == 0)
			{
				Wld_InsertItem	(Irgendwas2_43, "FP_ITEM_43");

				Item11_43 = 1;
			};
			if (Item11_44 == 0)
			{
				Wld_InsertItem	(Irgendwas2_44, "FP_ITEM_44");

				Item11_44 = 1;
			};
			if (Item11_45 == 0)
			{
				Wld_InsertItem	(Irgendwas2_45, "FP_ITEM_45");

				Item11_45 = 1;
			};
			if (Item11_46 == 0)
			{
				Wld_InsertItem	(Irgendwas2_46, "FP_ITEM_46");

				Item11_46 = 1;
			};
			if (Item11_47 == 0)
			{
				Wld_InsertItem	(Irgendwas2_47, "FP_ITEM_47");

				Item11_47 = 1;
			};
			if (Item11_48 == 0)
			{
				Wld_InsertItem	(Irgendwas2_48, "FP_ITEM_48");

				Item11_48 = 1;
			};
			if (Item11_49 == 0)
			{
				Wld_InsertItem	(Irgendwas2_49, "FP_ITEM_49");

				Item11_49 = 1;
			};
			if (Item11_50 == 0)
			{
				Wld_InsertItem	(Irgendwas2_50, "FP_ITEM_50");

				Item11_50 = 1;
			};
		};
	};

	// Checkpoints erreichen

	if (Npc_GetDistToWP(hero, "CHECK01") < 300)
	{
		if (CHECK01 == FALSE)
		{
			Print	("Checkpoint erreicht!");
		};

		Check01 = TRUE;
	};

	if (Npc_GetDistToWP(hero, "CHECK02") < 300)
	{
		if (CHECK02 == FALSE)
		{
			Print	("Checkpoint erreicht!");
		};

		Check02 = TRUE;

		if (CurrentLevel == LEVEL04_ZEN)
		{
			Wld_StopEffect	("SLOW_TIME_CHILD2");
		};
	};

	if (Npc_GetDistToWP(hero, "CHECK03") < 300)
	{
		if (CHECK03 == FALSE)
		{
			Print	("Checkpoint erreicht!");
		};

		Check03 = TRUE;
	};

	if (Npc_GetDistToWP(hero, "CHECK04") < 300)
	{
		if (CHECK04 == FALSE)
		{
			Print	("Checkpoint erreicht!");
		};

		Check04 = TRUE;
	};

	if (Npc_GetDistToWP(hero, "CHECK05") < 300)
	{
		if (CHECK05 == FALSE)
		{
			Print	("Checkpoint erreicht!");
		};

		Check05 = TRUE;

		if (CurrentLevel == LEVEL02_ZEN)
		{
			Wld_StopEffect	("SLOW_TIME_CHILD2");
		};
	};

	if (Npc_GetDistToWP(hero, "CHECK06") < 300)
	{
		if (CHECK06 == FALSE)
		{
			Print	("Checkpoint erreicht!");
		};

		Check06 = TRUE;
	};

	if (Npc_GetDistToWP(hero, "CHECK07") < 300)
	{
		if (CHECK07 == FALSE)
		{
			Print	("Checkpoint erreicht!");
		};

		Check07 = TRUE;
	};

	if (Npc_GetDistToWP(hero, "LORE") < 200)
	{
		if (CurrentLevel == LEVEL01_ZEN)
		{
			Lore = TRUE;
		}
		else if (CurrentLevel == LEVEL03_ZEN)
		{
			Lore_R = TRUE;
		};
	};

	if (hero.aivar[AIV_Loadgame] == TRUE)
	{
		Checkpoint();

		hero.aivar[AIV_Loadgame] = FALSE;
	};

	// Meckern, wenn Marvin an ist

	if (MEM_GAME.game_testmode == 1)
	{
		PrintScreen ("Cheaten ist böse!", -1, YPOS_LevelUp, FONT_Screen, 4);

		//MEM_GAME.game_testmode = 0;
	};

	// Eingabe von Username und Passwort

	if (GetInput)
	{
		if (MEM_KeyState(KEY_RETURN) == KEY_PRESSED)
		{
			B_EndEingabe();

			if (STR_Len(username) == 0)
			{
				username = eingabe;
			}
			else if (STR_Len(passwort) == 0)
			{
				passwort = eingabe;
			};
		}
		else
		{
			eingabe = B_GetEingabe(eingabe);
			if (STR_Len(username) == 0)
			{
				PrintScreen	("Bitte Username eingeben", -1, 45, FONT_SCREEN, 1);

				eingabe = B_GetEingabe(eingabe);
			}
			else if (STR_Len(passwort) == 0)
			{
				PrintScreen	("Bitte Passwort eingeben", -1, 45, FONT_SCREEN, 1);

				eingabe = B_GetEingabe(eingabe);
			};
		};

		PrintScreen	(eingabe, -1, -1, FONT_SCREENSMALL, 1);
	};

	// Ausloggen

	if (MEM_KeyState(KEY_NUMPAD8) == KEY_PRESSED)
	&& (PLAYER_MOBSI_PRODUCTION == FALSE)
	{
		if (Offline_Modus == FALSE)
		{
			Offline_Modus = TRUE;

			CURL_Send(ConcatStrings("http://www.teutonicteam.de/gomon/tauschen/goOffline.php?name=", username));
			CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/gomon/tauschen/actualizePlaytime.php?name=", username), "&game=3&time="), IntToString(online_playtime)));

			PrintScreen	("Offline-Modus aktiviert, Spiel kann jetzt beendet werden!", -1, -1, FONT_SCREEN, 2);

			online_playtime = 0;
		}
		else
		{
			Offline_Modus = FALSE;

			validateUserPasswort = 1;
		};
	};

	// Triggerscript holen:
	var int ptr; ptr = MEM_SearchVobByName ("SPECIALTRIGGER");
	MEM_AssignInst (Mein_Schleifen_Trigger, ptr);
	
	Mein_Schleifen_Trigger._zCVob_nextOnTimer = MEM_Timer.totalTimeFloat; //wäre eigentlich jetzt schon wieder dran, wird aber erst im nächsten Frame bemerkt
};