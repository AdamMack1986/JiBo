FUNC VOID Racer_Start ()
{
	IF (r_start == 1)					//racer start
	{
		r_zeit_sek += 1; 				//zeit +1  erhöhen
		
		IF (score <= 100)
		{
			score = 100;
		};

		score -= 100;

		//Display
		 VAR STRING msg;

		 msg=  ConcatStrings("SCORE ",	IntToString(score));
		 PrintScreen	(msg, 40, 4, FONT_Screen, 1); 


		 msg=  ConcatStrings("TIME ",	IntToString(r_zeit_sek));
		 PrintScreen	(msg, 0, 4, FONT_Screen, 1); 
	};

	if (online_playtime > 1800)
	&& (Offline_Modus == 0)
	{
		CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/gomon/tauschen/actualizePlaytime.php?name=", username), "&game=3&time="), IntToString(online_playtime)));
		online_playtime = 0;
	};

	online_playtime += 1;

	if (Npc_IsDead(hero))
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

		Npc_ClearAIQueue	(hero);
		AI_StandUP	(hero);

		r_start = 0;

		AI_Teleport	(hero, "BACK");
	};

	EnforceLeavegamePolicy();

	Wld_SendTrigger ("RACER_LOOP"); //Trigger loop
};



FUNC VOID Racer_Anzeige ()
{
	//Display
	VAR STRING msg;

	msg=  ConcatStrings("LAP ",	IntToString(runden));
	PrintScreen	(msg, 0, 0, FONT_Screen, 1); 

	msg=  ConcatStrings("LT ",	IntToString(lasttime));
	PrintScreen	(msg, 10, 0, FONT_Screen, 1); 

	msg=  ConcatStrings("BT ",	IntToString(besttime));
	PrintScreen	(msg, 20, 0, FONT_Screen, 1); 


	msg=  ConcatStrings("HIGHSCORE ",	IntToString(highscore));
	PrintScreen	(msg, 40, 0, FONT_Screen, 1); 

	msg=  ConcatStrings("LASTSCORE ",	IntToString(lastscore));
	PrintScreen	(msg, 70, 0, FONT_Screen, 1); 

	Wld_SendTrigger ("RACER_LOOP_DISPLAY"); //Trigger loop
};



