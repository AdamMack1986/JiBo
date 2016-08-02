// Racer Start und Stop Trigger 

const int score_bonus_50 = 400;
const int score_bonus_100 = 600;
const int score_bonus_500 = 800;
const int time_bonus_5 = 3;
const int time_bonus_6 = 6;
const int hp_bonus = 200;
const int highscorebonus = 1000;

var int musik_an_aus;
var int musik_auswahl;
var int musik_gestartet;



// Kontrollvariablen
// Scoreboni kontrollvars 

var int spezial_01;

var int sb_001;
var int sb_002;
var int sb_003;
var int sb_004;
var int sb_005;
var int sb_006;
var int sb_007;
var int sb_008;
var int sb_009;
var int sb_010;
var int sb_011;
var int sb_012;
var int sb_013;
var int sb_014;
var int sb_015;
var int sb_016;
var int sb_017;
var int sb_018;
var int sb_019;
var int sb_020;
var int sb_021;
var int sb_022;
var int sb_023;
var int sb_024;
var int sb_025;
var int sb_026;
var int sb_027;
var int sb_028;
var int sb_029;
var int sb_030;
var int sb_031;
var int sb_032;
var int sb_033;
var int sb_034;
var int sb_035;
var int sb_036;
var int sb_037;
var int sb_038;
var int sb_039;
var int sb_040;
var int sb_041;
var int sb_042;
var int sb_043;
var int sb_044;
var int sb_045;
var int sb_046;
var int sb_047;
var int sb_048;
var int sb_049;
var int sb_050;



FUNC VOID Gobal_Reset ()

{
spezial_01 = 0;
sb_001 = 0;
sb_002 = 0;
sb_003 = 0;
sb_004 = 0;
sb_005 = 0;
sb_006 = 0;
sb_007 = 0;
sb_008 = 0;
sb_009 = 0;
sb_010 = 0;
sb_011 = 0;
sb_012 = 0;
sb_013 = 0;
sb_014 = 0;
sb_015 = 0;
sb_016 = 0;
sb_017 = 0;
sb_018 = 0;
sb_019 = 0;
sb_020 = 0;
sb_021 = 0;
sb_022 = 0;
sb_023 = 0;
sb_024 = 0;
sb_025 = 0;
sb_026 = 0;
sb_027 = 0;
sb_028 = 0;
sb_029 = 0;
sb_030 = 0;
sb_031 = 0;
sb_032 = 0;
sb_033 = 0;
sb_034 = 0;
sb_035 = 0;
sb_036 = 0;
sb_037 = 0;
sb_038 = 0;
sb_039 = 0;
sb_040 = 0;
sb_041 = 0;
sb_042 = 0;
sb_043 = 0;
sb_044 = 0;
sb_045 = 0;
sb_046 = 0;
sb_047 = 0;
sb_048 = 0;
sb_049 = 0;
sb_050 = 0;

};

func void Musik_Start ()
{
	if (musik_gestartet == 0)
	{
		musik_gestartet = 1;

		if (musik_an_aus == 1)
		{	
			if (musik_auswahl == 0)
			{
				Snd_Play ("PROJEKT_07");
			};
			if (musik_auswahl == 1)
			{
				Snd_Play ("MODEL");
			};		
		};
	};
};


func void Musik_Aus ()
{
	musik_an_aus = 0;
	PrintScreen	("Musik ist nun aus", 20, 16, FONT_Screen, 2); 
	musik_gestartet = 0;
};

func void Musik_An ()
{
	musik_an_aus = 1;
	PrintScreen	("Musik ist nun an", 20, 16, FONT_Screen, 2); 
	musik_gestartet = 0;
};


func void Nirvana ()
{
	musik_auswahl = 0;
	PrintScreen	("Come as You Are von Nirvana ausgewählt", 20, 16, FONT_Screen, 2); 
	musik_gestartet = 0;
};

func void Kraftwerk ()
{
	musik_auswahl = 1;
	PrintScreen	("Model von Kraftwerk ausgewählt", 20, 16, FONT_Screen, 2); 
	musik_gestartet = 0;
};


