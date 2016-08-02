FUNC VOID TimeShower()
{
	if (CurrentLevel != START_ZEN)
	&& (Npc_GetDistToWp(hero, "ENDE") >= 500)
	{
		if (TimeCounter_Real == -2)
		{
			if (CurrentLevel == LEVEL01_ZEN)
			{
				if (Lore == TRUE)
				{
					Wld_SendTrigger	("LORE01");

					Lore = FALSE;
				};
			}
			else if (CurrentLevel == LEVEL03_ZEN)
			{
				if (Lore_R == TRUE)
				|| (Level03_Gespielt == FALSE)
				{
					Wld_SendTrigger	("LORE01");

					Lore_R = FALSE;
				};
			};
		};

		TimeCounter_Sek += 1;
		TimeCounter_Real += 1;

		if (TimeCounter_Sek >= 60)
		{
			TimeCounter_Min += 1;

			TimeCounter_Sek -= 60;
		};

		if (TimeCounter_Min >= 60)
		{
			TimeCounter_H += 1;

			TimeCounter_Min -= 60;
		};	

		var string Time;

		var string Time_H;
		var string Time_Min;
		var string Time_Sek;

		if (TimeCounter_H < 10)
		{
			Time_H = ConcatStrings("0", IntToString(TimeCounter_H));
		}
		else
		{
			Time_H = IntToString(TimeCounter_H);
		};
		if (TimeCounter_Min < 10)
		{
			Time_Min = ConcatStrings("0", IntToString(TimeCounter_Min));
		}
		else
		{
			Time_Min = IntToString(TimeCounter_Min);
		};
		if (TimeCounter_Sek < 10)
		{
			Time_Sek = ConcatStrings("0", IntToString(TimeCounter_Sek));
		}
		else
		{
			Time_Sek = IntToString(TimeCounter_Sek);
		};

		Time = ConcatStrings(Time_H, ":");
		Time = ConcatStrings(Time, Time_Min);
		Time = ConcatStrings(Time, ":");
		Time = ConcatStrings(Time, Time_Sek);

		if (TimeAn == FALSE)
		{
			PrintScreen	(Time, 90, 2, FONT_Screen, 2);
		};
	};
};