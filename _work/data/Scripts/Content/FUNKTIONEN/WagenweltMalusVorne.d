FUNC VOID WAGENWELTMALUSVORNE()
{
	if (Level10_Dir == 2)
	{
		Licht10_Counter -= 1;

		PrintScreen ("-10 Punkte", -1, YPOS_LevelUp, FONT_Screen, 2);

		Snd_Play	("JIBOTELEPORT");

		if (Hlp_StrCmp(Npc_GetNearestWP(hero), "START_R"))
		{
			AI_Teleport	(hero, "PLATT_R_01");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_01"))
		{
			AI_Teleport	(hero, "PLATT_R_02");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_02"))
		{
			AI_Teleport	(hero, "PLATT_R_03");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_03"))
		{
			AI_Teleport	(hero, "PLATT_R_04");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_04"))
		{
			AI_Teleport	(hero, "PLATT_R_05");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_05"))
		{
			AI_Teleport	(hero, "PLATT_R_06");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_06"))
		{
			AI_Teleport	(hero, "PLATT_R_07");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_07"))
		{
			AI_Teleport	(hero, "PLATT_R_08");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_08"))
		{
			AI_Teleport	(hero, "PLATT_R_09");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_09"))
		{
			AI_Teleport	(hero, "PLATT_R_10");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_10"))
		{
			AI_Teleport	(hero, "PLATT_R_11");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_11"))
		{
			AI_Teleport	(hero, "PLATT_R_12");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_12"))
		{
			AI_Teleport	(hero, "PLATT_R_13");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_13"))
		{
			AI_Teleport	(hero, "PLATT_R_14");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_14"))
		{
			AI_Teleport	(hero, "PLATT_R_15");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_15"))
		{
			AI_Teleport	(hero, "PLATT_R_16");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_16"))
		{
			AI_Teleport	(hero, "PLATT_R_17");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_17"))
		{
			AI_Teleport	(hero, "PLATT_R_18");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_18"))
		{
			AI_Teleport	(hero, "PLATT_R_19");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_19"))
		{
			AI_Teleport	(hero, "PLATT_R_20");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_20"))
		{
			AI_Teleport	(hero, "PLATT_R_21");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_21"))
		{
			AI_Teleport	(hero, "PLATT_R_22");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_22"))
		{
			AI_Teleport	(hero, "PLATT_R_23");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_23"))
		{
			AI_Teleport	(hero, "PLATT_R_24");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_24"))
		{
			AI_Teleport	(hero, "PLATT_R_25");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_25"))
		{
			AI_Teleport	(hero, "PLATT_R_26");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_26"))
		{
			AI_Teleport	(hero, "PLATT_R_27");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_27"))
		{
			AI_Teleport	(hero, "PLATT_R_28");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_28"))
		{
			AI_Teleport	(hero, "PLATT_R_29");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_29"))
		{
			AI_Teleport	(hero, "PLATT_R_30");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_30"))
		{
			AI_Teleport	(hero, "PLATT_R_31");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_31"))
		{
			AI_Teleport	(hero, "PLATT_R_32");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_32"))
		{
			AI_Teleport	(hero, "PLATT_R_33");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_33"))
		{
			AI_Teleport	(hero, "PLATT_R_34");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_34"))
		{
			AI_Teleport	(hero, "PLATT_R_35");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_35"))
		{
			AI_Teleport	(hero, "PLATT_R_36");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_36"))
		{
			AI_Teleport	(hero, "PLATT_R_37");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_37"))
		{
			AI_Teleport	(hero, "PLATT_R_38");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_38"))
		{
			AI_Teleport	(hero, "PLATT_R_39");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_39"))
		{
			AI_Teleport	(hero, "PLATT_R_40");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_40"))
		{
			AI_Teleport	(hero, "PLATT_R_41");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_41"))
		{
			AI_Teleport	(hero, "PLATT_R_42");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_42"))
		{
			AI_Teleport	(hero, "PLATT_R_43");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_43"))
		{
			AI_Teleport	(hero, "PLATT_R_44");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_44"))
		{
			AI_Teleport	(hero, "PLATT_R_45");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_45"))
		{
			AI_Teleport	(hero, "PLATT_R_46");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_46"))
		{
			AI_Teleport	(hero, "PLATT_R_47");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_47"))
		{
			AI_Teleport	(hero, "PLATT_R_48");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_48"))
		{
			AI_Teleport	(hero, "PLATT_R_49");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_49"))
		{
			AI_Teleport	(hero, "PLATT_R_50");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_50"))
		{
			AI_Teleport	(hero, "PLATT_R_51");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_51"))
		{
			AI_Teleport	(hero, "PLATT_R_52");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_52"))
		{
			AI_Teleport	(hero, "PLATT_R_53");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_53"))
		{
			AI_Teleport	(hero, "PLATT_R_54");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_54"))
		{
			AI_Teleport	(hero, "PLATT_R_55");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_55"))
		{
			AI_Teleport	(hero, "PLATT_R_56");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_56"))
		{
			AI_Teleport	(hero, "PLATT_R_57");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_57"))
		{
			AI_Teleport	(hero, "PLATT_R_58");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_58"))
		{
			AI_Teleport	(hero, "PLATT_R_59");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_59"))
		{
			AI_Teleport	(hero, "PLATT_R_60");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_60"))
		{
			AI_Teleport	(hero, "PLATT_R_61");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_61"))
		{
			AI_Teleport	(hero, "PLATT_R_62");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_62"))
		{
			AI_Teleport	(hero, "PLATT_R_63");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_63"))
		{
			AI_Teleport	(hero, "PLATT_R_64");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_64"))
		{
			AI_Teleport	(hero, "PLATT_R_65");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_65"))
		{
			AI_Teleport	(hero, "PLATT_R_66");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_66"))
		{
			AI_Teleport	(hero, "PLATT_R_67");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_67"))
		{
			AI_Teleport	(hero, "PLATT_R_68");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_68"))
		{
			AI_Teleport	(hero, "PLATT_R_69");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_69"))
		{
			AI_Teleport	(hero, "PLATT_R_70");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_70"))
		{
			AI_Teleport	(hero, "PLATT_R_71");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_71"))
		{
			AI_Teleport	(hero, "PLATT_R_72");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_72"))
		{
			AI_Teleport	(hero, "PLATT_R_73");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_73"))
		{
			AI_Teleport	(hero, "PLATT_R_74");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_74"))
		{
			AI_Teleport	(hero, "PLATT_R_75");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_75"))
		{
			AI_Teleport	(hero, "PLATT_R_76");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_76"))
		{
			AI_Teleport	(hero, "PLATT_R_77");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_77"))
		{
			AI_Teleport	(hero, "PLATT_R_78");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_78"))
		{
			AI_Teleport	(hero, "PLATT_R_79");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_79"))
		{
			AI_Teleport	(hero, "PLATT_R_80");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_80"))
		{
			AI_Teleport	(hero, "PLATT_R_81");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_81"))
		{
			AI_Teleport	(hero, "PLATT_R_82");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_82"))
		{
			AI_Teleport	(hero, "PLATT_R_83");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_83"))
		{
			AI_Teleport	(hero, "PLATT_R_84");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_84"))
		{
			AI_Teleport	(hero, "PLATT_R_85");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_85"))
		{
			AI_Teleport	(hero, "PLATT_R_86");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_86"))
		{
			AI_Teleport	(hero, "PLATT_R_87");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_87"))
		{
			AI_Teleport	(hero, "PLATT_R_88");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_88"))
		{
			AI_Teleport	(hero, "PLATT_R_89");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_89"))
		{
			AI_Teleport	(hero, "PLATT_R_90");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_90"))
		{
			AI_Teleport	(hero, "PLATT_R_91");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_91"))
		{
			AI_Teleport	(hero, "PLATT_R_92");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_92"))
		{
			AI_Teleport	(hero, "PLATT_R_93");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_93"))
		{
			AI_Teleport	(hero, "PLATT_R_94");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_94"))
		{
			AI_Teleport	(hero, "PLATT_R_95");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_95"))
		{
			AI_Teleport	(hero, "PLATT_R_96");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_96"))
		{
			AI_Teleport	(hero, "PLATT_R_97");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_97"))
		{
			AI_Teleport	(hero, "PLATT_R_98");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_98"))
		{
			AI_Teleport	(hero, "PLATT_R_99");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_99"))
		{
			AI_Teleport	(hero, "PLATT_R_100");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_100"))
		{
			AI_Teleport	(hero, "PLATT_R_101");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_101"))
		{
			AI_Teleport	(hero, "PLATT_R_102");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_102"))
		{
			AI_Teleport	(hero, "PLATT_R_103");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_103"))
		{
			AI_Teleport	(hero, "PLATT_R_104");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_104"))
		{
			AI_Teleport	(hero, "PLATT_R_105");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_105"))
		{
			AI_Teleport	(hero, "PLATT_R_106");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_106"))
		{
			AI_Teleport	(hero, "PLATT_R_107");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_107"))
		{
			AI_Teleport	(hero, "PLATT_R_108");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_108"))
		{
			AI_Teleport	(hero, "PLATT_R_109");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_109"))
		{
			AI_Teleport	(hero, "PLATT_R_110");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_110"))
		{
			AI_Teleport	(hero, "PLATT_R_111");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_111"))
		{
			AI_Teleport	(hero, "PLATT_R_112");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_112"))
		{
			AI_Teleport	(hero, "PLATT_R_113");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_113"))
		{
			AI_Teleport	(hero, "PLATT_R_114");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_114"))
		{
			AI_Teleport	(hero, "PLATT_R_115");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_115"))
		{
			AI_Teleport	(hero, "PLATT_R_116");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_116"))
		{
			AI_Teleport	(hero, "PLATT_R_117");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_117"))
		{
			AI_Teleport	(hero, "PLATT_R_118");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_118"))
		{
			AI_Teleport	(hero, "PLATT_R_119");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_119"))
		{
			AI_Teleport	(hero, "PLATT_R_120");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_120"))
		{
			AI_Teleport	(hero, "PLATT_R_121");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_121"))
		{
			AI_Teleport	(hero, "PLATT_R_122");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_122"))
		{
			AI_Teleport	(hero, "PLATT_R_123");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_123"))
		{
			AI_Teleport	(hero, "PLATT_R_124");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_124"))
		{
			AI_Teleport	(hero, "PLATT_R_125");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_125"))
		{
			AI_Teleport	(hero, "PLATT_R_126");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_126"))
		{
			AI_Teleport	(hero, "PLATT_R_127");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_127"))
		{
			AI_Teleport	(hero, "PLATT_R_128");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_128"))
		{
			AI_Teleport	(hero, "PLATT_R_129");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_129"))
		{
			AI_Teleport	(hero, "PLATT_R_130");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_130"))
		{
			AI_Teleport	(hero, "PLATT_R_131");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_131"))
		{
			AI_Teleport	(hero, "PLATT_R_132");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_132"))
		{
			AI_Teleport	(hero, "PLATT_R_133");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_133"))
		{
			AI_Teleport	(hero, "PLATT_R_134");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_134"))
		{
			AI_Teleport	(hero, "PLATT_R_135");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_135"))
		{
			AI_Teleport	(hero, "PLATT_R_136");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_136"))
		{
			AI_Teleport	(hero, "PLATT_R_137");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_137"))
		{
			AI_Teleport	(hero, "PLATT_R_138");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_138"))
		{
			AI_Teleport	(hero, "PLATT_R_139");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_139"))
		{
			AI_Teleport	(hero, "PLATT_R_140");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_140"))
		{
			AI_Teleport	(hero, "PLATT_R_141");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_141"))
		{
			AI_Teleport	(hero, "PLATT_R_142");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_142"))
		{
			AI_Teleport	(hero, "PLATT_R_143");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_143"))
		{
			AI_Teleport	(hero, "PLATT_R_144");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_144"))
		{
			AI_Teleport	(hero, "PLATT_R_145");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_145"))
		{
			AI_Teleport	(hero, "PLATT_R_146");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_146"))
		{
			AI_Teleport	(hero, "PLATT_R_147");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_147"))
		{
			AI_Teleport	(hero, "PLATT_R_148");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_148"))
		{
			AI_Teleport	(hero, "PLATT_R_149");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_149"))
		{
			AI_Teleport	(hero, "PLATT_R_150");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_150"))
		{
			AI_Teleport	(hero, "PLATT_R_151");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_151"))
		{
			AI_Teleport	(hero, "PLATT_R_152");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_152"))
		{
			AI_Teleport	(hero, "PLATT_R_153");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_153"))
		{
			AI_Teleport	(hero, "PLATT_R_154");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_154"))
		{
			AI_Teleport	(hero, "PLATT_R_155");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_R_155"))
		{
			AI_Teleport	(hero, "ENDE_R");
		};
	};
};