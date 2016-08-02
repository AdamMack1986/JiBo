FUNC VOID WAGENWELTMALUS()
{
	Licht10_Counter -= 1;

	PrintScreen ("-10 Punkte", -1, YPOS_LevelUp, FONT_Screen, 2);

	Snd_Play	("JIBOTELEPORT");

	if (Level10_Dir == 1)
	|| (Level10_Dir == 0)
	{
		if (Hlp_StrCmp(Npc_GetNearestWP(hero), "START"))
		{
			AI_Teleport	(hero, "PLATT_01");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_01"))
		{
			AI_Teleport	(hero, "PLATT_02");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_02"))
		{
			AI_Teleport	(hero, "PLATT_03");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_03"))
		{
			AI_Teleport	(hero, "PLATT_04");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_04"))
		{
			AI_Teleport	(hero, "PLATT_05");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_05"))
		{
			AI_Teleport	(hero, "PLATT_06");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_06"))
		{
			AI_Teleport	(hero, "PLATT_07");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_07"))
		{
			AI_Teleport	(hero, "PLATT_08");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_08"))
		{
			AI_Teleport	(hero, "PLATT_09");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_09"))
		{
			AI_Teleport	(hero, "PLATT_10");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_10"))
		{
			AI_Teleport	(hero, "PLATT_11");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_11"))
		{
			AI_Teleport	(hero, "PLATT_12");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_12"))
		{
			AI_Teleport	(hero, "PLATT_13");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_13"))
		{
			AI_Teleport	(hero, "PLATT_14");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_14"))
		{
			AI_Teleport	(hero, "PLATT_15");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_15"))
		{
			AI_Teleport	(hero, "PLATT_16");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_16"))
		{
			AI_Teleport	(hero, "PLATT_17");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_17"))
		{
			AI_Teleport	(hero, "PLATT_18");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_18"))
		{
			AI_Teleport	(hero, "PLATT_19");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_19"))
		{
			AI_Teleport	(hero, "PLATT_20");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_20"))
		{
			AI_Teleport	(hero, "PLATT_21");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_21"))
		{
			AI_Teleport	(hero, "PLATT_22");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_22"))
		{
			AI_Teleport	(hero, "PLATT_23");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_23"))
		{
			AI_Teleport	(hero, "PLATT_24");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_24"))
		{
			AI_Teleport	(hero, "PLATT_25");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_25"))
		{
			AI_Teleport	(hero, "PLATT_26");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_26"))
		{
			AI_Teleport	(hero, "PLATT_27");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_27"))
		{
			AI_Teleport	(hero, "PLATT_28");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_28"))
		{
			AI_Teleport	(hero, "PLATT_29");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_29"))
		{
			AI_Teleport	(hero, "PLATT_30");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_30"))
		{
			AI_Teleport	(hero, "PLATT_31");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_31"))
		{
			AI_Teleport	(hero, "PLATT_32");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_32"))
		{
			AI_Teleport	(hero, "PLATT_33");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_33"))
		{
			AI_Teleport	(hero, "PLATT_34");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_34"))
		{
			AI_Teleport	(hero, "PLATT_35");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_35"))
		{
			AI_Teleport	(hero, "PLATT_36");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_36"))
		{
			AI_Teleport	(hero, "PLATT_37");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_37"))
		{
			AI_Teleport	(hero, "PLATT_38");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_38"))
		{
			AI_Teleport	(hero, "PLATT_39");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_39"))
		{
			AI_Teleport	(hero, "PLATT_40");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_40"))
		{
			AI_Teleport	(hero, "PLATT_41");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_41"))
		{
			AI_Teleport	(hero, "PLATT_42");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_42"))
		{
			AI_Teleport	(hero, "PLATT_43");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_43"))
		{
			AI_Teleport	(hero, "PLATT_44");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_44"))
		{
			AI_Teleport	(hero, "PLATT_45");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_45"))
		{
			AI_Teleport	(hero, "PLATT_46");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_46"))
		{
			AI_Teleport	(hero, "PLATT_47");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_47"))
		{
			AI_Teleport	(hero, "PLATT_48");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_48"))
		{
			AI_Teleport	(hero, "PLATT_49");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_49"))
		{
			AI_Teleport	(hero, "PLATT_50");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_50"))
		{
			AI_Teleport	(hero, "PLATT_51");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_51"))
		{
			AI_Teleport	(hero, "PLATT_52");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_52"))
		{
			AI_Teleport	(hero, "PLATT_53");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_53"))
		{
			AI_Teleport	(hero, "PLATT_54");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_54"))
		{
			AI_Teleport	(hero, "PLATT_55");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_55"))
		{
			AI_Teleport	(hero, "PLATT_56");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_56"))
		{
			AI_Teleport	(hero, "PLATT_57");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_57"))
		{
			AI_Teleport	(hero, "PLATT_58");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_58"))
		{
			AI_Teleport	(hero, "PLATT_59");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_59"))
		{
			AI_Teleport	(hero, "PLATT_60");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_60"))
		{
			AI_Teleport	(hero, "PLATT_61");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_61"))
		{
			AI_Teleport	(hero, "PLATT_62");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_62"))
		{
			AI_Teleport	(hero, "PLATT_63");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_63"))
		{
			AI_Teleport	(hero, "PLATT_64");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_64"))
		{
			AI_Teleport	(hero, "PLATT_65");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_65"))
		{
			AI_Teleport	(hero, "PLATT_66");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_66"))
		{
			AI_Teleport	(hero, "PLATT_67");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_67"))
		{
			AI_Teleport	(hero, "PLATT_68");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_68"))
		{
			AI_Teleport	(hero, "PLATT_69");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_69"))
		{
			AI_Teleport	(hero, "PLATT_70");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_70"))
		{
			AI_Teleport	(hero, "PLATT_71");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_71"))
		{
			AI_Teleport	(hero, "PLATT_72");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_72"))
		{
			AI_Teleport	(hero, "PLATT_73");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_73"))
		{
			AI_Teleport	(hero, "PLATT_74");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_74"))
		{
			AI_Teleport	(hero, "PLATT_75");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_75"))
		{
			AI_Teleport	(hero, "PLATT_76");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_76"))
		{
			AI_Teleport	(hero, "PLATT_77");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_77"))
		{
			AI_Teleport	(hero, "PLATT_78");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_78"))
		{
			AI_Teleport	(hero, "PLATT_79");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_79"))
		{
			AI_Teleport	(hero, "PLATT_80");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_80"))
		{
			AI_Teleport	(hero, "PLATT_81");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_81"))
		{
			AI_Teleport	(hero, "PLATT_82");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_82"))
		{
			AI_Teleport	(hero, "PLATT_83");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_83"))
		{
			AI_Teleport	(hero, "PLATT_84");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_84"))
		{
			AI_Teleport	(hero, "PLATT_85");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_85"))
		{
			AI_Teleport	(hero, "PLATT_86");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_86"))
		{
			AI_Teleport	(hero, "PLATT_87");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_87"))
		{
			AI_Teleport	(hero, "PLATT_88");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_88"))
		{
			AI_Teleport	(hero, "PLATT_89");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_89"))
		{
			AI_Teleport	(hero, "PLATT_90");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_90"))
		{
			AI_Teleport	(hero, "PLATT_91");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_91"))
		{
			AI_Teleport	(hero, "PLATT_92");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_92"))
		{
			AI_Teleport	(hero, "PLATT_93");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_93"))
		{
			AI_Teleport	(hero, "PLATT_94");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_94"))
		{
			AI_Teleport	(hero, "PLATT_95");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_95"))
		{
			AI_Teleport	(hero, "PLATT_96");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_96"))
		{
			AI_Teleport	(hero, "PLATT_97");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_97"))
		{
			AI_Teleport	(hero, "PLATT_98");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_98"))
		{
			AI_Teleport	(hero, "PLATT_99");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_99"))
		{
			AI_Teleport	(hero, "PLATT_100");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_100"))
		{
			AI_Teleport	(hero, "PLATT_101");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_101"))
		{
			AI_Teleport	(hero, "PLATT_102");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_102"))
		{
			AI_Teleport	(hero, "PLATT_103");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_103"))
		{
			AI_Teleport	(hero, "PLATT_104");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_104"))
		{
			AI_Teleport	(hero, "PLATT_105");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_105"))
		{
			AI_Teleport	(hero, "PLATT_106");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_106"))
		{
			AI_Teleport	(hero, "PLATT_107");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_107"))
		{
			AI_Teleport	(hero, "PLATT_108");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_108"))
		{
			AI_Teleport	(hero, "PLATT_109");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_109"))
		{
			AI_Teleport	(hero, "PLATT_110");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_110"))
		{
			AI_Teleport	(hero, "PLATT_111");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_111"))
		{
			AI_Teleport	(hero, "PLATT_112");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_112"))
		{
			AI_Teleport	(hero, "PLATT_113");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_113"))
		{
			AI_Teleport	(hero, "PLATT_114");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_114"))
		{
			AI_Teleport	(hero, "PLATT_115");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_115"))
		{
			AI_Teleport	(hero, "PLATT_116");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_116"))
		{
			AI_Teleport	(hero, "PLATT_117");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_117"))
		{
			AI_Teleport	(hero, "PLATT_118");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_118"))
		{
			AI_Teleport	(hero, "PLATT_119");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_119"))
		{
			AI_Teleport	(hero, "PLATT_120");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_120"))
		{
			AI_Teleport	(hero, "PLATT_121");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_121"))
		{
			AI_Teleport	(hero, "PLATT_122");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_122"))
		{
			AI_Teleport	(hero, "PLATT_123");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_123"))
		{
			AI_Teleport	(hero, "PLATT_124");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_124"))
		{
			AI_Teleport	(hero, "PLATT_125");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_125"))
		{
			AI_Teleport	(hero, "PLATT_126");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_126"))
		{
			AI_Teleport	(hero, "PLATT_127");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_127"))
		{
			AI_Teleport	(hero, "PLATT_128");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_128"))
		{
			AI_Teleport	(hero, "PLATT_129");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_129"))
		{
			AI_Teleport	(hero, "PLATT_130");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_130"))
		{
			AI_Teleport	(hero, "PLATT_131");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_131"))
		{
			AI_Teleport	(hero, "PLATT_132");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_132"))
		{
			AI_Teleport	(hero, "PLATT_133");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_133"))
		{
			AI_Teleport	(hero, "PLATT_134");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_134"))
		{
			AI_Teleport	(hero, "PLATT_135");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_135"))
		{
			AI_Teleport	(hero, "PLATT_136");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_136"))
		{
			AI_Teleport	(hero, "PLATT_137");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_137"))
		{
			AI_Teleport	(hero, "PLATT_138");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_138"))
		{
			AI_Teleport	(hero, "PLATT_139");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_139"))
		{
			AI_Teleport	(hero, "PLATT_140");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_140"))
		{
			AI_Teleport	(hero, "PLATT_141");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_141"))
		{
			AI_Teleport	(hero, "PLATT_142");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_142"))
		{
			AI_Teleport	(hero, "PLATT_143");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_143"))
		{
			AI_Teleport	(hero, "PLATT_144");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_144"))
		{
			AI_Teleport	(hero, "PLATT_145");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_145"))
		{
			AI_Teleport	(hero, "PLATT_146");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_146"))
		{
			AI_Teleport	(hero, "PLATT_147");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_147"))
		{
			AI_Teleport	(hero, "PLATT_148");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_148"))
		{
			AI_Teleport	(hero, "PLATT_149");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_149"))
		{
			AI_Teleport	(hero, "PLATT_150");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_150"))
		{
			AI_Teleport	(hero, "PLATT_151");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_151"))
		{
			AI_Teleport	(hero, "PLATT_152");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_152"))
		{
			AI_Teleport	(hero, "PLATT_153");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_153"))
		{
			AI_Teleport	(hero, "PLATT_154");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_154"))
		{
			AI_Teleport	(hero, "PLATT_155");
		}
		else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "PLATT_155"))
		{
			AI_Teleport	(hero, "ENDE");
		};
	}
	else
	{
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