FUNC VOID TS_Racer_Start ()
{
	Gobal_Reset ();

	if (r_start == 0)
	{
		runden +=1;
	};

	r_start = 1;
	r_zeit_sek = 0;
	score = 100000;

	hero.attribute[ATR_HITPOINTS] =  hero.attribute[ATR_HITPOINTS_MAX];

	if (Npc_HasItems (hero, racer_zaphod_01) == 0) {CreateInvItems 	   (hero, racer_zaphod_01,1);};
	if (Npc_HasItems (hero, scavi_racer) == 0) {CreateInvItems 	   (hero, scavi_racer,1);};
	if (Npc_HasItems (hero, keiler_racer) == 0) {CreateInvItems 	   (hero, keiler_racer,1);};
	if (Npc_HasItems (hero, thorben_thunder) == 0) {CreateInvItems 	   (hero, thorben_thunder,1);};
};


FUNC VOID TS_Racer_Stop ()
{
	musik_gestartet = 0;  // verhindert doppelten Start der Musik

	if (Npc_HasItems (hero, racer_zaphod_01) == 0) {CreateInvItems 	   (hero, racer_zaphod_01,1);};
	if (Npc_HasItems (hero, scavi_racer) == 0) {CreateInvItems 	   (hero, scavi_racer,1);};
	if (Npc_HasItems (hero, keiler_racer) == 0) {CreateInvItems 	   (hero, keiler_racer,1);};
	if (Npc_HasItems (hero, thorben_thunder) == 0) {CreateInvItems 	   (hero, thorben_thunder,1);};

	//Display
	VAR STRING msg;

	if (r_start == 1) 
	{
		r_start = 0;

		lasttime = r_zeit_sek;

		score = score + self.attribute[ATR_HITPOINTS];
		msg=  ConcatStrings("HEALTHSCORE BONUS ",	IntToString(self.attribute[ATR_HITPOINTS]));
		PrintScreen	(msg, 40, 16, FONT_Screen, 5); 

		if (runden < 11) 
		{
			hero.attribute[ATR_DEXTERITY] += 5;
			PrintScreen	("5 Geschickpunkte dazu gewonnen", 40, 18, FONT_Screen, 5);
		};

		if (lasttime < besttime)
		{
			besttime = lasttime;
		};

		if ((r_zeit_sek < 500) && (r_zeit_sek >= 200))
		{
			score = score + 1000;
			PrintScreen	("TIMESCORE BONUS 1000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 200) && (r_zeit_sek >= 190))
		{
			score = score + 1600;
			PrintScreen	("TIMESCORE BONUS 1600", 40, 14, FONT_Screen, 5);
		}
		else if ((r_zeit_sek < 190) && (r_zeit_sek >= 180))
		{
			score = score + 1800;
			PrintScreen	("TIMESCORE BONUS 1800", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 180) && (r_zeit_sek >= 175))
		{
			score = score + 2500;
			PrintScreen	("TIMESCORE BONUS 2500", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 175) && (r_zeit_sek >= 170))
		{
			score = score + 3000;
			PrintScreen	("TIMESCORE BONUS 3000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 170) && (r_zeit_sek >= 165))
		{
			score = score + 4000;
			PrintScreen	("TIMESCORE BONUS 4000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 165) && (r_zeit_sek >= 160))
		{
			score = score + 5000;
			PrintScreen	("TIMESCORE BONUS 5000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 160) && (r_zeit_sek >= 155))
		{
			score = score + 6000;
			PrintScreen	("TIMESCORE BONUS 6000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 155) && (r_zeit_sek >= 150))
		{
			score = score + 8000;
			PrintScreen	("TIMESCORE BONUS 8000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 150) && (r_zeit_sek >= 145))
		{
			score = score + 10000;
			PrintScreen	("TIMESCORE BONUS 10000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 145) && (r_zeit_sek >= 140))
		{
			score = score + 12000;
			PrintScreen	("TIMESCORE BONUS 12000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 140) && (r_zeit_sek >= 135))
		{
			score = score + 14000;
			PrintScreen	("TIMESCORE BONUS 14000", 40, 14, FONT_Screen, 5);		
		}
		else if ((r_zeit_sek < 135) && (r_zeit_sek >= 130))
		{
			score = score + 16000;
			PrintScreen	("TIMESCORE BONUS 16000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 130) && (r_zeit_sek >= 125))
		{
			score = score + 18000;
			PrintScreen	("TIMESCORE BONUS 18000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 125) && (r_zeit_sek >= 120))
		{
			score = score + 20000;
			PrintScreen	("TIMESCORE BONUS 20000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 120) && (r_zeit_sek >= 115))
		{
			score = score + 30000;
			PrintScreen	("TIMESCORE BONUS 30000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 115) && (r_zeit_sek >= 110))
		{
			score = score + 35000;
			PrintScreen	("TIMESCORE BONUS 35000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 110) && (r_zeit_sek >= 105))
		{
			score = score + 40000;
			PrintScreen	("TIMESCORE BONUS 40000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 105) && (r_zeit_sek >= 100))
		{
			score = score + 45000;
			PrintScreen	("TIMESCORE BONUS 45000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 100) && (r_zeit_sek >= 95))
		{
			score = score + 50000;
			PrintScreen	("TIMESCORE BONUS 50000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 95) && (r_zeit_sek >= 90))
		{
			score = score + 55000;
			PrintScreen	("TIMESCORE BONUS 55000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 90) && (r_zeit_sek >= 85))
		{
			score = score + 60000;
			PrintScreen	("TIMESCORE BONUS 60000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 85) && (r_zeit_sek >= 80))
		{
			score = score + 65000;
			PrintScreen	("TIMESCORE BONUS 65000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 80) && (r_zeit_sek >= 75))
		{
			score = score + 70000;
			PrintScreen	("TIMESCORE BONUS 70000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 75) && (r_zeit_sek >= 70))
		{
			score = score + 75000;
			PrintScreen	("TIMESCORE BONUS 75000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 70) && (r_zeit_sek >= 65))
		{
			score = score + 80000;
			PrintScreen	("TIMESCORE BONUS 80000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 65) && (r_zeit_sek >= 60))
		{
			score = score + 85000;
			PrintScreen	("TIMESCORE BONUS 85000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 60) && (r_zeit_sek >= 55))
		{
			score = score + 90000;
			PrintScreen	("TIMESCORE BONUS 90000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 55) && (r_zeit_sek >= 50))
		{
			score = score + 95000;
			PrintScreen	("TIMESCORE BONUS 95000", 40, 14, FONT_Screen, 5); 
		}
		else if ((r_zeit_sek < 50) && (r_zeit_sek >= 1))
		{
			score = score + 100000;
			PrintScreen	("TIMESCORE BONUS 100000", 40, 14, FONT_Screen, 5); 
		};

		if (highscore < score)
		{
			//score = score + highscorebonus;
			highscore = score;

			msg=  ConcatStrings("NEW HIGHSCORE  ",	IntToString(highscore));
			PrintScreen	(msg, 40, 10, FONT_Screen, 5); 

			Level12_Highscore = score;

			if (Offline_Modus == 0)
			{
				CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/highscores/insert.php?name=", username), "&points="), IntToString(Level12_Highscore)), "&id=16&version=110"));
			};
	
			Snd_Play ("MFX_Teleport_Cast");

			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		};

		if (Offline_Modus == 0)
		{
			CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/gomon/tauschen/addJiBoLevel.php?name=", username), "&level="), IntToString(CurrentLevel)));
		};

		lastscore = score;
	};
};



FUNC VOID HP_Bonus_01 ()
{
	if (r_start == 1) 
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_bonus);

		VAR STRING msg;

		msg=  ConcatStrings("HP BONUS  ",	IntToString(hp_bonus));
		PrintScreen	(msg, 40, 12, FONT_Screen, 1);
		Snd_Play ("Eat_Apple");
	};
};


FUNC VOID Time_Bonus_01 ()
{
	if (r_start == 1) 
	{
		r_zeit_sek -=5;

		VAR STRING msg;

		msg=  ConcatStrings("TIMEBONUS ",	IntToString(time_bonus_5));
		PrintScreen	(msg, 40, 14, FONT_Screen, 1); 
		PrintScreen	("Sec", 63, 14, FONT_Screen, 1);
		Snd_Play ("MFX_Teleport_Cast"); 
	};
};


FUNC VOID Time_Bonus_Spezial ()
{
	if ((r_start == 1) && (spezial_01 == 0))
	{
		r_zeit_sek -=6;
		spezial_01 = 1;
		score = score + score_bonus_100;

		VAR STRING msg;

		msg=  ConcatStrings("SCOREBONUS ",	IntToString(score_bonus_100));
		PrintScreen	(msg, 40, 16, FONT_Screen, 2); 

		msg=  ConcatStrings("TIMEBONUS ",	IntToString(time_bonus_6));
		PrintScreen	(msg, 40, 18, FONT_Screen, 2); 
		PrintScreen	("Sec", 63, 18, FONT_Screen, 2); 
		Snd_Play ("MFX_Teleport_Cast"); 
	};
};


// Scorebonus Trigger + bugusing Bremse

FUNC VOID SB_01 ()
{
	if ((r_start == 1) && (sb_001 == 0))
	{
		sb_001 = 1;
		score = score + score_bonus_50;

		VAR STRING msg;

		msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
		PrintScreen	(msg, 40, 10, FONT_Screen, 1); 
		Snd_Play ("Geldbeutel");
	};
};

FUNC VOID SB_02 ()
{
	if ((r_start == 1) && (sb_002 == 0))
	{
		sb_002 = 1;
		score = score + score_bonus_100;

		VAR STRING msg;

		msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
		PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
		Snd_Play ("Geldbeutel");
	};
};

FUNC VOID SB_03 ()
{
	if ((r_start == 1) && (sb_003 == 0))
	{
		sb_003 = 1;
		score = score + score_bonus_100;

		VAR STRING msg;

		msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
		PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
		Snd_Play ("Geldbeutel");
	};
};

FUNC VOID SB_04 ()
{
	if ((r_start == 1) && (sb_004 == 0))
	{
		sb_004 = 1;
		score = score + score_bonus_50;

		VAR STRING msg;

		msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
		PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
		Snd_Play ("Geldbeutel");
	};
};

FUNC VOID SB_05 ()
{
	if ((r_start == 1) && (sb_005 == 0))
	{
		sb_005 = 1;
		score = score + score_bonus_100;

		VAR STRING msg;

		msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
		PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
		Snd_Play ("Geldbeutel");
	};
};

FUNC VOID SB_06 ()
{
	if ((r_start == 1) && (sb_006 == 0))
	{
		sb_006 = 1;
		score = score + score_bonus_100;

		VAR STRING msg;

		msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
		PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
		Snd_Play ("Geldbeutel");
	};
};

FUNC VOID SB_07 ()
{
	if ((r_start == 1) && (sb_007 == 0))
	{
		sb_007 = 1;
		score = score + score_bonus_100;

		VAR STRING msg;

		msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
		PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
		Snd_Play ("Geldbeutel");
	};
};

FUNC VOID SB_08 ()

{
	if ((r_start == 1) && (sb_008 == 0))
	{
	sb_008 = 1;
	score = score + score_bonus_50;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_09 ()

{
	if ((r_start == 1) && (sb_009 == 0))
	{
	sb_009 = 1;
	score = score + score_bonus_50;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_10 ()

{
	if ((r_start == 1) && (sb_010 == 0))
	{
	sb_010 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_11 ()

{
	if ((r_start == 1) && (sb_011 == 0))
	{
	sb_011 = 1;
	score = score + score_bonus_50;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};



FUNC VOID SB_12 ()

{
	if ((r_start == 1) && (sb_012 == 0))
	{
	sb_012 = 1;
	score = score + score_bonus_50;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};



FUNC VOID SB_13 ()

{
	if ((r_start == 1) && (sb_013 == 0))
	{
	sb_013 = 1;
	score = score + score_bonus_50;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_14 ()

{
	if ((r_start == 1) && (sb_014 == 0))
	{
	sb_014 = 1;
	score = score + score_bonus_50;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_15 ()

{
	if ((r_start == 1) && (sb_015 == 0))
	{
	sb_015 = 1;
	score = score + score_bonus_50;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_16 ()

{
	if ((r_start == 1) && (sb_016 == 0))
	{
	sb_016 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_17 ()

{
	if ((r_start == 1) && (sb_017 == 0))
	{
	sb_017 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_18 ()

{
	if ((r_start == 1) && (sb_018 == 0))
	{
	sb_018 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_19 ()

{
	if ((r_start == 1) && (sb_019 == 0))
	{
	sb_019 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_20 ()

{
	if ((r_start == 1) && (sb_020 == 0))
	{
	sb_020 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};

FUNC VOID SB_21 ()

{
	if ((r_start == 1) && (sb_021 == 0))
	{
	sb_021 = 1;
	score = score + score_bonus_50;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};

FUNC VOID SB_22 ()

{
	if ((r_start == 1) && (sb_022 == 0))
	{
	sb_022 = 1;
	score = score + score_bonus_50;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};

FUNC VOID SB_23 ()

{
	if ((r_start == 1) && (sb_023 == 0))
	{
	sb_023 = 1;
	score = score + score_bonus_50;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};

FUNC VOID SB_24 ()

{
	if ((r_start == 1) && (sb_024 == 0))
	{
	sb_024 = 1;
	score = score + score_bonus_50;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};

FUNC VOID SB_25 ()

{
	if ((r_start == 1) && (sb_025 == 0))
	{
	sb_025 = 1;
	score = score + score_bonus_50;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_26 ()

{
	if ((r_start == 1) && (sb_026 == 0))
	{
	sb_026 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};

FUNC VOID SB_27 ()

{
	if ((r_start == 1) && (sb_027 == 0))
	{
	sb_027 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};

FUNC VOID SB_28 ()

{
	if ((r_start == 1) && (sb_028 == 0))
	{
	sb_028 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};

FUNC VOID SB_29 ()

{
	if ((r_start == 1) && (sb_029 == 0))
	{
	sb_029 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};

FUNC VOID SB_30 ()

{
	if ((r_start == 1) && (sb_030 == 0))
	{
	sb_030 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};

FUNC VOID SB_31 ()

{
	if ((r_start == 1) && (sb_031 == 0))
	{
	sb_031 = 1;
	score = score + score_bonus_50;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};

FUNC VOID SB_32 ()

{
	if ((r_start == 1) && (sb_032 == 0))
	{
	sb_032 = 1;
	score = score + score_bonus_50;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};

// Rampe

FUNC VOID SB_33 ()

{
	if ((r_start == 1) && (sb_033 == 0))
	{
	sb_033 = 1;
	score = score + score_bonus_100;
	r_zeit_sek -=5;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 

	msg=  ConcatStrings("TIMEBONUS  ",	IntToString(time_bonus_5));
	PrintScreen	(msg, 40, 12, FONT_Screen, 1); 
	PrintScreen	("Sec", 60, 12, FONT_Screen, 1); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_34 ()

{
	if ((r_start == 1) && (sb_034 == 0))
	{
	sb_034 = 1;
	score = score + score_bonus_50;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};

FUNC VOID SB_35 ()

{
	if ((r_start == 1) && (sb_035 == 0))
	{
	sb_035 = 1;
	score = score + score_bonus_50;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_50));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_36 ()

{
	if ((r_start == 1) && (sb_036 == 0))
	{
	sb_036 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_37 ()

{
	if ((r_start == 1) && (sb_037 == 0))
	{
	sb_037 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};



FUNC VOID SB_38 ()

{
	if ((r_start == 1) && (sb_038 == 0))
	{
	sb_038 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_39 ()

{
	if ((r_start == 1) && (sb_039 == 0))
	{
	sb_039 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_40 ()

{
	if ((r_start == 1) && (sb_040 == 0))
	{
	sb_040 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_41 ()

{
	if ((r_start == 1) && (sb_041 == 0))
	{
	sb_041 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_42 ()

{
	if ((r_start == 1) && (sb_042 == 0))
	{
	sb_042 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_43 ()

{
	if ((r_start == 1) && (sb_043 == 0))
	{
	sb_043 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_44 ()

{
	if ((r_start == 1) && (sb_044 == 0))
	{
	sb_044 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_45 ()

{
	if ((r_start == 1) && (sb_045 == 0))
	{
	sb_045 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_46 ()

{
	if ((r_start == 1) && (sb_046 == 0))
	{
	sb_046 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_47 ()

{
	if ((r_start == 1) && (sb_047 == 0))
	{
	sb_047 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};


FUNC VOID SB_48 ()

{
	if ((r_start == 1) && (sb_048 == 0))
	{
	sb_048 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};

FUNC VOID SB_49 ()

{
	if ((r_start == 1) && (sb_049 == 0))
	{
	sb_049 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};

FUNC VOID SB_50 ()

{
	if ((r_start == 1) && (sb_050 == 0))
	{
	sb_050 = 1;
	score = score + score_bonus_100;

	VAR STRING msg;

	msg=  ConcatStrings("SCOREBONUS  ",	IntToString(score_bonus_100));
	PrintScreen	(msg, 40, 10, FONT_Screen, 2); 
	Snd_Play ("Geldbeutel");

	};
};